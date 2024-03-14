import 'package:cdv/Widgets/profile_image_widget.dart';
import 'package:cdv/drawer/menu_widget.dart';
import 'package:cdv/widgets/address_details_widget.dart';
import 'package:cdv/widgets/bank_details_widget.dart';
import 'package:cdv/widgets/educational_details_widget.dart';
import 'package:cdv/widgets/employement_details_widget.dart';
import 'package:cdv/widgets/kins_details_widge.dart';
import 'package:cdv/widgets/personal_details_widget.dart';
import 'package:cdv/widgets/previous_details_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/Profile-Screen';

  final List pages = [
    PersonalDetailsWidget(), // Personal Details
    EducationalDetailsWidget(), // Educational Details
    EmployementDetailsWidget(), // Employement Details
    BankDetailsWidget(), // Bank Details
    AddressDetailsWidget(), // Address Details
    KinsDetailsWidget(), // Kin's Details
    PreviousDetailsWidget(), // Perivious Details
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        leading: MenuWidget(),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.red[900]!,
              Colors.red[800]!,
              Colors.red[400]!,
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: ProfileImageWidget(imageHeight: 100),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(
                      bottom: 10,
                      left: 15,
                      right: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: pages[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
