import 'package:MyMedice/src/features/authentication/screens/Welcome/welcome_screen.dart';
import 'package:MyMedice/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:MyMedice/src/features/core/controllers/main_pages_controller.dart';
import 'package:MyMedice/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //* Varibles
  final _auth = FirebaseAuth.instance; // object  mn FirebaseAuth
  late final Rx<User?> firebaseUser;
  late UserCredential userCredential;
  User? user = FirebaseAuth.instance.currentUser;
  var verificationId = ''.obs;
//Will be load when app launches this func will be called and set the firebaseUser state
   @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const SplashScreen())
        : Get.offAll(() => const MainWidget());
  }

//* signup with email and password
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Get.offAll(() => const MainWidget());
        Get.snackbar('Success', 'Your account has been created',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green);
      } else {
        Get.off(() => const WelcomeScreen());
      }
      //* hna fi halat password kan fible wela account deja kyn aya ysra katch
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      Get.snackbar('Error', ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      Get.snackbar('Error', ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);

      throw ex;
    }
  }

  //*Login with email and password
  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      Get.snackbar('Success', 'Login Successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
      Get.offAll(() => const MainWidget());

      //* hna fi halat kan password wela email khati2  wela user ga3 makanch fe database  aya ysra catch
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', 'Wrong Password or Email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    } catch (_) {}
  }

//* LogOut
  Future<void> logout() async {
    Get.defaultDialog(
      title: "LOGOUT",
      titleStyle: const TextStyle(fontSize: 20),
      content: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Text("Are you sure, you want to Logout?"),
      ),
      confirm: Expanded(
        child: ElevatedButton(
          onPressed: () async {
            _auth.signOut();
            await Get.off(() => const WelcomeScreen());
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent, side: BorderSide.none),
          child: const Text("Yes"),
        ),
      ),
      cancel:
          OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
    );
  }
  //*Login with Googele
  Future<UserCredential> signInwithGoogle() async {
    // Trigger the Google Authentication flow.
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create a new credential.
    final googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(googleCredential);
  }

  //* rest Password with email
  Future<void> emailAuthentication(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password Reset Email sent ',
          colorText: Colors.green,
          backgroundColor: Colors.green.withOpacity(0.1));
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code,
          colorText: Colors.red, backgroundColor: Colors.red.withOpacity(0.1));
    }
  }

  //* rest Password with phone number
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid',
                colorText: Colors.red,
                backgroundColor: Colors.red.withOpacity(0.1));
          } else {
            Get.snackbar('Error', 'Somthing went wrong.Try Again',
                colorText: Colors.red,
                backgroundColor: Colors.red.withOpacity(0.1));
          }
        },
        codeSent: ((verificationId, resendingToken) {
          this.verificationId.value = verificationId;
        }),
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }
    //* verify OTP Code
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}
