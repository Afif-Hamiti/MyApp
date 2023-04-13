import 'package:MyMedice/src/constants/image_strings.dart';
import 'package:MyMedice/src/constants/text_strings.dart';
import 'package:MyMedice/src/features/home/screens/home.dart';
import 'package:MyMedice/src/features/profile/screens/profile.dart';
import 'package:MyMedice/src/features/map/screens/map.dart';
import 'package:MyMedice/src/features/core/screens/Drawer/settings.dart';
import 'package:MyMedice/src/features/search/screens/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kf_drawer/kf_drawer.dart';
import '../../authentication/controllers/logout_controller.dart';
import 'pages_controller.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;
  final controller = Get.put(LogoutController());

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString(tHome),
      items: [
        KFDrawerItem.initWithPage(
          text: const Text(tHome,
              style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: const Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            tProfile,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.account_box, color: Colors.white),
          page: Profile(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            tNotifications,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.notifications_active, color: Colors.white),
          page: ClassBuilder.fromString(tNotifications),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            tSearch,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.search, color: Colors.white),
          page: SearchPage(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            tLocation,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.location_on, color: Colors.white),
          page: TMap(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            tSettings,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.settings, color: Colors.white),
          page: Settings(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                          image: AssetImage(tProfileImagePlaceHolder),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(tProfileHeading,
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                    const SizedBox(height: 2),
                    Text(user!.email.toString(),
                        style: const TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: GestureDetector(
            onTap: () => LogoutController.instance.logout(),
            child: const Text(
              tLogout,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(15, 30, 60, 1.0),
              Color.fromRGBO(15, 30, 60, 1.0)
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
