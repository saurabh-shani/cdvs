import 'package:cdv/widgets/notice_detail_widget.dart';
import 'package:flutter/material.dart';

class NoticeDetailScreen extends StatelessWidget {
  const NoticeDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/notice_detial_screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    final notice_type = routeArgs['notice_type'];
    final notice_id = routeArgs['notice_id'];
    final appNo = routeArgs['appNo'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Notice Details'),
        centerTitle: false,
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [
              Colors.red[900]!,
              Colors.red[800]!,
              Colors.red[400]!,
            ],
          ),
        ),
        child: Card(
          margin: EdgeInsets.all(20),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: NoticeDetailWidget(
            noticeType: notice_type,
            noticeId: notice_id,
            flag: 1,
          ),
        ),
      ),
    );
  }
}
