import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/pages/home.dart';
import 'package:invoice_app/pages/home_page.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box('');
    return Scaffold(
        body: IntroductionScreen(
      globalBackgroundColor: const Color.fromRGBO(87, 70, 123, 1),
      pages: [
        PageViewModel(
          title: '',
          bodyWidget: Center(
            heightFactor: 1.3,
            child: Column(
              children: [
                const Text(
                  'INVO',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(212, 213, 244, 1),
                      fontFamily: 'Jua',
                      fontSize: 70,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Center(
                      child: Image(
                        image: AssetImage('assets/images/onboarding.png'),
                        height: 272,
                        width: 188,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Invoice Generator',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(212, 213, 244, 1),
                          fontFamily: 'Noto Music',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          height: 1.48),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          title: '',
          bodyWidget: Center(
            heightFactor: 28,
            child: Column(
              children: [
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Create Invoice on the go !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(212, 213, 244, 1),
                          fontFamily: 'Noto Music',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          height: 1.48),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          title: '',
          bodyWidget: Center(
            heightFactor: 14.5,
            child: Column(
              children: [
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'All Your Invoice History in One Place',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(212, 213, 244, 1),
                          fontFamily: 'Noto Music',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          height: 1.48),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      onDone: () {
        box.put('introduction', false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return home();
            },
          ),
        );
      },
      skip: const Icon(Icons.skip_next),
      next: const Icon(
        Icons.forward,
        color: Colors.transparent,
      ),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size.square(10.0),
        activeSize: Size(20.0, 10.0),
        activeColor: Colors.black,
        color: Colors.white,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: CircleBorder(),
      ),
    ));
  }
}
