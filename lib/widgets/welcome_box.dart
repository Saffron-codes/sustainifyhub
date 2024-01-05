import 'package:flutter/material.dart';

class WelcomeBox extends StatelessWidget {
  const WelcomeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.28,
          color: Colors.green[400],
          // child: Row(
          //   children: [
          //     CircleAvatar(
          //       radius: 28,
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           "Hi,",
          //           style: Theme.of(context).textTheme.labelLarge,
          //         ),
          //         Text("Rajeshwar"),
          //       ],
          //     ),
          //     Spacer(),
          //     IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
          //   ],
          // ),
        ),
        Positioned(
          bottom: 40,
          left: 10,
          child: Text(
            "Hi, Rajeshwar!",
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 38),
          ),
        ),
        Positioned(
          child: Image.asset(
            "assets/hand.png",
            height: 200,
            width: 190,
          ),
          right: -10,
          bottom: -40,
        )
      ],
    );
  }
}
