import 'package:flutter/material.dart';

class ProfileDataModel {
  final applicantname;
  final applicantfathername;
  final applicantmothername;
  final maritalStatus;
  final applicanthusbandname;
  final applicantmobileno;
  final applicantgender;
  final email;
  final gen_number;
  final profileImage;
  final applicantdob;
  final heightcms;
  final enrollmentidold;
  final heightfeet;
  final heightinch;
  final pid;
  final aadhaarno;
  final applicationno;
  final enrollmentdate;
  final enrollmentno;
  final applicanthousenumber;
  final districtname;
  final subdivdescription;
  final cdvsubdivname;
  final post_name;
  final sector_name;
  final applicantpresentaddress;
  final applicantpermanentaddress;
  final bankName;
  final branchName;
  final accountholdername;
  final accountno;
  final ifsccode;
  final micrcode;
  final panNo;

  final equalificationid;
  final languagecode;
  final skillsId;
  final whetherWorking;
  final whetherNocIssued;
  final employername;
  final officecontactno;
  final officeaddress;
  final preferredTimeNishkamSeva;
  final nishkamSevaFrom;
  final whethercdexperience;
  final whetherownvehicle;
  final whetherknowdriving;
  final whethermemberearlier;
  final memberearlierid;
  final memberearlierdetails;
  final nameofkin;
  final dobofkin;
  final relationwithkin;
  final kinMobileNo;
  final kinPermanentAddress;
  final kinPresentAddress;

  var identificationmark;

  var occupationid;

  var cdexperiencedetails;

  var bloodgroup;

  var whetherblooddonor;

  var weight;

  var phouseno;

  var psublocality;

  var plocalityid;

  var psubdivcode;

  var upcomingRenewal;

  var trainingCertificateNo;

  var btEndDate;

  var btStartDate;

  var hfp;

  var position;

  var noofnishakamduty;

  var nishkamSevaType;

  var achievementDetails;

  var eventPeriod;

  var eventName;

  var extraAchievement;

  var sourceIncome;

  var approveddate;

  var deploymentNotices;

  var whetherbasictrainingcomplete;

  var incomeOthers;

  var incomeSource;

  var salary;

  var workingSince;

  var designation;

  var supervisorMobile;

  var supervisorName;

  var companyAddress;

  var companyName;

  var annualIncome;

  var docSigned;

  var tmpApplicationcdv;

  var isActive;

  var createdAt;

  var nameOfCivilDefenceCorps;

  var whetherPoliceVerification;

  var applicantage;

  var sdmId;

  var remarks;

  var declarationDate;

  var declarationPlace;

  var policeStation;

  var experience;

  var nationality;

  var sector;

  var post;

  var ip;

  var whetherpresentorpermanentaddressissame;

  var applicantsublocality;

  var applicantstreetnumber;

  var referencedetails;

  var whetherkinpresentaddressissame;

  var whetherkinpermanentaddressissame;

  var preferredTrainingTime;

  var isVerifiedBySdm;

  var advanceTrainingComplete;

  var trainingpreference;

  var bankcode;

  var cdvsubdivcode;

  var whetherdischarge;

  var drivingdetails;

  var whetherpcccomplete;

  var vehicledetails;

  var chest;

  var ppincode;

  var pcountryid;

  var pstateid;

  var pdistrictcode;

  ProfileDataModel({
    this.applicationno,
    this.aadhaarno,
    this.identificationmark,
    this.occupationid,
    this.employername,
    this.officeaddress,
    this.profileImage,
    this.officecontactno,
    this.subdivdescription,
    this.cdvsubdivname,
    this.post_name,
    this.sector_name,
    this.districtname,
    this.equalificationid,
    this.whethercdexperience,
    this.cdexperiencedetails,
    this.whetherownvehicle,
    this.whetherknowdriving,
    this.bloodgroup,
    this.whetherblooddonor,
    this.heightfeet,
    this.heightinch,
    this.weight,
    this.phouseno,
    this.psublocality,
    this.plocalityid,
    this.psubdivcode,
    this.pdistrictcode,
    this.pstateid,
    this.pcountryid,
    this.ppincode,
    this.enrollmentno,
    this.chest,
    this.enrollmentidold,
    this.vehicledetails,
    this.whethermemberearlier,
    this.memberearlierid,
    this.memberearlierdetails,
    this.whetherpcccomplete,
    this.drivingdetails,
    this.whetherdischarge,
    this.cdvsubdivcode,
    this.accountholdername,
    this.accountno,
    this.bankcode,
    this.ifsccode,
    this.micrcode,
    this.enrollmentdate,
    this.trainingpreference,
    this.languagecode,
    this.advanceTrainingComplete,
    this.panNo,
    this.email,
    this.skillsId,
    this.bankName,
    this.branchName,
    this.isVerifiedBySdm,
    this.preferredTrainingTime,
    this.preferredTimeNishkamSeva,
    this.nameofkin,
    this.relationwithkin,
    this.whetherkinpermanentaddressissame,
    this.whetherkinpresentaddressissame,
    this.kinPresentAddress,
    this.kinPermanentAddress,
    this.applicantname,
    this.applicantgender,
    this.applicantdob,
    this.applicantfathername,
    this.applicantmothername,
    this.applicanthusbandname,
    this.applicantmobileno,
    this.referencedetails,
    this.applicanthousenumber,
    this.applicantstreetnumber,
    this.applicantsublocality,
    this.applicantpermanentaddress,
    this.applicantpresentaddress,
    this.whetherpresentorpermanentaddressissame,
    this.ip,
    this.post,
    this.sector,
    this.nationality,
    this.experience,
    this.policeStation,
    this.declarationPlace,
    this.declarationDate,
    this.dobofkin,
    this.remarks,
    this.sdmId,
    this.heightcms,
    this.applicantage,
    this.whetherWorking,
    this.whetherNocIssued,
    this.whetherPoliceVerification,
    this.nameOfCivilDefenceCorps,
    this.createdAt,
    this.pid,
    this.gen_number,
    this.isActive,
    this.tmpApplicationcdv,
    this.kinMobileNo,
    this.maritalStatus,
    this.docSigned,
    this.annualIncome,
    this.companyName,
    this.companyAddress,
    this.supervisorName,
    this.supervisorMobile,
    this.designation,
    this.workingSince,
    this.salary,
    this.incomeSource,
    this.incomeOthers,
    this.whetherbasictrainingcomplete,
    this.deploymentNotices,
    this.approveddate,
    this.sourceIncome,
    this.extraAchievement,
    this.eventName,
    this.eventPeriod,
    this.achievementDetails,
    this.nishkamSevaType,
    this.nishkamSevaFrom,
    this.noofnishakamduty,
    this.position,
    this.hfp,
    this.btStartDate,
    this.btEndDate,
    this.trainingCertificateNo,
    this.upcomingRenewal,
  });
}










// // To parse this JSON data, do
// //
// //     final profiletwo = profiletwoFromJson(jsonString);

// import 'dart:convert';

// List<ProfileDataModel> profiletwoFromJson(String str) => List<ProfileData>.from(
//     json.decode(str).map((x) => ProfileData.fromJson(x)));

// String profiletwoToJson(List<ProfileData> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ProfileData {
//   ProfileData({
//     required this.applicationno,
//     required this.aadhaarno,
//     required this.identificationmark,
//     required this.occupationid,
//     required this.employername,
//     required this.officeaddress,
//     required this.profileImage,
//     required this.officecontactno,
//     required this.subdivdescription,
//     required this.cdvsubdivname,
//     required this.post_name,
//     required this.sector_name,
//     required this.districtname,
//     required this.equalificationid,
//     required this.whethercdexperience,
//     required this.cdexperiencedetails,
//     required this.whetherownvehicle,
//     required this.whetherknowdriving,
//     required this.bloodgroup,
//     required this.whetherblooddonor,
//     required this.heightfeet,
//     required this.heightinch,
//     required this.weight,
//     required this.phouseno,
//     required this.psublocality,
//     required this.plocalityid,
//     required this.psubdivcode,
//     required this.pdistrictcode,
//     required this.pstateid,
//     required this.pcountryid,
//     required this.ppincode,
//     required this.enrollmentno,
//     required this.chest,
//     required this.enrollmentidold,
//     required this.vehicledetails,
//     required this.whethermemberearlier,
//     required this.memberearlierid,
//     required this.memberearlierdetails,
//     required this.whetherpcccomplete,
//     required this.drivingdetails,
//     required this.whetherdischarge,
//     required this.cdvsubdivcode,
//     required this.accountholdername,
//     required this.accountno,
//     required this.bankcode,
//     required this.ifsccode,
//     required this.micrcode,
//     required this.enrollmentdate,
//     required this.trainingpreference,
//     required this.languagecode,
//     required this.advanceTrainingComplete,
//     required this.panNo,
//     required this.email,
//     required this.skillsId,
//     required this.bankName,
//     required this.branchName,
//     required this.isVerifiedBySdm,
//     required this.preferredTrainingTime,
//     required this.preferredTimeNishkamSeva,
//     required this.nameofkin,
//     required this.relationwithkin,
//     required this.whetherkinpermanentaddressissame,
//     required this.whetherkinpresentaddressissame,
//     required this.kinPresentAddress,
//     required this.kinPermanentAddress,
//     required this.applicantname,
//     required this.applicantgender,
//     required this.applicantdob,
//     required this.applicantfathername,
//     required this.applicantmothername,
//     required this.applicanthusbandname,
//     required this.applicantmobileno,
//     required this.referencedetails,
//     required this.applicanthousenumber,
//     required this.applicantstreetnumber,
//     required this.applicantsublocality,
//     required this.applicantpermanentaddress,
//     required this.applicantpresentaddress,
//     required this.whetherpresentorpermanentaddressissame,
//     required this.ip,
//     required this.post,
//     required this.sector,
//     required this.nationality,
//     required this.experience,
//     required this.policeStation,
//     required this.declarationPlace,
//     required this.declarationDate,
//     required this.dobofkin,
//     required this.remarks,
//     required this.sdmId,
//     required this.heightcms,
//     required this.applicantage,
//     required this.whetherWorking,
//     required this.whetherNocIssued,
//     required this.whetherPoliceVerification,
//     required this.nameOfCivilDefenceCorps,
//     required this.createdAt,
//     required this.pid,
//     required this.gen_number,
//     required this.isActive,
//     required this.tmpApplicationcdv,
//     required this.kinMobileNo,
//     required this.maritalStatus,
//     required this.docSigned,
//     required this.annualIncome,
//     required this.companyName,
//     required this.companyAddress,
//     required this.supervisorName,
//     required this.supervisorMobile,
//     required this.designation,
//     required this.workingSince,
//     required this.salary,
//     required this.incomeSource,
//     required this.incomeOthers,
//     required this.whetherbasictrainingcomplete,
//     required this.deploymentNotices,
//     required this.approveddate,
//     required this.sourceIncome,
//     required this.extraAchievement,
//     required this.eventName,
//     required this.eventPeriod,
//     required this.achievementDetails,
//     required this.nishkamSevaType,
//     required this.nishkamSevaFrom,
//     required this.noofnishakamduty,
//     required this.position,
//     required this.hfp,
//     required this.btStartDate,
//     required this.btEndDate,
//     required this.trainingCertificateNo,
//     required this.upcomingRenewal,
//   });

//   int applicationno;
//   String aadhaarno;
//   String identificationmark;
//   String occupationid;
//   String employername;
//   String officeaddress;
//   String officecontactno;
//   String equalificationid;
//   String whethercdexperience;
//   String cdexperiencedetails;
//   String whetherownvehicle;
//   String whetherknowdriving;
//   String bloodgroup;
//   String subdivdescription;
//   String cdvsubdivname;
//   String post_name;
//   String sector_name;
//   String districtname;
//   dynamic whetherblooddonor;
//   String heightfeet;
//   String heightinch;
//   String weight;
//   dynamic phouseno;
//   String profileImage;
//   dynamic psublocality;
//   dynamic plocalityid;
//   String psubdivcode;
//   String pdistrictcode;
//   dynamic pstateid;
//   dynamic pcountryid;
//   dynamic ppincode;
//   String enrollmentno;
//   String chest;
//   String enrollmentidold;
//   dynamic vehicledetails;
//   dynamic whethermemberearlier;
//   dynamic memberearlierid;
//   dynamic memberearlierdetails;
//   String whetherpcccomplete;
//   dynamic drivingdetails;
//   String whetherdischarge;
//   String cdvsubdivcode;
//   String accountholdername;
//   String accountno;
//   String bankcode;
//   String ifsccode;
//   String micrcode;
//   String enrollmentdate;
//   String trainingpreference;
//   dynamic languagecode;
//   dynamic advanceTrainingComplete;
//   dynamic panNo;
//   String email;
//   dynamic skillsId;
//   String bankName;
//   String branchName;
//   dynamic isVerifiedBySdm;
//   dynamic preferredTrainingTime;
//   String preferredTimeNishkamSeva;
//   String nameofkin;
//   String relationwithkin;
//   dynamic whetherkinpermanentaddressissame;
//   dynamic whetherkinpresentaddressissame;
//   String kinPresentAddress;
//   String kinPermanentAddress;
//   String applicantname;
//   String applicantgender;
//   String applicantdob;
//   String applicantfathername;
//   String applicantmothername;
//   String applicanthusbandname;
//   String applicantmobileno;
//   dynamic referencedetails;
//   dynamic applicanthousenumber;
//   dynamic applicantstreetnumber;
//   dynamic applicantsublocality;
//   dynamic applicantpermanentaddress;
//   String applicantpresentaddress;
//   dynamic whetherpresentorpermanentaddressissame;
//   dynamic ip;
//   String post;
//   String sector;
//   String nationality;
//   dynamic experience;
//   dynamic policeStation;
//   dynamic declarationPlace;
//   dynamic declarationDate;
//   String dobofkin;
//   dynamic remarks;
//   dynamic sdmId;
//   String heightcms;
//   String applicantage;
//   dynamic whetherWorking;
//   dynamic whetherNocIssued;
//   dynamic whetherPoliceVerification;
//   dynamic nameOfCivilDefenceCorps;
//   DateTime createdAt;
//   String pid;
//   String gen_number;
//   String isActive;
//   dynamic tmpApplicationcdv;
//   String kinMobileNo;
//   String maritalStatus;
//   dynamic docSigned;
//   dynamic annualIncome;
//   dynamic companyName;
//   dynamic companyAddress;
//   dynamic supervisorName;
//   dynamic supervisorMobile;
//   dynamic designation;
//   dynamic workingSince;
//   dynamic salary;
//   dynamic incomeSource;
//   dynamic incomeOthers;
//   bool whetherbasictrainingcomplete;
//   dynamic deploymentNotices;
//   DateTime approveddate;
//   dynamic sourceIncome;
//   dynamic extraAchievement;
//   dynamic eventName;
//   dynamic eventPeriod;
//   dynamic achievementDetails;
//   dynamic nishkamSevaType;
//   String nishkamSevaFrom;
//   dynamic noofnishakamduty;
//   dynamic position;
//   dynamic hfp;
//   dynamic btStartDate;
//   dynamic btEndDate;
//   dynamic trainingCertificateNo;
//   dynamic upcomingRenewal;

//   factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
//         applicationno: json["applicationno"],
//         aadhaarno: json["aadhaarno"],
//         identificationmark: json["identificationmark"],
//         occupationid: json["occupationid"],
//         employername: json["employername"],
//         officeaddress: json["officeaddress"],
//         officecontactno: json["officecontactno"],
//         equalificationid: json["equalificationid"],
//         whethercdexperience: json["whethercdexperience"],
//         cdexperiencedetails: json["cdexperiencedetails"],
//         whetherownvehicle: json["whetherownvehicle"],
//         whetherknowdriving: json["whetherknowdriving"],
//         bloodgroup: json["bloodgroup"],
//         whetherblooddonor: json["whetherblooddonor"],
//         profileImage: json["profile_image"],
//         heightfeet: json["heightfeet"],
//         heightinch: json["heightinch"],
//         weight: json["weight"],
//         phouseno: json["phouseno"],
//         psublocality: json["psublocality"],
//         plocalityid: json["plocalityid"],
//         psubdivcode: json["psubdivcode"],
//         pdistrictcode: json["pdistrictcode"],
//         pstateid: json["pstateid"],
//         pcountryid: json["pcountryid"],
//         ppincode: json["ppincode"],
//         districtname: json["districtname"],
//         subdivdescription: json["subdivdescription"],
//         cdvsubdivname: json["cdvsubdivname"],
//         post_name: json["post_name"],
//         sector_name: json["sector_name"],
//         enrollmentno: json["enrollmentno"],
//         chest: json["chest"],
//         enrollmentidold: json["enrollmentidold"],
//         vehicledetails: json["vehicledetails"],
//         whethermemberearlier: json["whethermemberearlier"],
//         memberearlierid: json["memberearlierid"],
//         memberearlierdetails: json["memberearlierdetails"],
//         whetherpcccomplete: json["whetherpcccomplete"],
//         drivingdetails: json["drivingdetails"],
//         whetherdischarge: json["whetherdischarge"],
//         cdvsubdivcode: json["cdvsubdivcode"],
//         accountholdername: json["accountholdername"],
//         accountno: json["accountno"],
//         bankcode: json["bankcode"],
//         ifsccode: json["ifsccode"],
//         micrcode: json["micrcode"],
//         enrollmentdate: json["enrollmentdate"],
//         trainingpreference: json["trainingpreference"],
//         languagecode: json["languagecode"],
//         advanceTrainingComplete: json["advance_training_complete"],
//         panNo: json["pan_no"],
//         email: json["email"],
//         skillsId: json["skills_id"],
//         bankName: json["bank_name"],
//         branchName: json["branch_name"],
//         isVerifiedBySdm: json["is_verified_by_sdm"],
//         preferredTrainingTime: json["preferred_training_time"],
//         preferredTimeNishkamSeva: json["preferred_time_nishkam_seva"],
//         nameofkin: json["nameofkin"],
//         relationwithkin: json["relationwithkin"],
//         whetherkinpermanentaddressissame:
//             json["whetherkinpermanentaddressissame"],
//         whetherkinpresentaddressissame: json["whetherkinpresentaddressissame"],
//         kinPresentAddress: json["kin_present_address"],
//         kinPermanentAddress: json["kin_permanent_address"],
//         applicantname: json["applicantname"],
//         applicantgender: json["applicantgender"],
//         applicantdob: json["applicantdob"],
//         applicantfathername: json["applicantfathername"],
//         applicantmothername: json["applicantmothername"],
//         applicanthusbandname: json["applicanthusbandname"],
//         applicantmobileno: json["applicantmobileno"],
//         referencedetails: json["referencedetails"],
//         applicanthousenumber: json["applicanthousenumber"],
//         applicantstreetnumber: json["applicantstreetnumber"],
//         applicantsublocality: json["applicantsublocality"],
//         applicantpermanentaddress: json["applicantpermanentaddress"],
//         applicantpresentaddress: json["applicantpresentaddress"],
//         whetherpresentorpermanentaddressissame:
//             json["whetherpresentorpermanentaddressissame"],
//         ip: json["ip"],
//         post: json["post"],
//         sector: json["sector"],
//         nationality: json["nationality"],
//         experience: json["experience"],
//         policeStation: json["police_station"],
//         declarationPlace: json["declaration_place"],
//         declarationDate: json["declaration_date"],
//         dobofkin: json["dobofkin"],
//         remarks: json["remarks"],
//         sdmId: json["sdm_id"],
//         heightcms: json["heightcms"],
//         applicantage: json["applicantage"],
//         whetherWorking: json["whether_working"],
//         whetherNocIssued: json["whether_noc_issued"],
//         whetherPoliceVerification: json["whether_police_verification"],
//         nameOfCivilDefenceCorps: json["name_of_civil_defence_corps"],
//         createdAt: DateTime.parse(json["created_at"]),
//         pid: json["pid"],
//         gen_number: json["gen_number"],
//         isActive: json["is_active"],
//         tmpApplicationcdv: json["tmp_applicationcdv"],
//         kinMobileNo: json["kin_mobile_no"],
//         maritalStatus: json["marital_status"],
//         docSigned: json["doc_signed"],
//         annualIncome: json["annual_income"],
//         companyName: json["company_name"],
//         companyAddress: json["company_address"],
//         supervisorName: json["supervisor_name"],
//         supervisorMobile: json["supervisor_mobile"],
//         designation: json["designation"],
//         workingSince: json["working_since"],
//         salary: json["salary"],
//         incomeSource: json["income_source"],
//         incomeOthers: json["income_others"],
//         whetherbasictrainingcomplete: json["whetherbasictrainingcomplete"],
//         deploymentNotices: json["deployment_notices"],
//         approveddate: DateTime.parse(json["approveddate"]),
//         sourceIncome: json["source_income"],
//         extraAchievement: json["extra_achievement"],
//         eventName: json["event_name"],
//         eventPeriod: json["event_period"],
//         achievementDetails: json["achievement_details"],
//         nishkamSevaType: json["nishkam_seva_type"],
//         nishkamSevaFrom: json["nishkam_seva_from"],
//         noofnishakamduty: json["noofnishakamduty"],
//         position: json["position"],
//         hfp: json["hfp"],
//         btStartDate: json["bt_start_date"],
//         btEndDate: json["bt_end_date"],
//         trainingCertificateNo: json["training_certificate_no"],
//         upcomingRenewal: json["upcoming_renewal"],
//       );

//   get preferred_time_nishkam_seva => null;

//   Map<String, dynamic> toJson() => {
//         "applicationno": applicationno,
//         "aadhaarno": aadhaarno,
//         "identificationmark": identificationmark,
//         "occupationid": occupationid,
//         "employername": employername,
//         "officeaddress": officeaddress,
//         "officecontactno": officecontactno,
//         "profile_image": profileImage,
//         "equalificationid": equalificationid,
//         "whethercdexperience": whethercdexperience,
//         "cdexperiencedetails": cdexperiencedetails,
//         "whetherownvehicle": whetherownvehicle,
//         "whetherknowdriving": whetherknowdriving,
//         "bloodgroup": bloodgroup,
//         "whetherblooddonor": whetherblooddonor,
//         "heightfeet": heightfeet,
//         "heightinch": heightinch,
//         "weight": weight,
//         "phouseno": phouseno,
//         "psublocality": psublocality,
//         "plocalityid": plocalityid,
//         "psubdivcode": psubdivcode,
//         "pdistrictcode": pdistrictcode,
//         "pstateid": pstateid,
//         "pcountryid": pcountryid,
//         "ppincode": ppincode,
//         "enrollmentno": enrollmentno,
//         "chest": chest,
//         "districtname": districtname,
//         "subdivdescription": subdivdescription,
//         "cdvsubdivname": cdvsubdivname,
//         "post_name": post_name,
//         "sector_name": sector_name,
//         "enrollmentidold": enrollmentidold,
//         "vehicledetails": vehicledetails,
//         "whethermemberearlier": whethermemberearlier,
//         "memberearlierid": memberearlierid,
//         "memberearlierdetails": memberearlierdetails,
//         "whetherpcccomplete": whetherpcccomplete,
//         "drivingdetails": drivingdetails,
//         "whetherdischarge": whetherdischarge,
//         "cdvsubdivcode": cdvsubdivcode,
//         "accountholdername": accountholdername,
//         "accountno": accountno,
//         "bankcode": bankcode,
//         "ifsccode": ifsccode,
//         "micrcode": micrcode,
//         "enrollmentdate": enrollmentdate,
//         "trainingpreference": trainingpreference,
//         "languagecode": languagecode,
//         "advance_training_complete": advanceTrainingComplete,
//         "pan_no": panNo,
//         "email": email,
//         "skills_id": skillsId,
//         "bank_name": bankName,
//         "branch_name": branchName,
//         "is_verified_by_sdm": isVerifiedBySdm,
//         "preferred_training_time": preferredTrainingTime,
//         "preferred_time_nishkam_seva": preferredTimeNishkamSeva,
//         "nameofkin": nameofkin,
//         "relationwithkin": relationwithkin,
//         "whetherkinpermanentaddressissame": whetherkinpermanentaddressissame,
//         "whetherkinpresentaddressissame": whetherkinpresentaddressissame,
//         "kin_present_address": kinPresentAddress,
//         "kin_permanent_address": kinPermanentAddress,
//         "applicantname": applicantname,
//         "applicantgender": applicantgender,
//         "applicantdob": applicantdob,
//         "applicantfathername": applicantfathername,
//         "applicantmothername": applicantmothername,
//         "applicanthusbandname": applicanthusbandname,
//         "applicantmobileno": applicantmobileno,
//         "referencedetails": referencedetails,
//         "applicanthousenumber": applicanthousenumber,
//         "applicantstreetnumber": applicantstreetnumber,
//         "applicantsublocality": applicantsublocality,
//         "applicantpermanentaddress": applicantpermanentaddress,
//         "applicantpresentaddress": applicantpresentaddress,
//         "whetherpresentorpermanentaddressissame":
//             whetherpresentorpermanentaddressissame,
//         "ip": ip,
//         "post": post,
//         "sector": sector,
//         "nationality": nationality,
//         "experience": experience,
//         "police_station": policeStation,
//         "declaration_place": declarationPlace,
//         "declaration_date": declarationDate,
//         "dobofkin": dobofkin,
//         "remarks": remarks,
//         "sdm_id": sdmId,
//         "heightcms": heightcms,
//         "applicantage": applicantage,
//         "whether_working": whetherWorking,
//         "whether_noc_issued": whetherNocIssued,
//         "whether_police_verification": whetherPoliceVerification,
//         "name_of_civil_defence_corps": nameOfCivilDefenceCorps,
//         "created_at": createdAt.toIso8601String(),
//         "pid": pid,
//         "gen_number": gen_number,
//         "is_active": isActive,
//         "tmp_applicationcdv": tmpApplicationcdv,
//         "kin_mobile_no": kinMobileNo,
//         "marital_status": maritalStatus,
//         "doc_signed": docSigned,
//         "annual_income": annualIncome,
//         "company_name": companyName,
//         "company_address": companyAddress,
//         "supervisor_name": supervisorName,
//         "supervisor_mobile": supervisorMobile,
//         "designation": designation,
//         "working_since": workingSince,
//         "salary": salary,
//         "income_source": incomeSource,
//         "income_others": incomeOthers,
//         "whetherbasictrainingcomplete": whetherbasictrainingcomplete,
//         "deployment_notices": deploymentNotices,
//         "approveddate": approveddate.toIso8601String(),
//         "source_income": sourceIncome,
//         "extra_achievement": extraAchievement,
//         "event_name": eventName,
//         "event_period": eventPeriod,
//         "achievement_details": achievementDetails,
//         "nishkam_seva_type": nishkamSevaType,
//         "nishkam_seva_from": nishkamSevaFrom,
//         "noofnishakamduty": noofnishakamduty,
//         "position": position,
//         "hfp": hfp,
//         "bt_start_date": btStartDate,
//         "bt_end_date": btEndDate,
//         "training_certificate_no": trainingCertificateNo,
//         "upcoming_renewal": upcomingRenewal,
//       };
// }
