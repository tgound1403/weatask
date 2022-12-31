import 'package:flutter/material.dart';

class TipCard extends StatelessWidget {
  String? displayText;
  TipCard({this.displayText});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(20))),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 4, horizontal: 8),
        child: Text(
          "${this.displayText}",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
