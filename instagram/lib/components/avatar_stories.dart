import 'package:flutter/material.dart';

class AvatarStories extends StatelessWidget {
  final bool active;

  const AvatarStories({Key key, this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Column(
        children: <Widget>[
          CustomPaint(
            painter: _GradientPainter(
              strokeWidth: 2,
              radius: 55,
              gradient: LinearGradient(
                colors: active
                    ? [Colors.black, Colors.redAccent]
                    : [Colors.grey, Colors.grey],
              ),
            ),
            child: InkWell(
              onTap: () => {},
              borderRadius: BorderRadius.circular(55),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                ),
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(),
              ),
            ),
          ),
          Text(
            'louiskevin',
            style: TextStyle(
                fontSize: 10, color: active ? Colors.black : Colors.grey),
          )
        ],
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {@required double strokeWidth,
      @required double radius,
      @required Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
