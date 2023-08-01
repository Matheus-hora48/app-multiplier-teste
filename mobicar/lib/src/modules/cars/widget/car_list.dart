import 'package:flutter/material.dart';
import 'package:mobicar/src/modules/cars/cars_controller.dart';
import '../../../dto/carro.dart';
import 'dialog_add_car.dart';
import 'dialog_more.dart';

class CarList extends StatelessWidget {
  final CarsController controller;
  final Carro car;

  const CarList({
    Key? key,
    required this.controller,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${car.marca.nome} ${car.modelo.nome}',
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    car.ano.nome,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogMore(
                            car: car,
                          );
                        },
                      );
                    },
                    child: Text(
                      'Ver Mais',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  value: 1,
                  child: const Text('Apagar'),
                  onTap: () {
                    controller.deleteCars(car.id.toString());
                    controller.selectCars();
                  },
                ),
                PopupMenuItem(
                  value: 2,
                  child: const Text('Editar'),
                  onTap: () {
                    Future.delayed(Duration.zero, () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogAddCar(
                            car: car,
                            controller: controller,
                          );
                        },
                      );
                    });
                  },
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
      },
    );
  }
}
