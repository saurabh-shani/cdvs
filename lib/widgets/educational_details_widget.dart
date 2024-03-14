import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:flutter/material.dart';

class EducationalDetailsWidget extends StatefulWidget {
  @override
  _EducationalDetailsWidgetState createState() =>
      _EducationalDetailsWidgetState();
}

class _EducationalDetailsWidgetState extends State<EducationalDetailsWidget> {
  var _expanded = false;
  List<ProfileDataModel> cdvEducationQualification = [];
  List skillCodeList = [];
  List languageCodesList = [];
  final dbhelper = ProfileDatabase.instance;
  String? highestQualification;

  @override
  void initState() {
    fetchAndSetBankDetails();
    super.initState();
  }

  fetchAndSetBankDetails() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvEducationQualification.add(new ProfileDataModel(
        equalificationid: data['equalificationid'], //highest qualification
        languagecode: data['languagecode'], //languages known
        skillsId: data['skills_id'], // technical skills
      ));
    }

    cdvEducationQualification.forEach((element) async {
      print(element.languagecode);

      if (element.equalificationid == '102') {
        setState(() {
          highestQualification = '5th';
        });
      } else if (element.equalificationid == '103') {
        setState(() {
          highestQualification = '6th';
        });
      } else if (element.equalificationid == '104') {
        setState(() {
          highestQualification = '7th';
        });
      } else if (element.equalificationid == '105') {
        setState(() {
          highestQualification = '8th';
        });
      } else if (element.equalificationid == '106') {
        setState(() {
          highestQualification = '9th';
        });
      } else if (element.equalificationid == '107') {
        setState(() {
          highestQualification = '10th';
        });
      } else if (element.equalificationid == '108') {
        setState(() {
          highestQualification = 'Higher Secondary';
        });
      } else if (element.equalificationid == '109') {
        setState(() {
          highestQualification = 'Diploma';
        });
      } else if (element.equalificationid == '110') {
        setState(() {
          highestQualification = 'Graduation';
        });
      } else if (element.equalificationid == '111') {
        setState(() {
          highestQualification = 'Post Graduation';
        });
      } else if (element.equalificationid == '101') {
        setState(() {
          highestQualification = '4th';
        });
      } else if (element.equalificationid == 'null') {
        setState(() {
          highestQualification = 'Not Given';
        });
      } else if (element.equalificationid.isEmpty) {
        setState(() {
          highestQualification = 'Not Given';
        });
      } else {
        setState(() {
          highestQualification = 'Others';
        });
      }

      //for language
      var langugeCodes = element.languagecode.toString();
      var splitlanguagecode = langugeCodes.split(',');
      final Map<int, String> languageValues = {
        for (int i = 0; i < splitlanguagecode.length; i++)
          i: splitlanguagecode[i]
      };
      for (int i = 0; i < languageValues.length; i++) {
        languageCodeToString(languageValues[i]!);
      }

      //for skills
      var skillCodes = element.skillsId.toString();
      var splitcode = skillCodes.split(',');
      final Map<int, String> skillsValues = {
        for (int i = 0; i < splitcode.length; i++) i: splitcode[i]
      };

      for (int i = 0; i < skillsValues.length; i++) {
        skillCodeToString(skillsValues[i]!);
      }
      // setState(() {
      //   height = skillCodeList.length
      // });
    });
  }

  void languageCodeToString(String languageValue) {
    if (languageValue == '145') {
      languageCodesList.add('Assamese');
    } else if (languageValue == '146') {
      languageCodesList.add('Bengali');
    } else if (languageValue == '147') {
      languageCodesList.add('Bodo');
    } else if (languageValue == '148') {
      languageCodesList.add('Dogri');
    } else if (languageValue == '102') {
      languageCodesList.add('English');
    } else if (languageValue == '104') {
      languageCodesList.add('Gujrati');
    } else if (languageValue == '103') {
      languageCodesList.add('Hindi');
    } else if (languageValue == '149') {
      languageCodesList.add('Kannada');
    } else if (languageValue == '150') {
      languageCodesList.add('Kashmiri');
    } else if (languageValue == '151') {
      languageCodesList.add('Konkani');
    } else if (languageValue == '152') {
      languageCodesList.add('Maithili');
    } else if (languageValue == '153') {
      languageCodesList.add('Malayalam');
    } else if (languageValue == '154') {
      languageCodesList.add('Manipuri/Meitei');
    } else if (languageValue == '155') {
      languageCodesList.add('Marathi');
    } else if (languageValue == '156') {
      languageCodesList.add('Nepali');
    } else if (languageValue == '157') {
      languageCodesList.add('Oriya');
    } else if (languageValue == '158') {
      languageCodesList.add('Punjabi');
    } else if (languageValue == '159') {
      languageCodesList.add('Sanskrit');
    } else if (languageValue == '160') {
      languageCodesList.add('Santhali');
    } else if (languageValue == '161') {
      languageCodesList.add('Sindhi');
    } else if (languageValue == '162') {
      languageCodesList.add('Tamil');
    } else if (languageValue == '163') {
      languageCodesList.add('Telugu');
    } else if (languageValue == '164') {
      languageCodesList.add('Urdu');
    } else {
      languageCodesList.add('Others');
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
            'Educational Qualification',
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
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: 260,
            // (skillCodeList.length.toDouble() +
            //         languageCodesList.length.toDouble()) *
            //     50,
            child: ListView.builder(
              itemCount: cdvEducationQualification.length,
              itemBuilder: (_, index) {
                return Container(
                  child: Table(
                    // border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        Text(
                          'EDUCATIONAL QUALIFICATION:',
                          style: bold,
                        ),
                        // Text(skillCodeList.length.toString() +
                        //     languageCodesList.length.toString())
                        Text(highestQualification!.toUpperCase()),
                      ]),
                      TableRow(
                        children: [
                          Text(
                            'LANGUAGES KNOWN:',
                            style: bold,
                          ),
                          Text(languageCodesList.join('\n').toUpperCase()),
                        ],
                      ),
                      TableRow(children: [
                        const Text(
                          'TECHNICAL SKILLS:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(skillCodeList.join('\n').toUpperCase()),
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
