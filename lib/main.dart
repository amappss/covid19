import 'dart:ui';

import 'package:covid19_informer/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/CircleDot.dart';
import 'widgets/CustomCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> countries = ['United State', 'France', 'Italy', 'Germany'];
  String dropValue = 'United State';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              height: 350,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                    ),
                  ),
                  Positioned(
                      top: 40,
                      left: 10,
                      child: SvgPicture.asset('assets/icons/Drcorona.svg')),
                  Positioned(
                    top: 50,
                    left: 150,
                    child: Text(
                      'All you need to do\nis to stay at home.',
                      style: kHeadingTextStyle.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/virus.png')),
                  gradient: LinearGradient(
                      colors: [kGradientLight, kGradientDark],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: kBorderLightColor, width: 1.0)),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                      underline: SizedBox(),
                      value: dropValue,
                      onChanged: (value) {
                        setState(() {
                          dropValue = value!;
                        });
                      },
                      items: countries
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )))
                          .toList()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: 'Case Update\n', style: kTitleTextstyle),
                      TextSpan(
                          text: 'Newest update March 28',
                          style: TextStyle(
                              color: kTextLightColor,
                              fontWeight: FontWeight.w600))
                    ])),
                    Spacer(),
                    Text('See Details', style: kDetailsTextStyle)
                  ],
                ),
                SizedBox(height: 20),
                CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleDot(
                          color: kInfectedColor,
                          number: 1046,
                          title: 'Infected',
                        ),
                        CircleDot(
                          color: kDeathColor,
                          number: 87,
                          title: 'Deaths',
                        ),
                        CircleDot(
                          color: kRecovercolor,
                          number: 46,
                          title: 'Recovered',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Spread of Virus',
                      style: kTitleTextstyle,
                    ),
                    Spacer(),
                    Text(
                      'See Details',
                      style: kDetailsTextStyle,
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: CustomCard(
                child: Image.asset('assets/images/map.png'),
              ),
            ),
          ),
          SizedBox(height: 25)
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
