import 'package:flutter/material.dart';
import 'dart:math';

class RewardsView extends StatelessWidget {
  const RewardsView({Key? key});

  @override
  Widget build(BuildContext context) {
    int unlockingValue = 10; // Initial value for unlocking

    return Scaffold(
      appBar: AppBar(
        title: Text("Rewards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _RewardCard(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Rewards Earned...",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < 2) {
                return Card(
                  child: ListTile(
                    title: Text("Level ${index + 1}"),
                    subtitle: Text("Level Completed"),
                    leading: Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                );
              } else {
                unlockingValue += 10; // Increment the unlocking value
                return Card(
                  child: ListTile(
                    title: Text("Level ${index + 1}"),
                    subtitle: Text("Earn ${(index + 1) + unlockingValue} to unlock"),
                    leading: Icon(
                      Icons.price_change,
                      color: Colors.grey,
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                );
              }
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}

class _RewardCard extends StatelessWidget {
  const _RewardCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "250",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Your Points",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.card_giftcard,
                  size: 52,
                )
              ],
            ),
            Divider(),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Redeem Now"),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
