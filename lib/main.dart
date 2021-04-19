import 'package:finance_flutter_app/api/api_contract.dart';
import 'package:finance_flutter_app/api/api_manager.dart';
import 'package:finance_flutter_app/db/tables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/splash/splash.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<ApiContract>(create: (_) {
        return ApiManager();
      }),
      Provider(create: (_) => AppDatabase(), dispose: (context, db) => db.close()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}