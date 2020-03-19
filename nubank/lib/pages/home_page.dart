import 'package:flutter/material.dart';
import 'package:nubank/account_visibility_state.dart';
import 'package:nubank/pages/bottom_cards.dart';
import 'package:nubank/pages/floating_cards.dart';
import 'package:provider/provider.dart';

import 'account_menu.dart';
import 'header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF80259c),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Header(),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                buildBackground(context),
                Column(
                  children: <Widget>[
                    Expanded(child: Container()),
                    BottomCards(),
                  ],
                ),
                FloatingCards(),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildBackground(context) {
    return Opacity(
      opacity: Provider.of<AccountVisibilityState>(context).opacity,
      child: AccountMenu(),
    );
  }
}
