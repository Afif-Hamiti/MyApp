import 'package:MyMedice/src/features/home/screens/home.dart';
import 'package:MyMedice/src/features/core/screens/Drawer/notifications.dart';
import 'package:MyMedice/src/features/map/screens/map.dart';
import 'package:MyMedice/src/features/profile/screens/profile.dart';
import 'package:MyMedice/src/features/core/screens/Drawer/settings.dart';
import 'package:MyMedice/src/features/search/screens/search.dart';

typedef Constructor<T> = T Function();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<Profile>(() => Profile());
    register<Notifications>(() => Notifications());
    register<SearchPage>(() => SearchPage());
    register<TMap>(() => TMap());
    register<Settings>(() => Settings());
  }

  static dynamic fromString(String type) {
    return _constructors[type]!();
  }
}