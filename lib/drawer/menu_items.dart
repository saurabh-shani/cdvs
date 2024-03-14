import 'package:cdv/drawer/menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuItems {
  static const profilecard = MenuItemModel('Home Page', Icons.home_outlined);
  static const profile =
      MenuItemModel('Profile', Icons.account_circle_outlined);
  static const notices = MenuItemModel('Notice', Icons.assignment_outlined);

  static const all = <MenuItemModel>[
    profilecard,
    profile,
    notices,
  ];
}
