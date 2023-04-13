import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Settings extends KFDrawerContent {
  Settings({
    Key? key,
  });

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
      ),
    ));
  }
}
