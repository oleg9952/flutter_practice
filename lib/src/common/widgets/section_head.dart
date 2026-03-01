import 'package:flutter/material.dart';

class SectionHead extends StatelessWidget {
  final String? text;
  final String? description;

  const SectionHead({super.key, this.text = 'Practice', this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        // ----------------------------
        // TITLE
        // ----------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),

        // ----------------------------
        // DESCRIPTION
        // ----------------------------
        if (description != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(description!, style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        Divider(),
      ],
    );
  }
}
