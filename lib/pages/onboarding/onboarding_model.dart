import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/pages/home_page.dart';

class onboardingModel extends StatefulWidget {
  const onboardingModel({super.key});

  @override
  State<onboardingModel> createState() => _onboardingModelState();
}

class _onboardingModelState extends State<onboardingModel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@override
Widget build(BuildContext context) {
  return Container(
      width: 368,
      height: 542,
      child: Stack(children: <Widget>[
        Positioned(
            top: 140,
            left: 90,
            child: Container(
                width: 188,
                height: 272,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/onboarding.png'),
                      fit: BoxFit.fitWidth),
                ))),
        Positioned(
            top: 0,
            left: 105,
            child: Text(
              'INVO',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(212, 213, 244, 1),
                  fontFamily: 'Jua',
                  fontSize: 70,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
        Positioned(
            top: 479,
            left: 0,
            child: Text(
              'Invoice Generator',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(212, 213, 244, 1),
                  fontFamily: 'Noto Music',
                  fontSize: 25,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1.48),
            )),
      ]));
}
