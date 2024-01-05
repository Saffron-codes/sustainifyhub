import 'package:flutter/material.dart';
import 'package:sustainify_hub/widgets/community_box.dart';
import 'package:sustainify_hub/widgets/progress_card.dart';
import 'package:sustainify_hub/widgets/welcome_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        WelcomeBox(),
        ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(18),
          children: [
            SizedBox(
              height: 20,
            ),
            ProgressCard(),
            SizedBox(
              height: 20,
            ),
            CommunityBox(),
          ],
        )
      ],
    ));
  }
}
