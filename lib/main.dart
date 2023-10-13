import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/firebase_options.dart';
import 'package:flutter_applicatioaserwerwr/view/homescreen.dart';
import 'package:flutter_applicatioaserwerwr/view/layoutscrens.dart';
import 'package:flutter_applicatioaserwerwr/view/note_view.dart';
import 'package:flutter_applicatioaserwerwr/view/onlyProductScreen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'bidinges.dart';
import 'view/loginscreens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: bidinges(),
      home: StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              // User is logged in
              return layoutscrens();
            } else {
              // User is not logged in
              return layoutscrens();
            }
          }
        },
      ),
    );
  }
}
