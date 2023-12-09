import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter user'),
        actions: const <Widget>[],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int i) {
          return const Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('First User iba asdas dsa das dasd as'),
              subtitle: Text('Second user'),
            ),
          );
        },
      ),
    );
  }
}
