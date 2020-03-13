import 'dart:async';

import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> with TickerProviderStateMixin {
  Animation<double> scaleAnimation;
  AnimationController _scaleController;

  Animation<double> fadeAnimation;
  AnimationController _fadeController;

  Timer _debounce;

  @override
  void initState() {
    super.initState();

    _scaleController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeIn,
    );

    _fadeController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.linear,
    );
  }

  void showHeart() {
    _fadeController.forward();
    _scaleController.reset();
    _scaleController.forward();
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(Duration(seconds: 1), () => _fadeController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildHeader(),
          ),
          buildImage(),
          buildActions(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4),
            child: buildLikes(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: buildComments(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: buildDateTime(),
          )
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'louiskevin',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Curitiba, Brasil',
              )
            ],
          ),
        ),
        Expanded(
          child: Container(),
        ),
        IconButton(
          icon: Icon(Icons.linear_scale),
          color: Colors.black,
          onPressed: () => {},
        )
      ],
    );
  }

  Widget buildImage() {
    return InkWell(
      onDoubleTap: showHeart,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 350,
          ),
          Center(
            child: FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.near_me),
              onPressed: () => {},
              color: Colors.black,
            )
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () => {},
        ),
      ],
    );
  }

  Widget buildLikes() {
    return Row(
      children: <Widget>[
        Text(
          '130 Likes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildComments() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Text(
            'lokolouis',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Text(
            'Muito top!!',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Text(
            '#copy',
            style: TextStyle(color: Color(0xFF2C446E)),
          ),
        ),
      ],
    );
  }

  Widget buildDateTime() {
    return Row(
      children: <Widget>[
        Text(
          '10 MINUTES AGO',
          style: TextStyle(fontSize: 9),
        ),
      ],
    );
  }
}
