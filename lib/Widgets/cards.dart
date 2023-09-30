import 'package:flutter/material.dart';

class FlutterCards extends StatelessWidget {
  const FlutterCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            "assets/schl_img.jpg",
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                          Container(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(height: 5),
                                // Add a title widget
                                const Text(
                                  "Cards Title 1",
                                ),
                                // Add some spacing between the title and the subtitle
                                Container(height: 5),
                                // Add a subtitle widget
                                const Text(
                                  "Sub title",
                                ),
                                // Add some spacing between the subtitle and the text
                                Container(height: 10),
                                // Add a text widget to display some text
                                const Text(
                                  ' MyStringsSample.card_text',
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
