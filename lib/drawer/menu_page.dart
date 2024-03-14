import 'package:cdv/database/profile_database.dart';
import 'package:cdv/drawer/menu_item_model.dart';
import 'package:cdv/drawer/menu_items.dart';
import 'package:cdv/screens/login_screen.dart';
import 'package:cdv/services/repPainter_new.dart';
import 'package:cdv/services/rpsPainter.dart';
import 'package:cdv/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatelessWidget {
  final MenuItemModel currentItem;
  final ValueChanged<MenuItemModel> onSelectedItem;
  MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  final dbhelper = ProfileDatabase.instance;

  void deletedataAll() async {
    var id = await dbhelper.deletedataAll();
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f0c5),
      body: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width / 1.4,
                MediaQuery.of(context).size.height),
            painter: RPSCustomPainter(Colors.deepOrange[600]!),
          ),
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width / 1.5,
                MediaQuery.of(context).size.height),
            painter: RPSCustomPainternew(Colors.red[800]!),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.only(left: 20),
                  elevation: 20,
                  child: Container(
                    height: 150,
                    width: 150,
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,
                    child: ProfileImageWidget(imageHeight: 100),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ...MenuItems.all.map(buildMenuItem).toList(),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.remove('mobilenumber');
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen(),
                        ),
                      );
                      deletedataAll();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(MenuItemModel item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          // selectedTileColor: Colors.black26,
          selected: currentItem == item,
          leading: Icon(
            item.icon,
            color: Colors.white,
          ),
          title: Text(
            item.banner,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () => onSelectedItem(item),
        ),
      );
}
