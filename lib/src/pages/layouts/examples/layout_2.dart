import 'package:flutter/material.dart';

class Layout2 extends StatelessWidget {
  const Layout2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = AppBar().preferredSize.height;
    final actualViewHeight = screenHeight - statusBarHeight - appBarHeight;

    return Scaffold(
      appBar: AppBar(title: Text('Practice')),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: actualViewHeight),
          child: IntrinsicHeight(
            child: Column(
              children: [
                // --------------------
                // Header
                // --------------------
                Container(
                  height: 100,
                  color: Colors.amber,
                  child: Center(child: Text('Header')),
                ),

                // --------------------
                // Content
                // --------------------
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 5,
                        children: [
                          ...List.generate(2, (index) {
                            return Text('Item ${index + 1}');
                          }),
                        ],
                      ),
                    ),
                  ),
                ),

                // --------------------
                // Footer
                // --------------------
                Container(
                  height: 100,
                  color: Colors.red,
                  child: Center(child: Text('Footer')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
