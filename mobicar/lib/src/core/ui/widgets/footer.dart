import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      color: Colors.black,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          '2020. all rights reserved to Mobcar.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
