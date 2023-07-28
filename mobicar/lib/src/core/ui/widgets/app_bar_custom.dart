import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarCustom extends StatelessWidget {

  const AppBarCustom({ super.key });

   @override
   Widget build(BuildContext context) {
       return AppBar(
        title: Text(
          'Mobcar',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          PopupMenuButton(
            initialValue: 1,
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 1,
                child: Text('Home Page'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Menu 2'),
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
        flexibleSpace: Image.asset(
          'assets/images/blackBackground.jpg',
          fit: BoxFit.cover,
        ),
      );
  }
}