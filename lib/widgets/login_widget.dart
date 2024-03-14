import 'dart:convert';

import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:cdv/screens/home_screen.dart';
import 'package:cdv/screens/login_screen.dart';
import 'package:cdv/screens/otp_screen.dart';
import 'package:cdv/widgets/dialog_box_wrong.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _mobileNumberOrPidController = TextEditingController();
  final _OTPController = TextEditingController();
  String? otpResponse;
  String? mobileNoOrPid;
  List<ProfileDataModel> cdvProfileDataList = [];
  var tryCheck = 3;

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

  Future<void> otpCheck(BuildContext context) async {
    // ignore: non_constant_identifier_names
    final String Otp = _OTPController.text;
    final String OTPNumbersha256 =
        sha256.convert(utf8.encode(_OTPController.text)).toString();
    String validResponse = "{'notice':{'text' : '$OTPNumbersha256'}}";
    if (validResponse == otpResponse) {
      fetchAndSetProfileDataInSql(mobileNoOrPid!, Otp);

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
          'mobilenumber', _mobileNumberOrPidController.text);
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

  final dbhelper = ProfileDatabase.instance;

  Future<dynamic> alertBox(BuildContext context) async {
    mobileNoOrPid = _mobileNumberOrPidController.text;
    var url = Uri.parse(
        'some api');
    try {
      final response = await http.post(url,
          body: jsonEncode({"mobile_no": mobileNoOrPid}),
          headers: {"content-type": "application/json"});
      print(response.body);
      setState(() {
        otpResponse = response.body;
      });
    } catch (e) {
      print(e);
    }
    const String invalidResponse = "{'notice':{'text' : 'INVALID'}}";

    if (otpResponse == invalidResponse) {
      return showDialog(
        context: context,
        builder: (ctx) => DialogBoxWrong(),
      );
    } else {
      // Navigator.of(context).pushNamed(
      //   OtpScreen.routeName,
      //   arguments: {
      //     'otp': otpResponse,
      //     'mobile_number': _mobileNumberOrPidController.text,
      //   },
      // );
      return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.green[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          scrollable: true,
          content: Column(
            children: <Widget>[
              Card(
                color: Colors.green[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10,
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.message_rounded,
                        color: Colors.green,
                        size: 150,
                      ),
                      const Text(
                        'Verification Code ',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Please enter the OTP sent to your device',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: _OTPController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 6,
                decoration: InputDecoration(
                  counterText: '',
                  prefixIcon: Icon(
                    Icons.mobile_friendly,
                    color: Colors.green,
                  ),
                  labelText: 'Please enter recieved OTP',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
              Center(
                child: const Text(
                  '3 attempts are allowed\n And valid for ten minutes',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Card(
                color: Colors.green[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                margin: const EdgeInsets.all(10),
                child: FlatButton(
                  onPressed: () {
                    otpCheck(context);
                    setState(() {
                      --tryCheck;
                    });
                    if (tryCheck == 0) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen(),
                        ),
                      );
                      Fluttertoast.showToast(
                          msg: 'Max try attempted. Please login again');
                    }
                    print(tryCheck);
                  },
                  child: const Text(
                    'Verify',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(225, 95, 27, .3),
                    blurRadius: 20,
                    offset: Offset(0, 10))
              ]),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[200]!,
                ),
              ),
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _mobileNumberOrPidController,
              maxLength: 17,
              decoration: InputDecoration(
                  hintText: 'Enter mobile number / PID',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
              onSubmitted: (_) => {alertBox(context)},
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        FlatButton(
          onPressed: () async {
            alertBox(context);
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange[900],
            ),
            child: Center(
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
