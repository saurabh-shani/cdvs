import 'package:flutter/material.dart';

class NoAvailableNoticeWidget extends StatelessWidget {
  const NoAvailableNoticeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Colors.red[200]!,
            Colors.deepOrange[200]!,
            Colors.orange[200]!,
          ],
        ),
      ),
      child: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Container(
            height: 100,
            width: 250,
            margin: EdgeInsets.all(10),
            child: Text(
              'There is no Notice for you at the moment. You will get notification when there is notice for you related to this type of sewa',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
