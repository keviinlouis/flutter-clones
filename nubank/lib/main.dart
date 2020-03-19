import 'package:flutter/material.dart';
import 'package:nubank/account_visibility_state.dart';
import 'package:nubank/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nubank Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AccountVisibilityState(),
          )
        ],
        child: HomePage(),
      ),
    );
  }
}
