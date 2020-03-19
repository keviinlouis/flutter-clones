import 'package:flutter/material.dart';
import 'package:nubank/account_visibility_state.dart';
import 'package:provider/provider.dart';

import 'floating_card.dart';

class FloatingCards extends StatefulWidget {
  @override
  _FloatingCardsState createState() => _FloatingCardsState();
}

class _FloatingCardsState extends State<FloatingCards>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Tween<double> _tween;
  Animation<double> _animation;

  int currentPage = 0;
  List cards = [1, 2, 3];
  double top = 0;
  double height = 0;

  double accountVisibility = 0;

  @override
  void initState() {
    currentPage = cards.first;
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _tween = Tween(begin: 0.0, end: 0);

    _animation = _tween.animate(_animationController)
      ..addListener(() {
        if (!_animationController.isAnimating) return;

        setState(() {
          top = _animation.value;
          updateAccountVisibility();
        });
      });

    Provider.of<AccountVisibilityState>(context, listen: false).animation =
        _animationController;

    Provider.of<AccountVisibilityState>(context, listen: false).tween = _tween;
  }

  void changePage(int value) {
    currentPage = cards[value];
    setState(() => {});
  }

  onVerticalDrag(distance) {
    if (_animationController.isAnimating) return;
    top = top + distance;

    if (top < 0) {
      return top = 0;
    }
    setState(() {});
    updateAccountVisibility();
  }

  onVerticalDragEnd() {
    double percent = (top * 100) / height;
    _animationController.reset();
    _tween.begin = top;

    if (percent > 40) {
      _tween.end = height;
    } else {
      _tween.end = 0;
    }

    _animationController.forward();
  }

  updateAccountVisibility() {
    Provider.of<AccountVisibilityState>(context, listen: false)
        .accountVisibility = (top * 100) / height;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Transform.translate(
              offset: Offset(0, top),
              child: PageView(
                onPageChanged: changePage,
                scrollDirection: Axis.horizontal,
                children: buildCards(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildIndicators(),
            ),
          ),
        ],
      ),
    );
  }

  buildCards() {
    return cards
        .map(
          (item) => FloatingCard(
            onVerticalDrag: onVerticalDrag,
            onVerticalDragEnd: onVerticalDragEnd,
          ),
        )
        .toList();
  }

  buildIndicators() {
    return cards.map((item) => buildIndicator(item)).toList();
  }

  Widget buildIndicator(item) {
    bool isActive = item == currentPage;

    return Opacity(
      opacity: Provider.of<AccountVisibilityState>(context).opacityInverse,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
