import 'package:flutter/material.dart';

class FloatingCard extends StatelessWidget {
  final Function onVerticalDrag;
  final Function onVerticalDragEnd;

  const FloatingCard({Key key, this.onVerticalDrag, this.onVerticalDragEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onVerticalDragUpdate: (details) => onVerticalDrag(details.delta.dy),
      onVerticalDragEnd: (details) => onVerticalDragEnd(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: size.width,
          color: Colors.white,
        ),
      ),
    );
  }
}
