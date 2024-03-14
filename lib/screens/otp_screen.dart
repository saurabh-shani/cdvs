import 'dart:convert';

import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:cdv/screens/home_screen.dart';
import 'package:cdv/services/repPainter_new.dart';
import 'package:cdv/services/rpsPainter.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);
  static const routeName = '/Otp_Screen';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();
  List<ProfileDataModel> cdvProfileDataList = [];
  final dbhelper = ProfileDatabase.instance;
  String? _otp;

  fetchAndSetProfileDataInSql(String mobOrPid, String otp) async {
    String? applicant_name;

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);

    print('Form profile fetching' + mobOrPid + otp + formatted);
    String token = mobOrPid + otp + formatted;
    String encyrptedToken = base64.encode(utf8.encode(token));
    var url = Uri.parse(
        'some api');

    try {
      final response = await http.get(url);
      print('response' + response.body);
      final extractedData = json.decode(response.body);

      for (var data in extractedData) {
        cdvProfileDataList.add(new ProfileDataModel(
          //PersonalDetails
          applicantname: data['applicantname'],
          applicantfathername: data['applicantfathername'],
          applicantmothername: data['applicantmothername'],
          maritalStatus: data['marital_status'],
          applicanthusbandname: data['applicanthusbandname'],
          applicantmobileno: data['applicantmobileno'],
          applicantgender: data['applicantgender'],
          email: data['email'],
          gen_number: data['gen_number'],
          profileImage: data['profile_image'],
          applicantdob: data['applicantdob'],
          heightcms: data['heightcms'],
          enrollmentidold: data['enrollmentidold'],
          heightfeet: data['heightfeet'],
          heightinch: data['heightinch'],
          pid: data['pid'],
          aadhaarno: data['aadhaarno'],
          applicationno: data['applicationno'],
          enrollmentdate: data['enrollmentdate'],
          enrollmentno: data['enrollmentno'],
          //Address Details
          applicanthousenumber: data['applicanthousenumber'],
          districtname: data['districtname'],
          subdivdescription: data['subdivdescription'],
          cdvsubdivname: data['cdvsubdivname'],
          post_name: data['post_name'],
          sector_name: data['sector_name'],
          applicantpresentaddress: data['applicantpresentaddress'],
          applicantpermanentaddress: data['applicantpermanentaddress'],
          //Bank Details
          bankName: data['bank_name'],
          branchName: data['branch_name'],
          accountholdername: data['accountholdername'],
          accountno: data['accountno'],
          ifsccode: data['ifsccode'],
          micrcode: data['micrcode'],
          panNo: data['pan_no'],
          //Education details
          equalificationid: data['equalificationid'], //highest qualification
          languagecode: data['languagecode'], //languages known
          skillsId: data['skills_id'], // technical skills
          //Work Experience
          whetherWorking: data['whether_working'],
          whetherNocIssued: data['whether_noc_issued'],
          employername: data['employerName'],
          officecontactno: data['officecontactno'],
          officeaddress: data['officeaddress'],
          preferredTimeNishkamSeva: data['preferred_time_nishkam_seva'],
          nishkamSevaFrom: data['nishkam_seva_from'],
          // whetherbasictrainingcomplete: data['whetherbasictrainingcomplete'],
          //Previous Experience
          whethercdexperience: data['whethercdexperience'],
          whetherownvehicle: data['whetherownvehicle'],
          whetherknowdriving: data['whetherknowdriving'],
          whethermemberearlier: data['whethermemberearlier'],
          memberearlierid: data['memberearlierid'],
          memberearlierdetails: data['memberearlierdetails'],
          //Kin details
          nameofkin: data['nameofkin'],
          dobofkin: data['dobofkin'],
          relationwithkin: data['relationwithkin'],
          kinMobileNo: data['kin_mobile_no'],
          kinPermanentAddress: data['kin_permanent_address'],
          kinPresentAddress: data['kin_present_address'],
        ));
      }
      cdvProfileDataList.forEach((element) async {
        Map<String, dynamic> row = {
          //Personal details
          ProfileDatabase.applicantname: '${element.applicantname}',
          ProfileDatabase.applicantfathername: '${element.applicantfathername}',
          ProfileDatabase.applicantmothername: '${element.applicantmothername}',
          ProfileDatabase.marital_status: '${element.maritalStatus}',
          ProfileDatabase.applicanthusbandname:
              '${element.applicanthusbandname}',
          ProfileDatabase.applicantmobileno: '${element.applicantmobileno}',
          ProfileDatabase.applicantgender: '${element.applicantgender}',
          ProfileDatabase.email: '${element.email}',
          ProfileDatabase.applicantdob: '${element.applicantdob}',
          ProfileDatabase.heightcms: '${element.heightcms}',
          ProfileDatabase.heightfeet: '${element.heightfeet}',
          ProfileDatabase.heightinch: '${element.heightinch}',
          ProfileDatabase.pid: '${element.pid}',
          ProfileDatabase.profile_image: '${element.profileImage}',
          ProfileDatabase.aadhaarno: '${element.aadhaarno}',
          ProfileDatabase.enrollmentidold: '${element.enrollmentidold}',
          ProfileDatabase.applicationno: '${element.applicationno}',
          ProfileDatabase.enrollmentdate: '${element.enrollmentdate}',
          ProfileDatabase.enrollmentno: '${element.enrollmentno}',
          //Address Details
          ProfileDatabase.applicanthousenumber:
              '{$element.applicanthousenumber}',
          ProfileDatabase.applicantpresentaddress:
              '${element.applicantpresentaddress}',
          ProfileDatabase.districtname: '${element.districtname}',
          ProfileDatabase.subdivdescription: '${element.subdivdescription}',
          ProfileDatabase.cdvsubdivname: '${element.cdvsubdivname}',
          ProfileDatabase.post_name: '${element.post_name}',
          ProfileDatabase.sector_name: '${element.sector_name}',
          ProfileDatabase.applicantpermanentaddress:
              '${element.applicantpermanentaddress}',
          //Bank Details
          ProfileDatabase.bank_name: '${element.bankName}',
          ProfileDatabase.branch_name: '${element.branchName}',
          ProfileDatabase.accountholdername: '${element.accountholdername}',
          ProfileDatabase.accountno: '${element.accountno}',
          ProfileDatabase.ifsccode: '${element.ifsccode}',
          ProfileDatabase.micrcode: '${element.micrcode}',
          ProfileDatabase.pan_no: '${element.panNo}',
          //Education details
          ProfileDatabase.equalificationid:
              '${element.equalificationid}', //highest qualification
          ProfileDatabase.languagecode:
              '${element.languagecode}', //languages known
          ProfileDatabase.skills_id: '${element.skillsId}', // technical skills
          //Work Experience
          ProfileDatabase.whether_working: '${element.whetherWorking}',
          ProfileDatabase.whether_noc_issued: '${element.whetherNocIssued}',
          ProfileDatabase.employerName: '${element.employername}',
          ProfileDatabase.officecontactno: '${element.officecontactno}',
          ProfileDatabase.officeaddress: '${element.officeaddress}',
          ProfileDatabase.preferred_time_nishkam_seva:
              '${element.preferredTimeNishkamSeva}',
          ProfileDatabase.nishkam_seva_from: '${element.nishkamSevaFrom}',
          // ProfileDatabase.whetherbasictrainingcomplete:
          //     '${element.whetherbasictrainingcomplete}',
          //Previous Experience
          ProfileDatabase.whethercdexperience: '${element.whethercdexperience}',
          ProfileDatabase.whetherownvehicle: '${element.whetherownvehicle}',
          ProfileDatabase.whetherknowdriving: '${element.whetherknowdriving}',
          ProfileDatabase.whethermemberearlier:
              '${element.whethermemberearlier}',
          ProfileDatabase.memberearlierid: '${element.memberearlierid}',
          ProfileDatabase.memberearlierdetails:
              '${element.memberearlierdetails}',
          //Kin details
          ProfileDatabase.nameofkin: '${element.nameofkin}',
          ProfileDatabase.dobofkin: '${element.dobofkin}',
          ProfileDatabase.relationwithkin: '${element.relationwithkin}',
          ProfileDatabase.kin_mobile_no: '${element.kinMobileNo}',
          ProfileDatabase.kin_permanent_address:
              '${element.kinPermanentAddress}',
          ProfileDatabase.kin_present_address: '${element.kinPresentAddress}',
        };

        final id = await dbhelper.insertintoProfile(row);
        print(id);
      });
      print(applicant_name);
    } catch (error) {
      print('$error');
      throw (error);
    }
  }

  Future<void> profileGet(otp_number, String? otp, mobile_number) async {
    final String OTPNumbersha256 = sha256.convert(utf8.encode(otp!)) as String;
    String validResponse = "{'notice':{'text' : '$OTPNumbersha256'}}";
    if (validResponse == otp_number) {
      fetchAndSetProfileDataInSql(mobile_number, otp);

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('mobilenumber', mobile_number);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        ),
      );
    } else {
      print(validResponse);
      Fluttertoast.showToast(msg: ' Invalid OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    final otp_number = routeArgs['otp'];
    final mobile_number = routeArgs['mobile_number'];
    print(otp_number);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.red[900]!,
              Colors.red[800]!,
              Colors.red[400]!,
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width / 1.4,
                  MediaQuery.of(context).size.height),
              painter: RPSCustomPainter(Colors.deepOrange[600]!),
            ),
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width / 1.5,
                  MediaQuery.of(context).size.height),
              painter: RPSCustomPainternew(Colors.red[800]!),
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(horizontal: 10),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 10,
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
                                'OTP verification',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Text(
                          'Please enter the otp that you have recieved on your registered mobile number',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        // Implement 4 input fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpInput(_fieldOne, true),
                            OtpInput(_fieldTwo, false),
                            OtpInput(_fieldThree, false),
                            OtpInput(_fieldFour, false),
                            OtpInput(_fieldFive, false),
                            OtpInput(_fieldSix, false)
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _otp = _fieldOne.text +
                                    _fieldTwo.text +
                                    _fieldThree.text +
                                    _fieldFour.text +
                                    _fieldFive.text +
                                    _fieldSix.text;
                              });
                              print(_otp);
                              profileGet(otp_number, _otp, mobile_number);
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //
                        // https://assets2.lottiefiles.com/private_files/lf30_BB1X5K.json'),
                        // Display the entered OTP code
                        Text(
                          'OTP is valid for 10 minutes only',
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Colors.white, // Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.white, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Awesome Snackbar!'),
                action: SnackBarAction(
                  label: 'Action',
                  onPressed: () {
                    // Code to execute.
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
