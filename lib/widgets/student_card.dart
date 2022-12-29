import 'package:flutter/material.dart';
import 'package:ui_test/utils/theme_colors.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.mGrey,
      elevation: 1.0,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: 200,
        width: 350,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: MyColors.mWhite,
                      child: const CircleAvatar(
                        radius: 47.0,
                        backgroundImage: NetworkImage(
                            "https://lh3.googleusercontent.com/a/AEdFTp5OnPQLOlDjBO-NuigMSIZfWbWC2RlmtShA_1WkwQ=s360-p-rw-no"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        // Container(
                        //   margin: const EdgeInsets.only(top: 8),
                        //   width: 150,
                        //   color: Colors.black54,
                        //   height: 2,
                        // ),
                        SizedBox(height: 10),
                        Text('BCT 1st Year 2nd Sem',
                            style: TextStyle(fontSize: 13.0)),
                        Text('078BCT037',
                            style: TextStyle(fontSize: 13.0)),
                        Text('BCT AB', style: TextStyle(fontSize: 13.0)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fiesty Cushion",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: MyColors.mDeepBlue,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          "078bct037.braj@pcampus.edu.np",
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                    //const SizedBox(width: 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Computer Enginnering",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            color: MyColors.mDeepBlue,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          "Pulchowk Campus",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
