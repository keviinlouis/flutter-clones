import 'package:flutter/material.dart';

class AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset('assets/imgs/qrcode.png'),
            ),
          ),
          buildTextLightAndBold('Banco', '260 - Nu Pagamentos S.A.'),
          buildTextLightAndBold('Agência', '0001'),
          buildTextLightAndBold('Conta', '6001888-3'),
          buildDivider(),
          buildMenuItem(Icons.query_builder, 'Me Ajuda'),
          buildDivider(),
          buildMenuItem(
            Icons.query_builder,
            'Perfil',
            subtitle: 'Nome de preferência, telefone, e-mail',
          ),
          buildDivider(),
          buildMenuItem(Icons.query_builder, 'Configurar conta'),
          buildDivider(),
          buildMenuItem(Icons.query_builder, 'Pedir conta PJ'),
          buildDivider(),
          buildMenuItem(Icons.query_builder, 'Configurações do app'),
          buildDivider(),
          buildLogoutButton()
        ],
      ),
    );
  }

  buildTextLightAndBold(String lightText, String boldText) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            lightText,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            boldText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  buildDivider() {
    return Divider(
      color: Colors.white.withOpacity(0.5),
    );
  }

  buildMenuItem(IconData icon, String title, {String subtitle}) {
    Widget subtitleWidget = subtitle == null
        ? Container()
        : Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
          );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitleWidget
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlineButton(
          onPressed: () => {},
          textColor: Colors.white,
          color: Colors.white,
          borderSide: BorderSide(color: Colors.white.withOpacity(0.4)),
          child: Text(
            'SAIR DA CONTA',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
