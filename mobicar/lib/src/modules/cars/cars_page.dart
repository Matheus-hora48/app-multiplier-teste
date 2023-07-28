import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  int brandId = 1;
  int modelId = 1;
  int yearId = 1;
  String value = '';

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
                                const Icon(Icons.car_repair),
                                const Text('Cadastro de Veículo'),
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
                                Observer(
                                  builder: (_) {
                                    return Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: DropdownButton(
                                            value: brandId,
                                            items:
                                                controller.brand.map((marca) {
                                              return DropdownMenuItem<int>(
                                                value: int.parse(marca.codigo),
                                                child: Text(marca.nome),
                                              );
                                            }).toList(),
                                            onChanged: (int? newValue) async {
                                              setState(() {
                                                brandId = newValue!;
                                              });
                                              await controller.showModel(
                                                brandId: brandId.toString(),
                                              );
                                              modelId = int.parse(
                                                controller.model.first.codigo,
                                              );
                                            },
                                            hint: const Text('Marca'),
                                            underline: const SizedBox(),
                                            isExpanded: true,
                                            padding: const EdgeInsets.all(12),
                                            isDense: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: DropdownButton(
                                            value: modelId,
                                            items:
                                                controller.model.map((marca) {
                                              return DropdownMenuItem<int>(
                                                value: int.parse(marca.codigo),
                                                child: Text(marca.nome),
                                              );
                                            }).toList(),
                                            onChanged: (int? newValue) async {
                                              setState(() {
                                                modelId = newValue!;
                                              });
                                              await controller.showYear(
                                                brandId: brandId.toString(),
                                                modelId: modelId.toString(),
                                              );
                                              yearId = int.parse(
                                                controller
                                                    .year.first.anoSemHifen,
                                              );
                                              print(yearId);
                                            },
                                            hint: const Text('Modelos'),
                                            underline: const SizedBox(),
                                            isExpanded: true,
                                            padding: const EdgeInsets.all(12),
                                            isDense: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: DropdownButton(
                                            value: yearId,
                                            items: controller.year.map((marca) {
                                              return DropdownMenuItem<int>(
                                                value: int.parse(
                                                  marca.anoSemHifen,
                                                ),
                                                child: Text(marca.nome),
                                              );
                                            }).toList(),
                                            onChanged: (int? newValue) {
                                              setState(() {
                                                yearId = newValue!;
                                              });
                                              controller.showValue(
                                                brandId: brandId.toString(),
                                                modelId: modelId.toString(),
                                                yearId: yearId.toString(),
                                              );
                                            },
                                            hint: const Text('Valor'),
                                            underline: const SizedBox(),
                                            isExpanded: true,
                                            padding: const EdgeInsets.all(12),
                                            isDense: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(value.isEmpty
                                              ? 'Valor (R\$)'
                                              : value),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              style: ButtonStyle(
                                                  side: MaterialStateBorderSide
                                                      .resolveWith((states) =>
                                                          BorderSide(
                                                            color: Colors.black,
                                                          ))),
                                              child: Text(
                                                'Cancelar',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                elevation:
                                                    MaterialStateProperty.all(
                                                        0),
                                                backgroundColor:
                                                    MaterialStateColor
                                                        .resolveWith(
                                                  (states) => Colors.black,
                                                ),
                                              ),
                                              child: Text('Salvar'),
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                )
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
