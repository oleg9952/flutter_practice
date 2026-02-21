import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final String? label;
  final Color? color;
  final VoidCallback onTap;

  const PillButton({
    super.key,
    this.label = 'label',
    this.color = Colors.blueAccent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(width: 1),
            color: color!,
            boxShadow: [
              BoxShadow(
                color: color!.withValues(alpha: 0.5),
                blurRadius: 3,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Text(label!, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
