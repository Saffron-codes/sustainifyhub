import 'package:flutter/material.dart';
import 'dart:math';

class RewardsView extends StatelessWidget {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
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
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text("Level ${index + 1}"),
                subtitle: Text(
                    "Earn ${(index + 1) + Random().nextInt(10) * 10} to unlock"),
                leading: Icon(
                  Icons.price_change,
                  color: Colors.grey,
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            itemCount: 10,
          )
        ],
      ),
    );
  }
}

class _RewardCard extends StatelessWidget {
  const _RewardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 180,
        width: MediaQuery.sizeOf(context).width,
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
                      "2500",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Your Points",
                      style: Theme.of(context).textTheme.bodyMedium,
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
              child: FilledButton(
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
