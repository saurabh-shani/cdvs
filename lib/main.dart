import 'package:cdv/drawer/drawer_page.dart';
import 'package:cdv/screens/home_screen.dart';
import 'package:cdv/screens/login_screen.dart';
import 'package:cdv/screens/notice_details_screen.dart';
import 'package:cdv/screens/notice_screen.dart';
import 'package:cdv/screens/otp_screen.dart';
import 'package:cdv/screens/profile_screen.dart';
import 'package:cdv/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the
  // root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        // NishkamSewaNoticeDetailScreen.routeName: (ctx) =>
        //     NishkamSewaNoticeDetailScreen(),
        // PaidDutyBelowThirtyDayNoticeDetailScreen.routeName: (ctx) =>
        //     PaidDutyBelowThirtyDayNoticeDetailScreen(),
        // PaidDutyAboveThirtyDaysNoticeDetailScreen.routeName: (ctx) =>
        //     PaidDutyAboveThirtyDaysNoticeDetailScreen(),
        // NoticeScreen.routeName: (ctx) => NoticeScreen(),
        // AppliedNoticePaidbelowThirtyScreen.routeName: (ctx) =>
        //     AppliedNoticePaidbelowThirtyScreen(),
        // AppliedNoticeAboveThirtyDaysDetailScreen.routeName: (ctx) =>
        //     AppliedNoticeAboveThirtyDaysDetailScreen(),
        // AppliedNoticeScreen.routeName: (ctx) => AppliedNoticeScreen(),
        // AppliedNoticeDetailsScreen.routeName: (ctx) =>
        //     AppliedNoticeDetailsScreen(),
        OtpScreen.routeName: (ctx) => OtpScreen(),
        NoticeDetailScreen.routeName: (ctx) => NoticeDetailScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        NoticeScreen.routeName: (ctx) => NoticeScreen(),
      },
    );
  }
}
