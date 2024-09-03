import 'package:doit/firebase_options.dart';
import 'package:doit/setting.dart';
import 'package:doit/utils/themes/cust_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'frequency.dart';
// import 'home_page.dart';
// import 'searchHabit.dart';
// import 'setting.dart';
// import 'stats.dart';
// import 'notes.dart';
// import 'report.dart';
// import 'userAcc.dart';
import 'habits.dart';
import 'usersignin.dart';

import 'constants.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_projects/utils/themes/theme.dart';
// import 'package:get/get.dart';
//
// import 'firebase_options.dart';

import 'home/home_page.dart';

void main() async{

  // await Firebase.initializeApp();
  //   //options: DefaultFirebaseOptions(),
  //       //.currentPlatform).then(
  //   //(FirebaseApp value) => Get.put(AuthenticationRepository()),
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // ... other properties
    routes: {
      '/': (context) => const MyHomePage(), // Home page route
      '/settings': (context) => const Setting(),
      '/habits': (context) => const Habits(),
      '/usersignin': (context) => const UserSignIn(),
      // '/stats' : (context) => const Statistic(),
      // '/notes' : (context) => const Notes(),
      // '/freq' : (context) =>  const Frequency(),
      // '/search' : (context) =>  const SearchHabit(),
      // '/report' : (context) =>  const Report(),
      // '/user' : (context) =>  const UserAccount(),// Settings page route
    },
  )); //const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: MyAppThemes.lightTheme,
      darkTheme: MyAppThemes.darkTheme,
      themeMode: ThemeMode.system,
      //.system,
      // theme: DoItTheme.lightTheme,
      // darkTheme: DoItTheme.darkTheme,
      // theme: ThemeData(
      //   textTheme: const TextTheme(
      //     bodyLarge: TextStyle(fontSize: 14, color: Colors.green),
      //   ),

        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
    );
  }
}


