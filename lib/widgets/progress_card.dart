import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Progress",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Card(
          color: Colors.green[200],
          margin: EdgeInsets.only(top: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProgressCircle("Weekly"),
                    ProgressCircle("Monthly"),
                    ProgressCircle("Yearly"),
                  ],
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("12"),
                          Text("Sold"),
                        ],
                      ),
                      Container(
                        width: 2,
                        height: 180 * 0.2,
                        color: Colors.grey,
                      ),
                      Column(
                        children: [
                          Text("45"),
                          Text("Bought"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProgressCircle extends StatelessWidget {
  final String content;
  const ProgressCircle(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.green[900],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          Text(
            content,
            style: TextStyle(
                fontSize: 12, color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ],
      ),
    );
  }
}
