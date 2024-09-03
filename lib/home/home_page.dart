import 'package:doit/features/addhabits.dart';
import 'package:doit/utils/themes/cust_theme.dart';
import 'package:flutter/material.dart';
import 'package:doit/setting.dart';

// import 'package:flutter_projects/frequency.dart';
import '../constants.dart';
import '../habits.dart';
import '../usersignin.dart';
import 'awardshome.dart';
import 'historyhome.dart';

// import 'package:flutter_projects/notes.dart';
// import 'package:flutter_projects/report.dart';
// import 'package:flutter_projects/searchHabit.dart';
// import 'package:flutter_projects/setting.dart';
// import 'package:flutter_projects/stats.dart';
// import 'package:flutter_projects/userAcc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeMode _themeMode = ThemeMode.system;

  bool isDarkMode = false;

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      // _themeMode = themeMode;
      isDarkMode = themeMode == ThemeMode.dark;
    });
  }

  ThemeData get currentTheme =>
      isDarkMode ? MyAppThemes.darkTheme : MyAppThemes.lightTheme;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    //Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentTheme.primaryColor,
        //Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (isOn) {
              isOn
                  ? _toggleTheme(ThemeMode.dark)
                  : _toggleTheme(ThemeMode.light);
            },
          )
        ],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // const Text(
          //   'DoIt',
          // ),
          // Text(
          //   '',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          Row(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight / 2,
                child: Image.asset(
                  home, // Replace with your actual asset path
                  fit: BoxFit
                      .fill, // This will stretch the image to fill the given dimensions
                ),
              ),
            ],
          ),
          const Row(
            children: [
              HistoryHome(),
            ],
          ),

          const Row(
            children: [
              AwardsHome(),
            ],
          ),

          //   Image.asset(home,
          //   height: screenHeight/2,
          //       width: screenWidth),
        ],
      ),
      floatingActionButton: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddHabits()))
                .then((_) => null),
            tooltip: 'Increment',
            icon: const Icon(Icons.add),
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Setting()))
                .then((_) => null),
            tooltip: 'settings',
            icon: const Icon(Icons.settings),
            color: Colors.blue,
          ),
          // IconButton(
          //   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Notes())).then((_) => null),
          //   tooltip: 'notes',
          //   icon: const Icon(Icons.receipt),
          //   color: Colors.blue,
          // ),
          // IconButton(
          //   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Frequency())).then((_) => null),
          //   tooltip: 'frequency',
          //   icon: const Icon(Icons.timeline),
          //   color: Colors.blue,
          // ),
          // IconButton(
          //   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Report())).then((_) => null),
          //   tooltip: 'report',
          //   icon: const Icon(Icons.bar_chart),
          //   color: Colors.blue,
          // ),
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UserSignIn())).then((_) => null),
            tooltip: 'Account',
            icon: const Icon(Icons.person),
            color: Colors.blue,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
