import 'package:cdv/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';

import '../drawer/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        leading: MenuWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 5.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff2f0c5),
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   colors: [
                //     Colors.red[800],
                //     Colors.red[400],
                //     Colors.red[200],
                //     // Colors.red[400],
                //   ],
                // ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: const Text(
                            'Directorate of\nCivil Defence,\nGovt. NCT of Delhi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.red[900]!,
                      Colors.red[800]!,
                      Colors.red[400]!,
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'PROFILE CARD',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileCardWidget(),
          ],
        ),
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.red[900]!,
    //     title: const Text('Home Screen'),
    //     centerTitle: true,
    //     leading: const MenuWidget(),
    //   ),
    //   body: Center(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: <Widget>[
    //           Container(
    //             height: MediaQuery.of(context).size.height / 5.5,
    //             width: double.infinity,
    //             decoration: const BoxDecoration(
    //               color: Color(0xfff2f0c5),
    //               borderRadius: BorderRadius.only(
    //                 bottomLeft: Radius.circular(60),
    //                 bottomRight: Radius.circular(60),
    //               ),
    //             ),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 const SizedBox(
    //                   height: 20,
    //                 ),
    //                 // Row(children: <Widget> [
    //                 //   Center(
    //                 // //         child: Image.asset(
    //                 // //           'assets/images/logo.png',
    //                 // //           height: 100,
    //                 // //         ),
    //                 // ],),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: <Widget>[
    //                     Center(
    //                       child: Image.asset(
    //                         'assets/images/logo.png',
    //                         height: 100,
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       width: 20,
    //                     ),
    //                     const Padding(
    //                       padding: EdgeInsets.all(5),
    //                       child: Text(
    //                         'Directorate of\nCivil Defence,\nGovt. NCT of Delhi',
    //                         textAlign: TextAlign.center,
    //                         style: TextStyle(
    //                           color: Colors.brown,
    //                           fontSize: 20,
    //                           // fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       height: 10,
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           Card(
    //             margin: const EdgeInsets.symmetric(horizontal: 20),
    //             elevation: 10,
    //             color: Colors.transparent,
    //             child: Container(
    //               width: double.infinity,
    //               height: 50,
    //               decoration: BoxDecoration(
    //                 gradient: LinearGradient(
    //                   begin: Alignment.topCenter,
    //                   colors: [
    //                     Colors.red[900]!,
    //                     Colors.red[800]!,
    //                     Colors.red[400]!,
    //                   ],
    //                 ),
    //                 border: Border.all(
    //                   color: Colors.white,
    //                   width: 2,
    //                 ),
    //                 borderRadius: const BorderRadius.all(
    //                   Radius.circular(10),
    //                 ),
    //               ),
    //               child: const Center(
    //                 child: Text(
    //                   'PROFILE CARD',
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                     color: Colors.white,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           const ProfileCard(),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
