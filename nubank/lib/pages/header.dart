import 'package:flutter/material.dart';
import 'package:nubank/account_visibility_state.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 45,
                width: 45,
                child: Image.asset('assets/imgs/nubank-logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Kevin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () => toggleAccountVisibility(context),
            child: Icon(
              buildIconData(context),
              color: Colors.white.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }

  buildIconData(context) {
    bool completed = Provider.of<AccountVisibilityState>(context).completed;

    if (completed) return Icons.keyboard_arrow_up;

    return Icons.keyboard_arrow_down;
  }

  toggleAccountVisibility(context) {
    var provider = Provider.of<AccountVisibilityState>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    provider.tween.end = MediaQuery.of(context).size.height;
    provider.tween.begin = 0;
    if (provider.completed) {
      provider.tween.begin = height;
      provider.tween.end = 0;
    } else {
      provider.tween.end = height;
      provider.tween.begin = 0;
    }
    provider.animation.reset();
    provider.animation.forward();
  }
}
