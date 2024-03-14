import 'package:cdv/database/profile_database.dart';
import 'package:cdv/models/profile_data_model.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatefulWidget {
  final double imageHeight;
  const ProfileImageWidget({Key? key, required this.imageHeight})
      : super(key: key);

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  List<ProfileDataModel> cdvProfile = [];
  final dbhelper = ProfileDatabase.instance;
  String? profileImage;
  Image? noImage;
  @override
  void initState() {
    fetchAndSetProfile();
    super.initState();
  }

  fetchAndSetProfile() async {
    var allrows = await dbhelper.queryallfromProfile();
    for (var data in allrows) {
      cdvProfile.add(new ProfileDataModel(
        profileImage: data['profile_image'],
      ));
    }
    cdvProfile.forEach((element) {
      setState(() {
        profileImage = element.profileImage.toString();
      });
    });
    print(profileImage);
    noImage = Image.asset('assets/images/logo.png');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          if (profileImage != null)
            Container(
              height: widget.imageHeight,
              child: Image.network(
                'some api',
                loadingBuilder: (context, child, loadingProgress) =>
                    (loadingProgress == null)
                        ? child
                        : CircularProgressIndicator(),
                errorBuilder: (context, error, stackTrace) => noImage!,
                fit: BoxFit.fill,
              ),
            ),
          if (profileImage == null)
            Image.network(
              'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80',
              fit: BoxFit.fill,
              height: widget.imageHeight,
            ),
        ],
      ),
    );
  }
}



// import 'package:cdv/Database/d_h.dart';
// import 'package:cdv/Models/p_m.dart';
// import 'package:flutter/material.dart';

// class ProfileImageWidget extends StatefulWidget {
//   @override
//   State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
// }

// class _ProfileImageWidgetState extends State<ProfileImageWidget> {
//   final double imageHeight;
//   const ProfileImageWidget({Key? key, required this.imageHeight})
//       : super(key: key);
  
  
//   List<P_M> cdvProfile = [];
//   final dbhelper = D_H.instance;
//   String profileImage;
//   Image noImage;
//   @override
//   void initState() {
//     fetchAndSetProfile();
//     super.initState();
//   }

//   fetchAndSetProfile() async {
//     var allrows = await dbhelper.queryallfromProfile();
//     for (var data in allrows) {
//       cdvProfile.add(new P_M(
//         profileImage: data['profile_image'],
//       ));
//     }
//     cdvProfile.forEach((element) {
//       setState(() {
//         profileImage = element.profileImage.toString();
//       });
//     });
//     print(profileImage);
//     noImage = Image.asset('assets/images/logo.png');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return profileImage != null
//         ? Container(
//             child: Image.network(
//               'some api',
//               loadingBuilder: (context, child, loadingProgress) =>
//                   (loadingProgress == null)
//                       ? child
//                       : CircularProgressIndicator(),
//               errorBuilder: (context, error, stackTrace) => noImage,
//               fit: BoxFit.fill,
//             ),
//           )
//         : noImage;
//   }
// }



// import 'package:flutter/material.dart';

// class ProfileImageWidget extends StatelessWidget {
//   final double imageHeight;
//   const ProfileImageWidget({Key? key, required this.imageHeight})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80',
//       fit: BoxFit.fill,
//     );
//     // Image.asset(
//     //   'assets/images/logo.png',
//     //   height: imageHeight,
//     // );
//   }
// }
