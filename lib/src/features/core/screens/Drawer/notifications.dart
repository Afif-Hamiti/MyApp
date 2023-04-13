import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../../../../constants/image_strings.dart';

class Notifications extends KFDrawerContent {
  @override
  // ignore: library_private_types_in_public_api
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
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
