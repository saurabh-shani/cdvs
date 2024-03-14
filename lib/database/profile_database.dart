import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProfileDatabase {
  //for CDV Profile
  //PersonalDetails
  static final applicantname = 'applicantname';
  static final applicantfathername = 'applicantfathername';
  static final applicantmothername = 'applicantmothername';
  static final marital_status = 'marital_status';
  static final applicanthusbandname = 'applicanthusbandname';
  static final applicantmobileno = 'applicantmobileno';
  static final applicantgender = 'applicantgender';
  static final email = 'email';
  static final gen_number = 'gen_number';
  static final applicantdob = 'applicantdob';
  static final heightcms = 'heightcms';
  static final heightfeet = 'heightfeet';
  static final heightinch = 'heightinch';
  static final pid = 'pid';
  static final profile_image = 'profile_image';
  static final aadhaarno = 'aadhaarno';
  static final applicationno = 'applicationno';
  static final enrollmentidold = 'enrollmentidold';
  static final enrollmentdate = 'enrollmentdate';
  static final enrollmentno = 'enrollmentno';
  //Address Details
  static final applicanthousenumber = 'applicanthousenumber';
  static final applicantpresentaddress = 'applicantpresentaddress';
  static final subdivdescription = 'subdivdescription';
  static final cdvsubdivname = 'cdvsubdivname';
  static final post_name = 'post_name';
  static final sector_name = 'sector_name';
  static final applicantpermanentaddress = 'applicantpermanentaddress';
  static final districtname = 'districtname';

  //Bank Details
  static final bank_name = 'bank_name';
  static final branch_name = 'branch_name';
  static final accountholdername = 'accountholdername';
  static final accountno = 'accountno';
  static final ifsccode = 'ifsccode';
  static final micrcode = 'micrcode';
  static final pan_no = 'pan_no';
  //Education details
  static final equalificationid = 'equalificationid'; //highest qualification
  static final languagecode = 'languagecode'; //languages known
  static final skills_id = 'skills_id'; // technical skills
  //Work Experience
  static final whether_working = 'whether_working';
  static final whether_noc_issued = 'whether_noc_issued';
  static final employerName = 'employerName';
  static final officecontactno = 'officecontactno';
  static final officeaddress = 'officeaddress';
  static final preferred_time_nishkam_seva = 'preferred_time_nishkam_seva';
  static final nishkam_seva_from = 'nishkam_seva_from';
  static final whetherbasictrainingcomplete = 'whetherbasictrainingcomplete';
  //Previous Experience
  static final whethercdexperience = 'whethercdexperience';
  static final whetherownvehicle = 'whetherownvehicle';
  static final whetherknowdriving = 'whetherknowdriving';
  static final whethermemberearlier = 'whethermemberearlier';
  static final memberearlierid = 'memberearlierid';
  static final memberearlierdetails = 'memberearlierdetails';
  //Kin details
  static final nameofkin = 'nameofkin';
  static final dobofkin = 'dobofkin';
  static final relationwithkin = 'relationwithkin';
  static final kin_mobile_no = 'kin_mobile_no';
  static final kin_permanent_address = 'kin_permanent_address';
  static final kin_present_address = 'kin_present_address';

  // database
  static Database? _database;

  // privateconstructor
  ProfileDatabase._privateConstructor();
  static final ProfileDatabase instance = ProfileDatabase._privateConstructor();

  // asking for a database
  Future<Database?> get databse async {
    if (_database != null) return _database;

    // create a database if one doesn't exist
    _database = await _initDatabase();
    return _database;
  }

  // function to return a database
  _initDatabase() async {
    Directory documentdirecoty = await getApplicationDocumentsDirectory();
    String path = join(documentdirecoty.path, 'cdv.db');
    print('db location: $path');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // create a database since it doesn't exist
  Future _onCreate(Database db, int version) async {
    // sql code

    await db.execute('''
      CREATE TABLE Profile (
        $applicantname TEXT ,
        $profile_image TEXT ,
        $gen_number TEXT ,
        $applicationno TEXT,
        $districtname TEXT,
        $enrollmentno TEXT,
        $aadhaarno TEXT,
        $subdivdescription TEXT,
        $cdvsubdivname TEXT,
        $post_name TEXT,
        $sector_name TEXT,
        $applicantfathername TEXT ,
        $applicantmothername TEXT ,
        $marital_status TEXT ,
        $applicanthusbandname  TEXT ,
        $applicantmobileno TEXT ,
        $applicantgender TEXT ,
        $enrollmentidold TEXT,
        $email TEXT ,
        $applicantdob TEXT ,
        $nishkam_seva_from TEXT,
        $heightcms TEXT ,
        $heightfeet TEXT ,
        $heightinch TEXT ,
        $applicanthousenumber TEXT ,
        $applicantpresentaddress TEXT ,
        $applicantpermanentaddress TEXT ,
        $kin_present_address TEXT,
        $pid TEXT,
        $bank_name TEXT ,
        $branch_name  TEXT ,
        $accountholdername TEXT ,
        $accountno TEXT ,
        $ifsccode TEXT ,
        $micrcode TEXT ,
        $pan_no TEXT ,
        $equalificationid TEXT ,
        $languagecode TEXT ,
        $skills_id TEXT ,
        $enrollmentdate TEXT,
        $whether_working TEXT , 
        $whether_noc_issued TEXT ,
        $employerName TEXT ,
        $officecontactno TEXT ,
        $officeaddress TEXT ,
        $preferred_time_nishkam_seva TEXT , 
        $whethercdexperience TEXT ,
        $whetherbasictrainingcomplete TEXT,
        $whetherownvehicle TEXT ,
        $whetherknowdriving TEXT ,
        $whethermemberearlier TEXT ,
        $memberearlierid TEXT ,
        $memberearlierdetails TEXT ,
        $nameofkin TEXT ,
        $dobofkin TEXT ,
        $relationwithkin TEXT ,
        $kin_mobile_no TEXT ,
        $kin_permanent_address TEXT 
      );
      ''');
  }

  Future<dynamic> insertintoProfile(Map<String, dynamic> row) async {
    Database? db = await instance.databse;
    return await db!.insert('Profile', row);
  }

  // function to query all the rows

  Future<List<Map<String, dynamic>>> queryallfromProfile() async {
    Database? db = await instance.databse;
    return await db!.query('Profile');
  }

  // Query Sepcific

  Future<List<Map<String, dynamic>>> querySpecificProfile(String PID) async {
    Database? db = await instance.databse;
    var res = await db!.query('Profile', where: 'pid = ?', whereArgs: [PID]);
    print(res);
    // var res = await db
    //     .rawQuery('SELECT * FROM Language WHERE languageCode = ?', [PID]);
    return res;
  }

  //Delete all data
  Future<dynamic> deletedataAll() async {
    Database? db = await instance.databse;
    // var res = await db.delete('Profile', where: null, whereArgs: null);
    // print(res);
    // return res;

    var res = await db!.rawQuery('DELETE FROM Profile;');
    print(res);
    return res;
  }
}
