import 'package:ff_chat/side_menu_list.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class bagis extends StatefulWidget {
  const bagis({super.key});

  @override
  State<bagis> createState() => _bagisState();
}

class _bagisState extends State<bagis> {
  final GlobalKey<SideMenuState> SideMenuKey = GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: SideMenuKey,
      menu: SideMenuList(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (SideMenuKey.currentState!.isOpened) {
                SideMenuKey.currentState!.closeSideMenu();
              } else {
                SideMenuKey.currentState!.openSideMenu();
              }
            },
            icon: Icon(Icons.menu),
          ),
          title: Text("data"),
          centerTitle: true,
        ),
      ),
    );
  }
}
