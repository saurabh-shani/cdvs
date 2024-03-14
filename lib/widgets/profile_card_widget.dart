import 'package:cdv/Widgets/profile_image_widget.dart';
import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:cdv/services/date_time_formatting.dart';
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatefulWidget {
  @override
  _ProfileCardWidgetState createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  List cdvProfileCardDetails = [];
  final dbhelper = ProfileDatabase.instance;
  List skillCodeList = [];
  String? gender;

  @override
  void initState() {
    setProfileCard();
    super.initState();
  }

  setProfileCard() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvProfileCardDetails.add(new ProfileDataModel(
        applicantname: data['applicantname'],
        applicantgender: data['applicantgender'],
        gen_number: data['gen_number'],
        applicantdob: data['applicantdob'],
        pid: data['pid'],
        enrollmentno: data['enrollmentno'],
        hfp: data['hfp'],
        pdistrictcode: data['pdistrictcode'],
        psubdivcode: data['psubdivcode'],
        applicationno: int.parse(data['applicationno']),
        skillsId: data['skills_id'],
        nameofkin: data['nameofkin'],
        kinMobileNo: data['kin_mobile_no'],
        // whetherbasictrainingcomplete: data['whetherbasictrainingcomplete'],
        enrollmentdate: data['enrollmentdate'],
        upcomingRenewal: data['upcoming_renewal'],
        districtname: data['districtname'],
        cdvsubdivcode: data['cdvsubdivcode'],
        cdvsubdivname: data['cdvsubdivname'],
        subdivdescription: data['subdivdescription'],
      ));

      cdvProfileCardDetails.forEach((element) async {
        //for gender
        if (element.applicantgender.toString() == 'M') {
          setState(() {
            gender = 'Male';
          });
        } else {
          setState(() {
            gender = 'Female';
          });
        }

        //for skills
        var skillCodes = element.skillsId.toString();
        var splitcode = skillCodes.split(',');
        final Map<int, String> skillsValues = {
          for (int i = 0; i < splitcode.length; i++) i: splitcode[i]
        };

        for (int i = 0; i < skillsValues.length; i++) {
          skillCodeToString(skillsValues[i].toString());
        }
      });
    }
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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          margin: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height / 1.8,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow[50],
          ),
          child: ListView.builder(
            itemCount: cdvProfileCardDetails.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Card(
                            margin: const EdgeInsets.all(15),
                            elevation: 10,
                            child: Container(
                              height: 120,
                              width: 120,
                              padding: const EdgeInsets.all(5),
                              color: Colors.white,
                              child: ProfileImageWidget(imageHeight: 100),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                    'NAME: ${cdvProfileCardDetails[index].applicantname.toUpperCase()}'),
                              ),
                              Row(
                                children: <Widget>[
                                  Text('DOB: '),
                                  DateFormatting(
                                      cdvProfileCardDetails[index].applicantdob)
                                ],
                              ),
                              Text('GENDER: ${gender!.toUpperCase()}'),
                              Text('PID: ${cdvProfileCardDetails[index].pid}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Table(
                      children: [
                        TableRow(children: [
                          Text('APPLICATION NO.:'),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                                '${cdvProfileCardDetails[index].applicationno}'),
                          ),
                        ]),
                        TableRow(children: [
                          Text('OLD ENROLLMENT NO.:'),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(cdvProfileCardDetails[index]
                                        .enrollmentno ==
                                    null
                                ? 'N/A'
                                : cdvProfileCardDetails[index]
                                        .enrollmentno
                                        .isEmpty
                                    ? 'N/A'
                                    : '${cdvProfileCardDetails[index].enrollmentno}'),
                          ),
                        ]),
                        TableRow(children: [
                          Text('DISTRICT:'),
                          Text('${cdvProfileCardDetails[index].districtname}'),
                        ]),
                        TableRow(children: [
                          Text('SUB DIVISION:'),
                          Text('${cdvProfileCardDetails[index].cdvsubdivname}'),
                        ]),
                        TableRow(children: [
                          Text('DIVISION:'),
                          Text(
                              '${cdvProfileCardDetails[index].subdivdescription}'),
                        ]),
                        TableRow(children: [
                          Text('SKILLS:'),
                          Text('${skillCodeList.join('\n').toUpperCase()}'),
                        ]),
                        TableRow(children: [
                          Text('NAME OF CONTACT PERSON IN EMERGENCY'),
                          Text('${cdvProfileCardDetails[index].nameofkin}'),
                        ]),
                        TableRow(children: [
                          Text('MOBILE NO. OF CONTACT PERSON IN EMERGENCY:'),
                          Text(
                              '+91 ${cdvProfileCardDetails[index].kinMobileNo}'),
                        ]),
                        TableRow(children: [
                          Text('DATE OF ENROLLMENT:  '),
                          DateFormatting(
                              cdvProfileCardDetails[index].enrollmentdate),
                        ]),
                      ],
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
