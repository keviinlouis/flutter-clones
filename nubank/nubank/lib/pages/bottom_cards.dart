import 'package:flutter/material.dart';
import 'package:nubank/account_visibility_state.dart';
import 'package:provider/provider.dart';

import 'bottom_card.dart';

class BottomCards extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'icon': Icons.person_add, 'label': 'Indicar Amigos'},
    {'icon': Icons.gavel, 'label': 'Cobrar'},
    {'icon': Icons.file_upload, 'label': 'Depositar'},
    {'icon': Icons.file_download, 'label': 'Transferir'},
    {'icon': Icons.settings_ethernet, 'label': 'Ajustar limite'},
    {'icon': Icons.payment, 'label': 'Cartão virtual'},
    {'icon': Icons.sort, 'label': 'Organizar Atalhos'},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Opacity(
      opacity: Provider.of<AccountVisibilityState>(context).opacityInverse,
      child: Container(
        height: size.height * 0.18,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: buildCards(size.width),
        ),
      ),
    );
  }

  List<Widget> buildCards(double width) {
    return items
        .map(
          (item) => Container(
            width: width * 0.35,
            child: BottomCard(
              icon: item['icon'],
              label: item['label'],
            ),
          ),
        )
        .toList();
  }
}
