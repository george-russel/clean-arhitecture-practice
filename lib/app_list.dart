import 'package:clean_architecture_practice/core/utils/assets.dart';
import 'package:flutter/material.dart';

class AppList extends StatelessWidget {
  const AppList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetConstants.backgroundImage))),
      ),
    );
  }
}
