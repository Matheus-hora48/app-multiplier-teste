import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar/src/modules/cars/cars_controller.dart';
import 'package:mobicar/src/modules/cars/widget/dropdown_list.dart';
import 'package:mobicar/src/modules/cars/widget/header_dialog.dart';

import '../../core/ui/widgets/footer.dart';
import 'widget/car_list.dart';

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
                              const HeaderDialog(
                                title: 'Cadastro de veículos',
                              ),
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
                                controller: controller,
                              ),
                            ],
                          ),
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
          const Footer()
        ],
      ),
    );
  }
}
