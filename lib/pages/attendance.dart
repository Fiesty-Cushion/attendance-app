import 'package:flutter/material.dart';
import 'package:ui_test/utils/theme_colors.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.mDeepBlue,
        body: CustomScrollView(controller: scrollController, slivers: [
          SliverAppBar(
              floating: true,
              expandedHeight: 120.0,
              automaticallyImplyLeading: false,
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.all(40),
                title: Text('Leaderboard'),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add new entry',
                  onPressed: () {},
                ),
              ]),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
              height: 1500,
              child: ListView.builder(
                //  add the same scrollController here
                controller: scrollController,
                shrinkWrap: true,
                itemCount: 19,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Student",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]));
  }
}
