import 'package:flutter/material.dart';
import 'package:instagramcopy/pages/time_line.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: BorderDirectional(
                top: BorderSide(color: Colors.grey, width: 0.8),
              ),
            ),
            child: TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.search),
                ),
                Tab(
                  icon: Icon(Icons.add_circle_outline),
                ),
                Tab(
                  icon: Icon(Icons.favorite_border),
                ),
                Tab(
                  icon: Icon(Icons.person_outline),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TimeLine(),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.lightGreen,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
