import 'package:doit/services/firebase_services.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

class GoogleSignInIcon extends StatelessWidget {
  final double iconSize;
  //final Color backgroundColor;

  GoogleSignInIcon({
    this.iconSize = 40,
    //this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      icon: Image.asset(
          "assets/images/google.png",
        width: iconSize,
        height: iconSize,
      ),
      onPressed: () async {
        try {
          await FirebaseServices().signInWithGoogle();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomePage()));
        } catch (e){
          print(e.toString());
        }
      },
    );
  }
}
