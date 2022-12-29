import 'package:flutter/material.dart';
import 'package:ui_test/widgets/attendance_chart.dart';
import 'package:ui_test/widgets/daily_routine.dart';
import '../widgets/student_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            children: [
              const StudentCard(),
              const SizedBox(height: 30.0),
              AttendanceChart(),
              const SizedBox(height: 30.0),
              DailyRoutine(),
            ],
          )

        ),
      ),
    );
  }
}




