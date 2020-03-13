import 'package:flutter/material.dart';
import 'package:instagramcopy/components/avatar_stories.dart';
import 'package:instagramcopy/components/post.dart';

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        titleSpacing: 0,
        title: HeaderTimeLine(),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: buildPosts(),
      ),
    );
  }

  List<Widget> buildPosts() {
    return [
      Container(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: buildStories(),
        ),
      ),
      buildPost(),
      buildPost(),
      buildPost(),
      buildPost(),
      buildPost(),
      buildPost(),
      buildPost(),
      buildPost(),
      buildPost(),
      buildPost(),
    ];
  }

  Widget buildPost() {
    return Post();
  }

  List<Widget> buildStories() {
    return [
      buildStory(false),
      buildStory(true),
      buildStory(true),
      buildStory(true),
      buildStory(true),
      buildStory(true),
      buildStory(true),
      buildStory(true),
      buildStory(true),
    ];
  }

  Widget buildStory(active) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AvatarStories(
        active: active,
      ),
    );
  }
}

class HeaderTimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(color: Colors.grey, width: 0.8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () => {},
            color: Colors.black,
          ),
          Text(
            'Instagram',
            style: TextStyle(color: Colors.black),
          ),
          IconButton(
            icon: Icon(Icons.near_me),
            onPressed: () => {},
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
