import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:cdv/services/date_time_formatting.dart';
import 'package:flutter/material.dart';

class KinsDetailsWidget extends StatefulWidget {
  @override
  _KinsDetailsWidgetState createState() => _KinsDetailsWidgetState();
}

class _KinsDetailsWidgetState extends State<KinsDetailsWidget> {
  var _expanded = false;
  List<ProfileDataModel> cdvKinDetailsList = [];
  final dbhelper = ProfileDatabase.instance;
  String? relationKin, ownVehicle;

  @override
  void initState() {
    fetchAndSetBankDetails();
    super.initState();
  }

  fetchAndSetBankDetails() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvKinDetailsList.add(new ProfileDataModel(
        nameofkin: data['nameofkin'],
        dobofkin: data['dobofkin'],
        relationwithkin: data['relationwithkin'],
        kinMobileNo: data['kin_mobile_no'],
        kinPresentAddress: data['kin_present_address'],
        kinPermanentAddress: data['kin_permanent_address'],
      ));

      cdvKinDetailsList.forEach((element) {
        if (element.relationwithkin == '1') {
          setState(() {
            relationKin = 'Father';
          });
        } else if (element.relationwithkin == '2') {
          setState(() {
            relationKin = 'Mother';
          });
        } else if (element.relationwithkin == '3') {
          setState(() {
            relationKin = 'Spouse';
          });
        } else if (element.relationwithkin == '4') {
          setState(() {
            relationKin = 'Son';
          });
        } else if (element.relationwithkin == '5') {
          setState(() {
            relationKin = 'Daughter';
          });
        } else if (element.relationwithkin == '6') {
          setState(() {
            relationKin = 'Brother';
          });
        } else {
          setState(() {
            relationKin = 'Sister';
          });
        }
      });
    }
  }

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
            'Kin Details',
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
            height: 250,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cdvKinDetailsList.length,
              itemBuilder: (_, index) {
                return Container(
                  child: Table(
                    children: [
                      TableRow(children: [
                        const Text(
                          'NAME OF NEXT OF KIN	: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '${cdvKinDetailsList[index].nameofkin.toUpperCase()}'),
                      ]),
                      TableRow(children: [
                        const Text(
                          'DOB: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        DateFormatting(cdvKinDetailsList[index].dobofkin),
                      ]),
                      TableRow(children: [
                        const Text(
                          'KIN MOBILE NUMBER: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('+91 ${cdvKinDetailsList[index].kinMobileNo}'),
                      ]),
                      TableRow(children: [
                        const Text(
                          'RELATIONSHIP WITH APPLICANT	: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(relationKin!.toUpperCase()),
                      ]),
                      TableRow(children: [
                        const Text(
                          'PERMANENT ADDRESS	: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(cdvKinDetailsList[index]
                                .kinPermanentAddress
                                .isEmpty
                            ? 'NOT GIVEN'
                            : cdvKinDetailsList[index].kinPermanentAddress ==
                                    'null'
                                ? 'NOT GIVEN'
                                : '${cdvKinDetailsList[index].kinPresentAddress.toUpperCase()}'),
                      ]),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
