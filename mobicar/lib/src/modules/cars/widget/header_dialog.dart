import 'package:flutter/material.dart';

class HeaderDialog extends StatelessWidget {
  final String title;

  const HeaderDialog({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.car_repair),
        Text(title),
        const Spacer(),
      ],
    );
  }
}
