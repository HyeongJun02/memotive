import 'package:flutter/material.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite Page'),
      ),
      body: Center(
        child: Text('This is My Favorite Page'),
      ),
    );
  }
}
