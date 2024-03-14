import 'dart:convert';

import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:flutter/material.dart';

class BankDetailsWidget extends StatefulWidget {
  @override
  _BankDetailsWidgetState createState() => _BankDetailsWidgetState();
}

class _BankDetailsWidgetState extends State<BankDetailsWidget> {
  var _expanded = false;
  List<ProfileDataModel> cdvBankDetails = [];
  final dbhelper = ProfileDatabase.instance;
  String? encodedPan, decodedPan, pan;

  @override
  void initState() {
    fetchAndSetBankDetails();
    super.initState();
  }

  fetchAndSetBankDetails() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvBankDetails.add(new ProfileDataModel(
        bankName: data['bank_name'],
        branchName: data['branch_name'],
        accountholdername: data['accountholdername'],
        accountno: data['accountno'],
        ifsccode: data['ifsccode'],
        micrcode: data['micrcode'],
        panNo: data['pan_no'],
      ));
    }
    cdvBankDetails.forEach((element) {
      setState(() {
        encodedPan = element.panNo;
      });
    });
    setState(() {
      decodedPan = utf8.decode(base64.decode(encodedPan!)).toUpperCase();
      pan = (decodedPan!.replaceAll(RegExp(r'[0-9]'), '*'));
      // for (int i = 0; i <= decodedPan.length - 4; i++) {
      //   pan = decodedPan.replaceAll('A', 'X');
      //   // pan = decodedPan.replaceAll(RegExp(r'^[a-zA-Z0-9]+$'), 'X');
      // }
    });

    print(encodedPan);
    print(decodedPan!.length);
    print(decodedPan);
    print(pan);
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
            'Bank Details',
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
            height: 170,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cdvBankDetails.length,
              itemBuilder: (_, index) {
                return Container(
                    child: Table(
                  children: [
                    TableRow(children: [
                      const Text(
                        'BANK NAME:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${cdvBankDetails[index].bankName}'),
                    ]),
                    TableRow(children: [
                      const Text(
                        'BRANCH NAME:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${cdvBankDetails[index].branchName}'),
                    ]),
                    TableRow(children: [
                      const Text(
                        'ACCOUNT HOLDER NAME: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          '${cdvBankDetails[index].accountholdername.toUpperCase()}'),
                    ]),
                    TableRow(children: [
                      const Text(
                        'ACCOUNT NO:	',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${cdvBankDetails[index].accountno}'),
                    ]),
                    TableRow(children: [
                      const Text(
                        'IFSC: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${cdvBankDetails[index].ifsccode}'),
                    ]),
                    TableRow(children: [
                      const Text(
                        'MICR: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${cdvBankDetails[index].micrcode}'),
                    ]),
                    TableRow(children: [
                      const Text(
                        'PAN: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(pan!),
                    ]),
                  ],
                ));
              },
            ),
          ),
      ],
    );
  }
}
