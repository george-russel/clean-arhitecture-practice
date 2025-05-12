import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/utils/assets.dart';

class ScaffoldWrapper extends StatelessWidget {
  final Scaffold child;

  const ScaffoldWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetConstants.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: child,
        ),
      ),
    );
  }
}
