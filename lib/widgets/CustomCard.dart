import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final child;

  CustomCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.16),
                offset: Offset(0, 5),
                blurRadius: 30)
          ]),
    );
  }
}
