import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployementDetailsWidget extends StatefulWidget {
  @override
  _EmployementDetailsWidgetState createState() =>
      _EmployementDetailsWidgetState();
}

class _EmployementDetailsWidgetState extends State<EmployementDetailsWidget> {
  var _expanded = false;
  List<ProfileDataModel> cdvWorkExperienceList = [];
  final dbhelper = ProfileDatabase.instance;
  String? whetherWorking, source_of_income, fromTime, Totime;

  @override
  void initState() {
    fetchAndSetBankDetails();
    super.initState();
  }

  fetchAndSetBankDetails() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvWorkExperienceList.add(new ProfileDataModel(
        whetherWorking: data['whether_working'],
        whetherNocIssued: data['whether_noc_issued'],
        employername: data['employerName'],
        officecontactno: data['officecontactno'],
        officeaddress: data['officeaddress'],
        preferredTimeNishkamSeva: data['preferred_time_nishkam_seva'],
        nishkamSevaFrom: data['nishkam_seva_from'],
        sourceIncome: data['source_income'],
        incomeSource: data['income_source'],
        annualIncome: data['annual_income'],
      ));
    }

    cdvWorkExperienceList.forEach((element) {
      print('working' + element.whetherWorking.toString());
      if (element.whetherWorking == 'f') {
        setState(() {
          whetherWorking = 'No';
        });
      } else {
        setState(() {
          whetherWorking = 'Yes';
        });
      }

      if (element.nishkamSevaFrom != '') {
        setState(() {
          DateTime tempDate =
              DateFormat("hh:mm").parse(element.nishkamSevaFrom);
          var dateFormat =
              DateFormat("h:mm a"); // you can change the format here
          fromTime = dateFormat.format(tempDate);
        });
      } else {
        setState(() {
          fromTime = 'Not Given';
        });
      }

      if (element.preferredTimeNishkamSeva != '') {
        setState(() {
          DateTime tempDate =
              DateFormat("hh:mm").parse(element.preferredTimeNishkamSeva);
          var dateFormat =
              DateFormat("h:mm a"); // you can change the format here
          Totime = dateFormat.format(tempDate);
        });
      } else {
        setState(() {
          Totime = 'Not Given';
        });
      }
      print(element.incomeSource);
      print(element.annualIncome);
      print('income   ' + element.sourceIncome.toString());
      print('From' + element.nishkamSevaFrom);
      print('To' + element.preferredTimeNishkamSeva);
    });
  }

  var bold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          title: const Text(
            'Employment Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing: IconButton(
            icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ),
        if (_expanded)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: whetherWorking == 'No' ? 150 : 220,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cdvWorkExperienceList.length,
              itemBuilder: (_, index) {
                return Container(
                    child: Column(children: [
                  Table(
                    // border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        const Text(
                          'ARE YOU EMPLOYED ?	:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(whetherWorking!),
                      ]),
                    ],
                  ),
                  if (whetherWorking == 'Yes' || whetherWorking != null)
                    Table(children: [
                      TableRow(children: [
                        const Text(
                          'EMPLOYER NAME	:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(cdvWorkExperienceList[index]
                                        .employername
                                        .toString() ==
                                    'null' ||
                                cdvWorkExperienceList[index]
                                    .employername
                                    .toString()
                                    .isEmpty
                            ? 'NOT GIVEN'
                            : '${cdvWorkExperienceList[index].employername.toUpperCase()}'),
                      ]),
                      TableRow(
                        children: [
                          const Text(
                            'OFFICE PHONE NO:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(cdvWorkExperienceList[index]
                                      .officecontactno
                                      .toString()
                                      .isEmpty ||
                                  cdvWorkExperienceList[index]
                                          .officecontactno
                                          .toString() ==
                                      null
                              ? 'NOT GIVEN'
                              : '${cdvWorkExperienceList[index].officecontactno}'),
                        ],
                      ),
                      TableRow(children: [
                        const Text(
                          'ADDRESS OF EMPLOYER:  ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(cdvWorkExperienceList[index]
                                    .officeaddress
                                    .toString()
                                    .isEmpty ||
                                cdvWorkExperienceList[index]
                                        .officeaddress
                                        .toString() ==
                                    'null'
                            ? 'NOT GIVEN'
                            : '${cdvWorkExperienceList[index].officeaddress}'),
                      ]),
                      TableRow(children: [
                        const Text(
                          'PREFENCE TIMING FOR \nNISHKAM SEWA	:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
                            Text(cdvWorkExperienceList[index].nishkamSevaFrom ==
                                        '' ||
                                    cdvWorkExperienceList[index]
                                            .preferredTimeNishkamSeva ==
                                        ''
                                ? 'NOT GIVEN'
                                : fromTime! + ' : ' + Totime!),
                          ],
                        ),
                      ]),
                    ])
                ]));
              },
            ),
          ),
      ],
    );
  }
}
