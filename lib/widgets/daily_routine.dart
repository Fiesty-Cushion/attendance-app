import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DailyRoutine extends StatelessWidget {
  const DailyRoutine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 350.0,
          child: Column(
              children: [
                const Text(
                  "Today's Routine",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  thickness: 1.5,
                ),
                Padding(
                  padding: const EdgeInsets.only( top: 10.0, left: 10.0, right: 10.0,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Period", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Teacher", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Time", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Divider(),
                      const SizedBox(height: 10.0),
                      Divider(),
                      const SizedBox(height: 10.0),
                      Divider(),
                      const SizedBox(height: 10.0),
                      Divider(),
                      const SizedBox(height: 10.0),
                      Divider(),
                      const SizedBox(height: 10.0),
                      Divider(),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
