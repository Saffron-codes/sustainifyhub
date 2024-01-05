import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String text;
  const PageHeader(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 26),
      ),
    );
  }
}
