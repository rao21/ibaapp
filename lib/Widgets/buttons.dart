import 'package:flutter/material.dart';

class FlutterButtons extends StatelessWidget {
  const FlutterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   width: MediaQuery.sizeOf(context).width,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         print('ElevatedButton tapped');
              //       },
              //       //style: _buttonStyle(context),
              //       child: const Text('Elevated')),
              // ),
              // SizedBox(
              //   width: MediaQuery.sizeOf(context).width,
              //   child: FilledButton(
              //     onPressed: () {
              //       print('FilledButton presses');
              //     },
              //     style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              //     child: const Text('Filled'),
              //   ),
              // ),

              // SizedBox(
              //   width: MediaQuery.sizeOf(context).width,
              //   child: FilledButton.tonal(
              //       onPressed: () {}, child: const Text('Filled Tonal')),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    child: FilledButton.tonal(
                        onPressed: () {}, child: const Text('Filled Tonal')),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    child: FilledButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.person_2),
                      label: Text('Filled Icon'),
                    ),
                  ),
                ],
              ),
              // OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              Text('asda'),
              TextButton(onPressed: () {}, child: const Text('Text')),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
      elevation: MaterialStateProperty.all(8),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      shadowColor:
          MaterialStateProperty.all(Theme.of(context).colorScheme.onSurface),
    );
  }
}
