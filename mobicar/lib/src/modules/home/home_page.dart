import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../cars/cars_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        // flexibleSpace: Image.asset(
        //   'assets/images/blackBackground.jpg',
        //   fit: BoxFit.cover,
        // ),
      ),
      body: Image.asset(
        'assets/images/blackBackground.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
