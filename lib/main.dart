import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_test/pages/attendance.dart';
import 'package:ui_test/pages/main_page.dart';
import 'package:ui_test/pages/profile.dart';
import 'package:ui_test/pages/routine.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

import 'utils/screen_routes.dart';
import 'utils/theme_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: GoogleFonts.lato().fontFamily,
          iconTheme: IconThemeData(
            color: MyColors.mWhite,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: MyColors.mDeepBlue,
            titleTextStyle: Theme.of(context).textTheme.headline6,
          ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        MyRoute.mainRoute: (context) => MainPage(),
        MyRoute.homeRoute: (context) => HomePage(),
        MyRoute.loginRoute: (context) => LoginPage(),
        MyRoute.attendanceRoute: (context) => AttendancePage(),
        MyRoute.routineRoute: (context) => RoutinePage(),
        MyRoute.profileRoute: (context) => ProfilePage(),
      },
    );
  }
}
