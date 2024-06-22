import 'dart:core';
import 'package:ff_chat/sayfalar/bagis.dart';
import 'package:ff_chat/sayfalar/grupsohbet.dart';
import 'package:ff_chat/sayfalar/hakkimizda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SideMenuList extends StatefulWidget {
  const SideMenuList({super.key});

  @override
  State<SideMenuList> createState() => _SideMenuListState();
}

class _SideMenuListState extends State<SideMenuList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(
              maxRadius: 40,
              backgroundImage: NetworkImage(
                  "https://maarifder.com/bisensei/img/bagislar/maarif-dernegi-bagis.jpg"),
            ),
            title: Text(
              "Bağış Uygulaması",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(
            color: Colors.amber,
            height: 10,
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const bagis(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.attach_money),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Bağış Sayfası",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Grupsohbet(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.chat),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Bağışlar ve Sohbet",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const hakkimizda(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.person),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Hakkımızda",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              SystemNavigator.pop();
            },
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.logout),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "Çıkış Yap",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
