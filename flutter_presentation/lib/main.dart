import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color primaryCol = Color(0xFF42a5f5);
const Color secondaryCol = Color(0xff0d47a1);

/// This is main function of program and execution starts here
void main() {
  runApp(MyApp());
  if (Platform.isWindows) {
    // if platform is windows than initialization for windows
    doWhenWindowReady(() {
      final win = appWindow;
      final initialSize = Size(1920, 1080);
      win.minSize = initialSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.title = "Cross-Platform Development With Flutter";
      win.show();
    });
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Presentation',
      home: HomeWindow(),
    );
  }
}

class HomeWindow extends StatefulWidget {
  @override
  _HomeWindowState createState() => _HomeWindowState();
}

class _HomeWindowState extends State<HomeWindow> {
  final PageController controller = PageController(initialPage: 0);

  String bullet = "\u2022 ";

  @override
  Widget build(BuildContext context) {
    double size = 400;
    return Scaffold(
      body: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: [
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: size,
                      style: FlutterLogoStyle.stacked,
                      curve: Curves.bounceInOut,
                      duration: Duration(seconds: 5),
                    ),
                    Text(
                      'Hurrah! Its this easy to make cross-platform application with Flutter!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Roboto_Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conclusion',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Roboto_Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 60),
                    ),
                    Divider(),
                    Text(
                      'With Flutter, the possibilities are practically endless, so even super extensive apps can be created with ease. If you develop mobile apps and have yet to give Flutter a try, I highly recommend you do. After using Flutter since it’s inception, We think its safe to say that it’s the best mobile app development technology and is the future of mobile development. If not, it’s definitely a step in the right direction.',
                      style: TextStyle(fontFamily: 'Roboto_Thin', fontSize: 40,fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Future scope',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Roboto_Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 60),
                    ),
                    Divider(),
                    Text(
                      '''We continue to see fast growth in Flutter usage, with over two million developers having used Flutter in the last 3 years since its release. Despite these unprecedented circumstances, in March there was 10% month-over-month growth, with nearly half a million developers now using Flutter each month.''' +
                          '\nSome other interesting statistics:\n' +
                          bullet +
                          ' 60% of users are developing with Windows, 27% are using macOS, and 13% are using Linux.\n' +
                          bullet +
                          ' 35% work for a startup, 26% are enterprise developers, 19% are self-employed, and 7% work for design agencies.\n' +
                          bullet +
                          ' The top five territories for Flutter are India, China, the United States, the EU, and Brazil.\n' +
                          bullet +
                          ' There are approximately 90,000 Flutter apps published in the Play Store, with nearly 10,000 uploaded in the last month alone.\n',
                      style: TextStyle(fontFamily: 'Roboto_Thin', fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                'THANK YOU',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Roboto_Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 100),
              ),
            ))
          ]),
    );
  }
}
