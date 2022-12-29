import 'package:flutter/material.dart';
import 'package:ui_test/widgets/search_app_bar.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverSearchAppBar(),
            pinned: true,
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "Student Name",
                  style: TextStyle(fontSize: 20),
                ),
              );
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}
