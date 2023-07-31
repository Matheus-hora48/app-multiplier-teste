import 'package:flutter/material.dart';
import 'package:mobicar/src/modules/cars/widget/dropdown_list.dart';

import '../../../dto/carro.dart';
import '../cars_controller.dart';

class DialogAddCar extends StatelessWidget {
  final CarsController controller;
  final Carro? car;
  const DialogAddCar({super.key, required this.controller, this.car});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.car_repair),
          Text(car != null ? car!.modelo.nome : 'Cadastro de veículo'),
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
          DropdownList(
            car: car,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
