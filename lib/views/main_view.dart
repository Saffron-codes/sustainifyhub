import 'package:flutter/material.dart';
import 'package:sustainify_hub/views/home_view.dart';
import 'package:sustainify_hub/views/rewards_view.dart';
import 'package:sustainify_hub/views/scrapes_view.dart';
import 'package:sustainify_hub/views/surplus_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int index = 0;

  List<Widget> tabs = [HomeView(), SurplusView(), ScrapesView(), RewardsView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "Surplus"),
          BottomNavigationBarItem(
              icon: Icon(Icons.recycling), label: "Scrapes"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Rewards"),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
