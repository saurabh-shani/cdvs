import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:flutter/material.dart';

class AddressDetailsWidget extends StatefulWidget {
  @override
  _AddressDetailsWidgetState createState() => _AddressDetailsWidgetState();
}

class _AddressDetailsWidgetState extends State<AddressDetailsWidget> {
  var _expanded = false;
  List cdvAddress = [];
  final dbhelper = ProfileDatabase.instance;

  @override
  void initState() {
    fetchAndSetAddress();
    super.initState();
  }

  fetchAndSetAddress() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvAddress.add(new ProfileDataModel(
        applicantpresentaddress: data['applicantpresentaddress'],
        applicantpermanentaddress: data['applicantpermanentaddress'],
      ));
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
            'Address Details',
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
            height: 200,
            child: ListView.builder(
              itemCount: cdvAddress.length,
              itemBuilder: (_, index) {
                return Container(
                  child: Table(
                    children: [
                      TableRow(children: [
                        const Text(
                          'PRESENT ADDRESS	: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(cdvAddress[index].applicantpresentaddress.isEmpty
                            ? '    Not Given'
                            : ' ${cdvAddress[index].applicantpresentaddress.toString().toUpperCase()}'),
                      ]),
                      TableRow(children: [
                        const Text(
                          'PERMANENT ADDRESS	: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(cdvAddress[index].applicantpermanentaddress.isEmpty
                            ? 'Not given'
                            : cdvAddress[index].applicantpermanentaddress ==
                                    'null'
                                ? '    Not Given'
                                : '${cdvAddress[index].applicantpermanentaddress.toString().toUpperCase()}'),
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
