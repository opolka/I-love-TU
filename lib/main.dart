import 'package:i_love_tu/login_page.dart';
// import 'package:i_love_tu/booking_page.dart';
import 'package:flutter/material.dart';
import 'package:i_love_tu/services/Database_Api/database_helper.dart';
// import 'package:i_love_tu/online_request_page.dart';
import 'dart:developer';
import 'global.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

/*
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserAPI.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getApplicationDirectoryPath();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    log("data:$screenWidth/$screenHeight");

    return const MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }

  Future<void> getApplicationDirectoryPath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    log("data:$appDocPath");
    print('Application documents directory path: $appDocPath');
  }
}
