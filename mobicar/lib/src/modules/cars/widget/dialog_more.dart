import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../dto/carro.dart';

class DialogMore extends StatelessWidget {
  final Carro car;
  const DialogMore({super.key, required this.car});

  String formatMoney(num value) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.car_repair),
          Text(car.modelo.nome),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/carro.jpeg'),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text(
                      'Marca',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(car.marca.nome),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text(
                      'Ano',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(car.ano.nome),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text(
                      'Modelo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(car.modelo.nome),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text(
                      'Valor',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(formatMoney(double.parse(car.valor))),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Colors.black,
                ),
              ),
              child: const Text('Reservar'),
            ),
          )
        ],
      ),
    );
  }
}
