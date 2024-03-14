import 'package:flutter/material.dart';

class DialogBoxWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red[100],
      elevation: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Card(
        color: Colors.red[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.message_rounded,
                color: Colors.red,
                size: 100,
              ),
              const Text(
                '!! An error occured !!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      content: const Text(
        'You have entered wrong mobile number / PID number',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        Card(
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          margin: const EdgeInsets.all(8.0),
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Try Again',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
