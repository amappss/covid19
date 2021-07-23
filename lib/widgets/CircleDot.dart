import 'package:flutter/material.dart';

import '../constant.dart';

class CircleDot extends StatelessWidget {
  final color;
  final number;
  final title;

  CircleDot(
      {@required this.color, @required this.number, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 25,
          height: 25,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: color.withOpacity(0.26), shape: BoxShape.circle),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2.0)),
          ),
        ),
        Text('$number',
            style: TextStyle(
              color: color,
              fontSize: 40,
            )),
        Text(
          title,
          style: kSubTextStyle,
        )
      ],
    );
  }
}
