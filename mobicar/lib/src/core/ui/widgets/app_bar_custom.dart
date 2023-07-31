import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarComponent {
  static AppBar buildAppBar(BuildContext context, int initialValue) {
    return AppBar(
      title: Text(
        'MOBCAR',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [
        PopupMenuButton(
          initialValue: initialValue,
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              value: 1,
              child: const Text('Cars Page'),
              onTap: () => Modular.to.navigate('/'),
            ),
            PopupMenuItem(
              value: 2,
              child: const Text('Menu 2'),
              onTap: () => Modular.to.navigate('/cars'),
            ),
            const PopupMenuItem(
              value: 3,
              child: Text('Menu 3'),
            ),
          ],
          icon: Icon(
            Icons.menu_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
      elevation: 0,
      backgroundColor: Colors.black,
    );
  }
}
