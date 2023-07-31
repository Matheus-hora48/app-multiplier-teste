import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar/src/modules/cars/cars_controller.dart';

import '../../core/ui/widgets/footer.dart';
import 'widget/car_list.dart';
import 'widget/dialog_add_car.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  final controller = Modular.get<CarsController>();

  @override
  void initState() {
    controller.showBrand();
    controller.selectCars();
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MOBCAR',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          PopupMenuButton(
            initialValue: 2,
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 1,
                child: Text('Cars Page'),
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
      ),
      body: Observer(
        builder: (_) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Olá, cliente',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Veículos cadastrados',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 45,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                        (states) => Colors.black,
                                      ),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DialogAddCar(
                                            controller: controller,
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Adicionar'),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.black,
                              height: 25,
                            ),
                            Observer(
                              builder: (_) {
                                return Expanded(
                                  child: ListView.separated(
                                    itemCount: controller.cars.length,
                                    itemBuilder: (context, index) {
                                      return CarList(
                                        car: controller.cars[index],
                                        controller: controller,
                                      );
                                    },
                                    separatorBuilder: (_, __) {
                                      return const Divider(
                                        color: Colors.black,
                                        height: 25,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Footer()
                  ],
                );
        },
      ),
    );
  }
}
