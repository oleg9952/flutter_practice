import 'package:flutter/material.dart';

const headerHeight = 100.0;
const footerHeight = 50.0;

class Layout1 extends StatelessWidget {
  const Layout1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ------------------------
            // HEADER
            // ------------------------
            Container(
              width: double.infinity,
              height: headerHeight,
              color: Colors.amber,
              alignment: Alignment.center,
              child: Text('HEADER'),
            ),

            // ------------------------
            // SIDEBAR + CONTENT
            // ------------------------
            SizedBox(
              height: screenHeight - headerHeight - footerHeight,
              child: Row(
                children: [
                  // ------------------------
                  // SIDEBAR
                  // ------------------------
                  SizedBox(
                    width: 200,
                    child: Container(
                      height: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(
                        'Sidebar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  // ------------------------
                  // CONTENT
                  // ------------------------
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        spacing: 20,
                        children: [
                          ...List.generate(
                            30,
                            (i) => Container(
                              height: 60,
                              color: Colors.blue.shade100,
                              alignment: Alignment.center,
                              child: Text('Block ${i + 1}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: footerHeight,
              alignment: Alignment.center,
              color: Colors.deepOrangeAccent,
              child: Text('Footer'),
            ),
          ],
        ),
      ),
    );
  }
}
