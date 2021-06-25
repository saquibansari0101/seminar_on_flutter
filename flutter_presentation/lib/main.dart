import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

const Color primaryCol = Color(0xFF42a5f5);
const Color secondaryCol = Color(0xff0d47a1);


/// This is main function of program and execution starts here
void main() {
  runApp(MyApp());
  if (Platform.isWindows) {   // if platform is windows than initialization for windows
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([  // if platform is android set orientation to landscape
      DeviceOrientation.landscapeLeft,
    ]);
    return HomeWindow();
  }
}

class HomeWindow extends StatefulWidget {
  @override
  _HomeWindowState createState() => _HomeWindowState();
}

class _HomeWindowState extends State<HomeWindow> {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
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
                    SvgPicture.asset('assets/images/flutter_logo.svg'),
                    Text(
                      'Cross-Platform Development With Flutter',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Roboto_Regular',
                          fontWeight: FontWeight.bold),
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
                      'Hurrah! Its this easy to make cross-platform application with Flutter!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Roboto_Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                    Divider(),
                    Text(
                      'Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
                      style: TextStyle(fontFamily: 'Roboto_Thin', fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DataTable(
                        columns:  [
                          DataColumn(label: Text(
                              'Developers',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Roboto_Regular')
                          )),
                          DataColumn(label: Text(
                              'Google and Community',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Roboto_Regular')
                          )),
                        ], rows: [
                      DataRow(cells: [
                        DataCell(Text('Initial release',style: TextStyle(fontSize: 20,fontFamily: 'Roboto_Regular')),),
                        DataCell(Text('May 2017',style: TextStyle(fontSize: 20,fontFamily: 'Roboto_Regular'))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Written in',style: TextStyle(fontSize: 20,fontFamily: 'Roboto_Regular'))),
                        DataCell(Text('C,C++,Dart',style: TextStyle(fontSize: 20,fontFamily: 'Roboto_Regular'))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Platform',style: TextStyle(fontSize: 20,fontFamily: 'Roboto_Regular'))),
                        DataCell(Text('Android, iOS, Google Fuchsia, Web platform, Linux, macOS and Windows',style: TextStyle(fontSize: 20,fontFamily: 'Roboto_Regular'))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Website',style: TextStyle(fontSize: 20,fontFamily: 'Roboto_Regular'))),
                        DataCell(Text('flutter.dev',style: TextStyle(fontSize: 20,fontFamily: 'Roboto_Regular'))),
                      ]),
                    ])
                  ],
                ),
              )),
            )
          ]),
    );
  }
}
