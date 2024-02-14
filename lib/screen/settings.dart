import 'package:flutter/material.dart';

List<String> settings = ['설정1', '설정2', '설정3', '설정4'];

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: ListView.builder(
            itemCount: settings.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                height: 100,
                child: Text(settings[index]),
              );
            }));
  }
}
