import 'package:flutter/material.dart';

class CarList extends StatelessWidget {
  final String name;
  final String year;
  final String fuel;

  const CarList({
    super.key,
    required this.name,
    required this.year,
    required this.fuel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Image.asset(
            'assets/images/carro.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '$year $fuel',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Ver Mais',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        PopupMenuButton(
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            const PopupMenuItem(
              value: 1,
              child: Text('Apagar'),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text('Editar'),
            ),
          ],
          icon: Icon(
            Icons.adaptive.more,
            color: Colors.grey,
          ),
          iconSize: 28,
        ),
      ],
    );
  }
}
