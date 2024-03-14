import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:cdv/services/date_time_formatting.dart';
import 'package:flutter/material.dart';

class PersonalDetailsWidget extends StatefulWidget {
  const PersonalDetailsWidget({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsWidget> createState() => _PersonalDetailsWidgetState();
}

class _PersonalDetailsWidgetState extends State<PersonalDetailsWidget> {
  var _expanded = false;
  List<ProfileDataModel> cdvProfile = [];
  final dbhelper = ProfileDatabase.instance;
  String? maritialStatus;
  String? gender;
  String? encodedAaddhar;
  var isMarried = false;

  @override
  void initState() {
    fetchAndSetProfile();
    super.initState();
  }

  fetchAndSetProfile() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvProfile.add(new ProfileDataModel(
        profileImage: data['profile_image'],
        applicantname: data['applicantname'],
        applicantfathername: data['applicantfathername'],
        applicantmothername: data['applicantmothername'],
        maritalStatus: data['marital_status'],
        applicanthusbandname: data['applicanthusbandname'],
        applicantmobileno: data['applicantmobileno'],
        applicantgender: data['applicantgender'],
        email: data['email'],
        aadhaarno: data['aadhaarno'],
        gen_number: data['gen_number'],
        applicantdob: data['applicantdob'],
        heightcms: data['heightcms'],
        heightfeet: data['heightfeet'],
        heightinch: data['heightinch'],
      ));
    }
    cdvProfile.forEach((element) {
      if (element.maritalStatus.toString() == '1') {
        setState(() {
          maritialStatus = 'Married';
        });
      } else if (element.maritalStatus.toString() == '2') {
        setState(() {
          maritialStatus = 'Unmarried';
          isMarried = !isMarried;
        });
      } else if (element.maritalStatus.toString() == '3') {
        setState(() {
          maritialStatus = 'Divorced';
          isMarried = !isMarried;
        });
      } else {
        setState(() {
          maritialStatus = 'Widow/Widower';
          isMarried = !isMarried;
        });
      }

      if (element.applicantgender.toString() == 'M') {
        setState(() {
          gender = 'Male';
        });
      } else {
        setState(() {
          gender = 'Female';
        });
      }
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
            'Personal Details',
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
            height: MediaQuery.of(context).size.height / 3.4,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cdvProfile.length,
              itemBuilder: (_, index) {
                return Table(
                  // border: TableBorder.all(color: Colors.black),
                  children: [
                    TableRow(children: [
                      Text(
                        'NAME:',
                        style: bold,
                      ),
                      Text('${cdvProfile[index].applicantname.toUpperCase()}'),
                    ]),
                    TableRow(
                      children: [
                        Text(
                          'MARITIAL STATUS:',
                          style: bold,
                        ),
                        Text(maritialStatus!.toUpperCase()),
                      ],
                    ),
                    TableRow(children: [
                      Text(
                        'GENDER:',
                        style: bold,
                      ),
                      Text(gender!.toUpperCase()),
                    ]),
                    TableRow(children: [
                      Text(
                        'DOB:',
                        style: bold,
                      ),
                      DateFormatting(
                          cdvProfile[index].applicantdob.toUpperCase()),
                    ]),
                    TableRow(children: [
                      Text(
                        "FATHER'S NAME:",
                        style: bold,
                      ),
                      Text(
                          '${cdvProfile[index].applicantfathername.toUpperCase()}'),
                    ]),
                    TableRow(children: [
                      Text(
                        "MOTHER'S NAME:",
                        style: bold,
                      ),
                      Text(
                          '${cdvProfile[index].applicantmothername.toUpperCase()}'),
                    ]),

                    if (isMarried == false)
                      TableRow(children: [
                        Text(
                          'SPOUSE NAME:',
                          style: bold,
                        ),
                        Text(
                            '${cdvProfile[index].applicanthusbandname.toUpperCase()}'),
                      ]),
                    TableRow(
                      children: [
                        Text(
                          'MOBILE NUMBER:',
                          style: bold,
                        ),
                        Text(
                            '+91 ${cdvProfile[index].applicantmobileno.toUpperCase()}'),
                      ],
                    ),

                    TableRow(
                      children: [
                        Text(
                          'EMAIL:  ',
                          style: bold,
                        ),
                        Text('${cdvProfile[index].email.toUpperCase()}'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'HEIGHT(in cm):  ',
                          style: bold,
                        ),
                        Text('${cdvProfile[index].heightcms.toUpperCase()} cm'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          'HEIGHT:  ',
                          style: bold,
                        ),
                        Text(
                            'Feet: ${cdvProfile[index].heightfeet}    Inches: ${cdvProfile[index].heightinch}'),
                      ],
                    ),
                    // TableRow(children: [
                    //   Text('DATE OF RENEWAL:'),
                    //   Text('data'),
                    //   // Text('${cdvProfileCardDetails[index].upcoming_renewal}'),
                    // ]),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
}
