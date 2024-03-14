import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:flutter/material.dart';

class PreviousDetailsWidget extends StatefulWidget {
  @override
  _PreviousDetailsWidgetState createState() => _PreviousDetailsWidgetState();
}

class _PreviousDetailsWidgetState extends State<PreviousDetailsWidget> {
  var _expanded = false;
  List<ProfileDataModel> cdvPreviousExperienceList = [];
  final dbhelper = ProfileDatabase.instance;
  String? previousExpirenece, ownVehicle, knownDrinving;

  @override
  void initState() {
    fetchAndSetBankDetails();
    super.initState();
  }

  fetchAndSetBankDetails() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvPreviousExperienceList.add(new ProfileDataModel(
        whethercdexperience: data['whethercdexperience'],
        whetherownvehicle: data['whetherownvehicle'],
        whetherknowdriving: data['whetherknowdriving'],
        whethermemberearlier: data['whethermemberearlier'],
        memberearlierid: data['memberearlierid'],
        memberearlierdetails: data['memberearlierdetails'],
      ));
    }

    cdvPreviousExperienceList.forEach((element) {
      if (element.whethercdexperience == 'f') {
        setState(() {
          previousExpirenece = 'No';
        });
      } else {
        setState(() {
          previousExpirenece = 'Yes';
        });
      }

      if (element.whetherownvehicle.toString() == 'f') {
        setState(() {
          ownVehicle = 'No';
        });
      } else if (element.whetherownvehicle.toString() == 't') {
        setState(() {
          ownVehicle = 'Yes';
        });
      }

      if (element.whetherknowdriving.toString() == 't') {
        setState(() {
          knownDrinving = 'YES';
        });
      } else if (element.whetherknowdriving.toString() == 'f') {
        setState(() {
          knownDrinving = 'NO';
        });
      } else {
        setState(() {
          knownDrinving = 'NOT GIVEN';
        });
      }
    });
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
            'Previous Experience',
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
            height: 100,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cdvPreviousExperienceList.length,
              itemBuilder: (_, index) {
                return Container(
                  child: Table(
                    children: [
                      TableRow(children: [
                        const Text(
                          'PREVIUOS EXPERIENCE AS CDV: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(previousExpirenece!.toUpperCase()),
                      ]),
                      TableRow(children: [
                        const Text(
                          'OWN VEHICLE	: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(ownVehicle!.toUpperCase()),
                      ]),
                      TableRow(children: [
                        const Text(
                          'KNOW DRIVING: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(knownDrinving!.toUpperCase()),
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
