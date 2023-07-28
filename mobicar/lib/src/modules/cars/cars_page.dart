import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar/src/modules/cars/cars_controller.dart';

import 'widget/car_list.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  final controller = Modular.get<CarsController>();
  int brandId = 0;
  int modelId = 0;
  int yearId = 0;

  @override
  void initState() {
    controller.showBrand();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
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
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Row(
                              children: [
                                Icon(Icons.car_repair),
                                Text('Cadastro de Veículo'),
                                Spacer(),
                                Icon(Icons.close)
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/carro.jpeg'),
                                DropdownButton(
                                  hint: const Text('Marcas'),
                                  value: brandId,
                                  items: controller.brand.map((marca) {
                                    return DropdownMenuItem<int>(
                                      value: int.parse(marca.codigo),
                                      child: Text(marca.nome),
                                    );
                                  }).toList(),
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      brandId = newValue!;
                                    });
                                    controller.showModel(
                                      brandId: brandId.toString(),
                                    );
                                  },
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text('Adicionar'),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            height: 25,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const CarList(
                  name: 'aaa',
                  year: 'bbb',
                  fuel: 'ccc',
                );
              },
              separatorBuilder: (_, __) {
                return const Divider(
                  color: Colors.black,
                  height: 25,
                );
              },
            ),
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}
