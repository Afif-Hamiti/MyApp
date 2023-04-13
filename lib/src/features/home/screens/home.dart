import 'package:MyMedice/src/constants/image_strings.dart';
import 'package:MyMedice/src/constants/text_strings.dart';
import 'package:MyMedice/src/features/home/models/tabs_model.dart';
import 'package:MyMedice/src/features/home/screens/home_tabs/tab_drops.dart';
import 'package:MyMedice/src/features/home/screens/home_tabs/tab_injection.dart';
import 'package:MyMedice/src/features/home/screens/home_tabs/tab_pomade.dart';
import 'package:MyMedice/src/features/home/screens/home_tabs/tab_suyro.dart';
import 'package:MyMedice/src/features/home/screens/home_tabs/tab_tablets.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Home extends KFDrawerContent {
  Home({
    Key? key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> myTabs = const [
    TabsModel(
      icon: tSuyro,
    ),
    TabsModel(
      icon: tTablets,
    ),
    TabsModel(
      icon: tInjection,
    ),
    TabsModel(
      icon: tDrops,
    ),
    TabsModel(
      icon: tPomad,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(tHome),
          centerTitle: true,
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
            child: Material(
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: widget.onMenuPressed,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                child: Material(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  child: Image.asset(
                    tProfileImagePlaceHolder,
                    height: 44,
                    width: 44,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
                child: Row(
                  children: [
                    Text(
                      tHomeHeadline,
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                    const Text(
                      tMedical,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // tab bar
              TabBar(
                tabs: myTabs,
                mouseCursor: MouseCursor.defer,
              ),
              // tab bar view
              Expanded(
                child: TabBarView(
                  children: [
                    SuyroTab(),
                    TabletsTab(),
                    InjectionTab(),
                    DropsTab(),
                    PomadTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}







//
