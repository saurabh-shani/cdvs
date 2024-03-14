import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:cdv/widgets/applied_notices_widget.dart';
import 'package:cdv/widgets/new_notices_widget.dart';
import 'package:flutter/material.dart';

import '../drawer/menu_widget.dart';

class NoticeScreen extends StatelessWidget {
  NoticeScreen({Key? key}) : super(key: key);

  static const routeName = '/Notice-Screen';
  final dbhelper = ProfileDatabase.instance;
  String? applicatioNo;
  List<ProfileDataModel> cdvApplicationnoList = [];

  getapplicatioNo() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvApplicationnoList.add(new ProfileDataModel(
        // applicationno: int.parse(data['applicationno']),
        applicationno: data['applicationno'],
      ));
    }
    cdvApplicationnoList.forEach((element) {
      applicatioNo = element.applicationno;
    });
  }

  @override
  Widget build(BuildContext context) {
    getapplicatioNo();
    print('app' + applicatioNo.toString());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: const Text('Notice Screen'),
          leading: const MenuWidget(),
          centerTitle: true,
          backgroundColor: Colors.red[900],
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.red[800],
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: Colors.white),
            tabs: [
              Container(
                height: 30,
                child: Center(
                  child: Text(
                    'New Notices',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: 30,
                child: Center(
                  child: Text(
                    'Applied Notices',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
          child: TabBarView(
            children: <Widget>[
              //First Tab
              NewNoticesWidget(),

              //Second Tab
              AppliedNoticesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
