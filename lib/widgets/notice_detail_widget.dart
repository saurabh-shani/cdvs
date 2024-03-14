import 'dart:convert';
import 'dart:io';

import 'package:cdv/models/notice_detail_model.dart';
import 'package:cdv/services/date_time_formatting.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeDetailWidget extends StatefulWidget {
  final noticeType;
  final noticeId;
  final flag;

  const NoticeDetailWidget(
      {Key? key, this.noticeType, this.noticeId, this.flag})
      : super(key: key);

  @override
  _NoticeDetailWidgetState createState() => _NoticeDetailWidgetState();
}

class _NoticeDetailWidgetState extends State<NoticeDetailWidget> {
  int? noticeIds;
  int? appNumber;
  String? dutyTypes;
  String? trainingCriteria;
  int? notice;
  var detailsResbody, applyResbody;
  List skillCodeList = [];
  final List<NoticeDetailModel> nishkamsewaDetailsList = [];
  String? highestQualification;
  String? deviceId;
  @override
  void initState() {
    super.initState();
    _getId();
    noticeIds = widget.noticeId;
    appNumber = 62857;
    notice = widget.flag;
    nishkamSewaDetailsFromApi();
    print(widget.noticeId);
  }

  Future<void> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceId = iosDeviceInfo.identifierForVendor;
      }); // Unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceId = androidDeviceInfo.androidId;
      }); // Unique ID on Android
    }
  }

  Future<void> nishkamSewaDetailsApplyApi() async {
    var url = Uri.parse(
        'some api');
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "notice_id": noticeIds,
            "applicationno": appNumber,
            "ip": deviceId,
          }),
          headers: {"content-type": "application/json"});
      print('res' + response.body);

      setState(() {
        applyResbody = json.encode(response.body).replaceAll(RegExp('"'), '');
      });
    } catch (e) {
      print('error' + e.toString());
    }

    print('apply' + applyResbody.toString());

    alertAfterApply(applyResbody);
  }

  alertAfterApply(applyResbody) {
    String withoutEquals = applyResbody;

    if (applyResbody ==
        "{'notice':{'text' : 'Notice has already applied by you.'}}") {
      withoutEquals = 'You have already applied for this notice';
    } else {
      print(applyResbody);
      withoutEquals = 'You have applied for this notice successfully';
    }
    // CDV applied for notice successfully
    print(withoutEquals);
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Successfully',
          textAlign: TextAlign.center,
        ),
        content: Text(
          withoutEquals,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // Navigator.of(ctx).pop();
                  // // Navigator.of(ctx).pushReplacement(TryScreen.routeName);
                  // Navigator.of(context).pushReplacementNamed(
                  //   AppliedNoticeScreen.routeName,
                  //   arguments: {
                  //     "application": appNumber,
                  //   },
                  // );
                },
                color: Colors.blue,
                elevation: 20,
              ),
            ],
          )
        ],
        backgroundColor: Colors.green[100],
        elevation: 50,
      ),
    );
  }

  void skillCodeToString(String codes) {
    if (codes == '6') {
      skillCodeList.add('Computer Programmer');
    } else if (codes == '7') {
      skillCodeList.add('Computer Hardware Technician');
    } else if (codes == '8') {
      skillCodeList.add('Steno');
    } else if (codes == '9') {
      skillCodeList.add('Librarian');
    } else if (codes == '10') {
      skillCodeList.add('Draftsman');
    } else if (codes == '12') {
      skillCodeList.add('Motor Mechanic');
    } else if (codes == '13') {
      skillCodeList.add('Auto Electrician');
    } else if (codes == '14') {
      skillCodeList.add('Cobbler');
    } else if (codes == '15') {
      skillCodeList.add('Tailor');
    } else if (codes == '16') {
      skillCodeList.add('Plumber');
    } else if (codes == '17') {
      skillCodeList.add('Carpenter');
    } else if (codes == '18') {
      skillCodeList.add('Electrician');
    } else if (codes == '19') {
      skillCodeList.add('Mason');
    } else if (codes == '20') {
      skillCodeList.add('Dhobi');
    } else if (codes == '21') {
      skillCodeList.add('Barber');
    } else if (codes == '22') {
      skillCodeList.add('Painter');
    } else if (codes == '23') {
      skillCodeList.add('Gardener');
    } else if (codes == '25') {
      skillCodeList.add('Welder');
    } else if (codes == '26') {
      skillCodeList.add('Computer Operator');
    } else if (codes == '27') {
      skillCodeList.add('Band Man (PIPE)');
    } else if (codes == '28') {
      skillCodeList.add('Mobile Reparing');
    } else if (codes == '29') {
      skillCodeList.add('Hacker Ethical');
    } else if (codes == '30') {
      skillCodeList.add('Typist');
    } else if (codes == '31') {
      skillCodeList.add('Software Engineer');
    } else if (codes == '32') {
      skillCodeList.add('Mobile App Developer');
    } else if (codes == '11') {
      skillCodeList.add('Band Man(BRASS)');
    } else {
      skillCodeList.add('Others');
    }
  }

  Future<void> nishkamSewaDetailsFromApi() async {
    var url = Uri.parse(
        'some api');
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "notice_id": noticeIds,
          }),
          headers: {"content-type": "application/json"});
      print(response.body);
      setState(() {
        detailsResbody = json.decode(response.body);
      });
    } catch (e) {
      print(e);
    }

    print(detailsResbody);
    for (var data in detailsResbody) {
      nishkamsewaDetailsList.add(
        new NoticeDetailModel(
          id: data["id"],
          deployed_cdv: data["deployed_cdv"],
          reserve_cdv: data["reserve_cdv"],
          job_description: data["job_description"],
          area_locality: data["area_locality"],
          adv_to_date: data["adv_to_date"],
          date_created: data["date_created"],
          deployment_from_date: data["deployment_from_date"],
          deployment_to_date: data["deployment_to_date"],
          qualification: data["qualification"],
          ip: data["ip"],
          adv_to_time: data["adv_to_time"],
          districtcode: data["districtcode"],
          skill: data["skill"],
          sub_division: data["sub_division"],
          duty_type: data["duty_type"],
          min_height: data["min_height"],
          dm_id: data["dm_id"],
          latitude: data["latitude"],
          longitude: data["longitude"],
          address: data["address"],
          min_age: data["min_age"],
          training_critera: data["training_critera"],
          notice_level: data["notice_level"],
          map_location: data["map_location"],
          reportingtime: data["reportingtime"],
        ),
      );
    }

    nishkamsewaDetailsList.forEach((element) async {
      //for qualification
      if (element.qualification == 142) {
        setState(() {
          highestQualification = '5th';
        });
      } else if (element.qualification == 143) {
        setState(() {
          highestQualification = '6th';
        });
      } else if (element.qualification == 144) {
        setState(() {
          highestQualification = '7th';
        });
      } else if (element.qualification == 195) {
        setState(() {
          highestQualification = '8th';
        });
      } else if (element.qualification == 196) {
        setState(() {
          highestQualification = '9th';
        });
      } else if (element.qualification == 98) {
        setState(() {
          highestQualification = '10th';
        });
      } else if (element.qualification == 99) {
        setState(() {
          highestQualification = 'Higher Secondary';
        });
      } else if (element.qualification == 100) {
        setState(() {
          highestQualification = 'Graduation';
        });
      } else if (element.qualification == 101) {
        setState(() {
          highestQualification = 'Post Graduation';
        });
      } else if (element.qualification == 256) {
        setState(() {
          highestQualification = '4th';
        });
      } else if (element.qualification == null) {
        setState(() {
          highestQualification = 'Not Given';
        });
      } else {
        setState(() {
          highestQualification = 'Others';
        });
      }

      //for training
      if (element.training_critera == "U") {
        setState(() {
          trainingCriteria = 'Un-Trained';
        });
      } else if (element.training_critera == "U") {
        setState(() {
          trainingCriteria = 'Trained';
        });
      } else if (element.training_critera == "A") {
        setState(() {
          trainingCriteria = 'Any';
        });
      } else {
        setState(() {
          trainingCriteria = 'Not Given';
        });
      }

      //for Duty type
      if (element.duty_type == "N") {
        setState(() {
          dutyTypes = 'Nishkam Sewa Duty';
        });
      } else if (element.duty_type == "P") {
        setState(() {
          dutyTypes = 'Paid Callout Duty upto 30 days';
        });
      } else if (element.duty_type == "A") {
        setState(() {
          dutyTypes = 'Paid Callout Duty above 30 days';
        });
      } else {
        setState(() {
          dutyTypes = 'Not Given';
        });
      }

      //for skills
      var skillCodes = element.skill.toString();
      var splitcode = skillCodes.split(',');
      final Map<int, String> skillsValues = {
        for (int i = 0; i < splitcode.length; i++) i: splitcode[i]
      };

      for (int i = 0; i < skillsValues.length; i++) {
        skillCodeToString(skillsValues[i].toString());
      }
    });
  }

  var leftSide = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Card(
          margin: EdgeInsets.all(20),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red[800],
            ),
            child: Center(
              child: Text(
                //notice_type,
                ' Applied Nishkam Sewa \n Notice Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: nishkamsewaDetailsList.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Table(
                      columnWidths: {0: FractionColumnWidth(.4)},
                      border: TableBorder.all(color: Colors.black),
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Description :',
                              style: leftSide,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${nishkamsewaDetailsList[index].job_description}'),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Skills Needed :',
                              style: leftSide,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${skillCodeList.join('\n')}'),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Address :',
                              style: leftSide,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${nishkamsewaDetailsList[index].address}'),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Map Location :',
                              style: leftSide,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () async {
                                String googleUrl =
                                    'some api';
                                if (await canLaunch(googleUrl) != null) {
                                  await launch(googleUrl);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Could not open Map'),
                                    ),
                                  );
                                }
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Show on Map',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800],
                                    ),
                                  ),
                                  Icon(
                                    Icons.pin_drop_outlined,
                                    color: Colors.blue[800],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                        // TableRow(children: [
                        //   Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(
                        //       'Minimum Qualification :',
                        //       style: leftSide,
                        //     ),
                        //   ),
                        //   Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(highestQualification),
                        //   ),
                        // ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Last Date of Advertisement :',
                              style: leftSide,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DateFormatting(
                                nishkamsewaDetailsList[index].adv_to_date),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Deployment Start Date :',
                              style: leftSide,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DateFormatting(nishkamsewaDetailsList[index]
                                .deployment_from_date),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Deployment End Date :',
                              style: leftSide,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DateFormatting(nishkamsewaDetailsList[index]
                                .deployment_to_date),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Reporting Time :',
                              style: leftSide,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TimeFormatting(
                                timefromApi: nishkamsewaDetailsList[index]
                                    .reportingtime),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Duty Type :',
                              style: leftSide,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(dutyTypes!),
                          ),
                        ]),
                        // TableRow(children: [
                        //   Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(
                        //       'Minimum Age (Yrs) :',
                        //       style: leftSide,
                        //     ),
                        //   ),
                        //   Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text('${nishkamsewaDetailsList[index].minAge}'),
                        //   ),
                        // ]),
                        // TableRow(children: [
                        //   Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(
                        //       'Minimum Height in cms :',
                        //       style: leftSide,
                        //     ),
                        //   ),
                        //   Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child:
                        //         Text('${nishkamsewaDetailsList[index].minHeight}'),
                        //   ),
                        // ]),
                        // TableRow(children: [
                        //   Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(
                        //       'Training Criteria :',
                        //       style: leftSide,
                        //     ),
                        //   ),
                        //   Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(trainingCriteria),
                        //   ),
                        // ]),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (notice != 1)
                      RaisedButton(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          alertToApply();
                          // nishkamSewaDetailsApplyApi();
                        },
                        child: Text(
                          'Apply for the Duty',
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  alertToApply() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          '!! ALERT !!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Are you sure want to apply for this Sewa?',
        ),
        actions: <Widget>[
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Text(
              'YES',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              nishkamSewaDetailsApplyApi();
            },
            color: Colors.green,
            elevation: 20,
          ),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Text(
              'NO',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.red,
            elevation: 20,
          ),
        ],
        backgroundColor: Colors.green[100],
        elevation: 50,
      ),
    );
  }
}
