import 'package:flutter/material.dart';

import '../../common/widgets/section_head.dart';
import 'custom/pill_button.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  bool isActive = true;

  void handleActiveToggle() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 25),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHead(text: 'Practice'),

              FilledButton(
                onPressed: handleActiveToggle,
                child: Text('toggle'),
              ),

              // ----------------------------
              // ElevatedButton
              // ----------------------------
              ElevatedButton(
                onPressed: isActive ? handleActiveToggle : null,
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors
                      .white, // color for text, which works with disabled state
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('ElevatedButton', style: TextStyle(fontSize: 20)),
              ),

              // ----------------------------
              // FilledButton
              // ----------------------------
              FilledButton(
                onPressed: isActive ? handleActiveToggle : null,
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                  disabledForegroundColor: Colors.grey,
                ),
                child: Text('FilledButton'),
              ),

              // ----------------------------
              // OutlinedButton
              // ----------------------------
              OutlinedButton(
                onPressed: isActive ? handleActiveToggle : null,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.red)
                    .copyWith(
                      side: WidgetStateProperty.resolveWith((state) {
                        if (state.contains(WidgetState.disabled)) {
                          return BorderSide(width: 2, color: Colors.grey);
                        }

                        return BorderSide(width: 5, color: Colors.red);
                      }),
                    ),
                child: Text('OutlinedButton'),
              ),

              // ----------------------------
              // TextButton
              // ----------------------------
              TextButton(
                onPressed: isActive ? handleActiveToggle : null,
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: Text('TextButton'),
              ),

              // ----------------------------
              // TextButton
              // ----------------------------
              IconButton(
                onPressed: isActive ? handleActiveToggle : null,
                iconSize: 50,
                color: Colors.red,
                icon: Icon(Icons.access_alarm),
              ),

              // ----------------------------
              // CUSTOM: FilledButton with icon
              // ----------------------------
              FilledButton(
                onPressed: isActive ? handleActiveToggle : null,
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10,
                  children: [
                    Icon(Icons.star_border_purple500_sharp, size: 40),
                    Text('Save', style: TextStyle(fontSize: 25)),
                  ],
                ),
              ),

              // ----------------------------
              // CUSTOM: FilledButton.icon with icon
              // ----------------------------
              FilledButton.icon(
                onPressed: isActive ? handleActiveToggle : null,
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                icon: Icon(Icons.star_border_purple500_sharp, size: 40),
                label: Text('Save', style: TextStyle(fontSize: 25)),
              ),

              // ----------------------------
              // EXERCISES
              // ----------------------------
              SectionHead(
                text: 'Pill Button',
                description:
                    'Build a custom button using InkWell + Container that looks like a pill (fully rounded corners). It should accept label, color, and onTap as parameters. Use it 3 times on screen with different colors.',
              ),
              PillButton(onTap: () {}, label: 'Click ME!'),
            ],
          ),
        ),
      ),
    );
  }
}
