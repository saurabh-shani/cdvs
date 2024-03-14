import 'package:cdv/database/profile_database.dart';
import 'package:cdv/drawer/menu_item_model.dart';
import 'package:cdv/drawer/menu_items.dart';
import 'package:cdv/drawer/menu_page.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:cdv/screens/home_screen.dart';
import 'package:cdv/screens/notice_screen.dart';
import 'package:cdv/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  MenuItemModel currentItem = MenuItems.profilecard;

  final dbhelper = ProfileDatabase.instance;
  int? applicatioNo;
  List<ProfileDataModel> cdvApplicationnoList = [];

  void deletedataAll() async {
    var id = await dbhelper.deletedataAll();
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 40,
      angle: 0,
      showShadow: true,
      backgroundColor: Colors.red[800]!,
      // Colors.red[800]!,
      slideWidth: MediaQuery.of(context).size.width * 0.7,
      style: DrawerStyle.Style1, //Here Drawer style can be changed
      menuScreen: Builder(
        builder: (context) => MenuPage(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
          },
        ),
      ),
      mainScreen: getScreen(),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.profilecard:
        return const HomeScreen();
      case MenuItems.profile:
        return ProfileScreen();

      default:
        return NoticeScreen();
    }
  }
}
