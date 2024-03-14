import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Card(
        //   margin: const EdgeInsets.symmetric(horizontal: 20),
        //   elevation: 10,
        //   color: Colors.transparent,
        //   child: Container(
        //     width: double.infinity,
        //     height: 50,
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         colors: [
        //           Colors.red[900]!,
        //           Colors.red[800]!,
        //           Colors.red[400]!,
        //         ],
        //       ),
        //       border: Border.all(
        //         color: Colors.white,
        //         width: 2,
        //       ),
        //       borderRadius: const BorderRadius.all(
        //         Radius.circular(10),
        //       ),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         'PROFILE CARD',
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        const SizedBox(
          height: 20,
        ),
        // ProfileCardDetailsWidget(),
      ],
    );
  }
}
