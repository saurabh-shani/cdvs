import 'dart:convert';

import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/notice_list_model.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:cdv/screens/notice_details_screen.dart';
import 'package:cdv/services/date_time_formatting.dart';
import 'package:cdv/widgets/no_available_notice_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppliedNoticesWidget extends StatefulWidget {
  const AppliedNoticesWidget({Key? key}) : super(key: key);

  @override
  State<AppliedNoticesWidget> createState() => _AppliedNoticesWidgetState();
}

class _AppliedNoticesWidgetState extends State<AppliedNoticesWidget> {
  String? _chosenValue;
  String? noticeIds;
  String? dutyTypes;
  var resbody;
  int? applicatioNo;
  List<ProfileDataModel> cdvApplicationnoList = [];
  final dbhelper = ProfileDatabase.instance;
  bool isHaveNotice = false;
  List newNotice = [];
  List sortedNoticeList = [];
  List<String> itemList = [
    'All Notices',
    'Nishkam Sewa Notices',
    'Paid Duty below 30 Days',
    'Paid Duty above 30 Days',
  ];

  @override
  void initState() {
    super.initState();

    // applicatioNo = widget.appNo;

    nishkamSewaNoticeListFromApi();
  }

  Future<void> nishkamSewaNoticeListFromApi() async {
    var url = Uri.parse(
        'some api');
    try {
      final response = await http.post(url,
          body: jsonEncode(
            {
              "applicationno": 62857 //applicatioNo, //68853,
            },
          ),
          headers: {"content-type": "application/json"});

      setState(() {
        resbody = json.decode(response.body);
      });
      print(resbody);
      if (resbody == 1) {
        setState(() {
          newNotice = [];
        });

        print(isHaveNotice);
      } else {
        for (var data in resbody) {
          newNotice.add(
            new NoticeListModel(
              id: data["id"],
              jobDescription: data["job_description"],
              advToDate: data["adv_to_date"],
              dutyType: data["duty_type"],
            ),
          );
        }
      }
    } catch (e) {
      print(e);
    }

    newNotice.forEach((element) async {
      //for Duty type
      if (element.dutyType == "N") {
        setState(() {
          dutyTypes = 'Nishkam Sewa Duty';
        });
      } else if (element.dutyType == "P") {
        setState(() {
          dutyTypes = 'Paid Callout Duty upto 30 days';
        });
      } else if (element.trainingCritera == "A") {
        setState(() {
          dutyTypes = 'Paid Callout Duty above 30 days';
        });
      } else {
        setState(() {
          dutyTypes = 'Not Given';
        });
      }
    });
  }

  void filterList(String? chosenValue) {
    if (chosenValue == 'All Notices') {
      setState(() {
        sortedNoticeList = newNotice;
      });
    } else if (chosenValue == 'Nishkam Sewa Notices') {
      setState(() {
        sortedNoticeList = newNotice.where((dt) => dt.dutyType == 'N').toList();
      });
    } else if (chosenValue == 'Paid Duty below 30 Days') {
      setState(() {
        sortedNoticeList = newNotice.where((dt) => dt.dutyType == 'P').toList();
      });
    } else if (chosenValue == 'Paid Duty above 30 Days') {
      setState(() {
        sortedNoticeList = newNotice.where((dt) => dt.dutyType == 'A').toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (resbody == null)
          SizedBox(
            height: 500,
            child: Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            ),
          ),
        if (resbody != null)
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: 40,
            width: double.infinity,
            child: DropdownButton<String>(
              elevation: 0,
              isExpanded: true,
              items: itemList
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  _chosenValue = item;
                  filterList(_chosenValue);
                });
              },
              value: _chosenValue,
              hint: Text('Please select a type'),
            ),
          ),
        if (resbody != null && sortedNoticeList.isNotEmpty && resbody != 1)
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Notice\nId',
                  textAlign: TextAlign.center,
                ),
                Text('Notice Description'),
                Text(
                  'Last Date\nto Apply',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        if (resbody == 1) NoAvailableNoticeWidget(),
        if (resbody != 1)
          Expanded(
            child: sortedNoticeList.isEmpty
                ? NoAvailableNoticeWidget()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: sortedNoticeList.length,
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: <Widget>[
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              leading: Text(sortedNoticeList[i].id.toString()),
                              title: Text(
                                sortedNoticeList[i].jobDescription,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              trailing:
                                  DateFormatting(sortedNoticeList[i].advToDate),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  NoticeDetailScreen.routeName,
                                  arguments: {
                                    'notice_type': 'Applied Notices',
                                    'notice_id': sortedNoticeList[i].id,
                                    'appNo': 62857, //applicatioNo,
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
      ],
    );
  }
}
