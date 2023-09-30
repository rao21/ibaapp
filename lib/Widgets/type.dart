import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlutterButtons extends StatelessWidget {
  const FlutterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          children: [
            SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    print('ElevatedButton tapped');
                  },
                  child: const Text('ElevatedButton')),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FilledButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Filled'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
