import 'package:flutter/material.dart';

class SurplusView extends StatelessWidget {
  const SurplusView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'name': "Food", 'icon': Icons.food_bank},
      {'name': "Construction Materials", 'icon': Icons.construction},
      {'name': "Office Supplies", 'icon': Icons.work},
      {'name': "Decorations", 'icon': Icons.style},
      {'name': "Baby Products", 'icon': Icons.baby_changing_station},
      {'name': "Pet Products", 'icon': Icons.pets}
    ];

    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              "Exchange your items",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 26),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: items
                  .map(
                    (item) => _SurplusItemCard(
                      title: item['name'].toString(),
                      icon: item['icon'] as IconData,
                      onclick: () => showBuySellDialog(context),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  void showBuySellDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Are you planning to ? "),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/surplus/sell');
              },
              child: Text("Sell")),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/surplus/buy');
              },
              child: Text("Buy")),
        ],
      ),
    );
  }
}

class _SurplusItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onclick;
  const _SurplusItemCard({
    required this.title,
    required this.icon,
    required this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onclick,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.green[400],
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              // OutlinedButton.icon(
              //   onPressed: () {},
              //   label: Text("Connect"),
              //   icon: Icon(Icons.add),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
