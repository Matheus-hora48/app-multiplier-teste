import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobicar/src/dto/carro.dart';
import 'package:mobicar/src/modules/cars/widget/custom_dropdown.dart';

import '../../../models/marcas.dart';
import '../cars_controller.dart';

class DropdownList extends StatefulWidget {
  final CarsController controller;
  final Carro? car;
  const DropdownList({
    Key? key,
    required this.controller,
    this.car,
  }) : super(key: key);

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  int brandId = 1;
  int modelId = 0;
  int yearId = 0;
  String value = '';
  String id = '';

  @override
  void initState() {
    widget.controller.cleanDropdown();
    if (widget.car != null) {
      brandId = int.parse(widget.car!.marca.codigo);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomDropdown(
              hintText: 'Marca',
              value: brandId,
              items: widget.controller.brand.map((marca) {
                return DropdownMenuItem<int>(
                  value: int.parse(marca.codigo),
                  child: Text(marca.nome),
                );
              }).toList(),
              onChanged: (int? newValue) async {
                setState(() {
                  brandId = newValue!;
                });
                await widget.controller.showModel(brandId: brandId.toString());
                setState(() {
                  modelId = int.parse(widget.controller.model.first.codigo);
                });
              },
            ),
            const SizedBox(height: 8),
            CustomDropdown(
              hintText: 'Modelos',
              value: modelId,
              items: widget.controller.model.map((marca) {
                print(marca.codigo);
                return DropdownMenuItem<int>(
                  value: int.parse(marca.codigo),
                  child: Text(marca.nome),
                );
              }).toList(),
              onChanged: (int? newValue) async {
                setState(() {
                  modelId = newValue!;
                });
                await widget.controller.showYear(
                  brandId: brandId.toString(),
                  modelId: modelId.toString(),
                );
                setState(() {
                  yearId = int.parse(widget.controller.year.first.anoSemHifen);
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomDropdown(
              hintText: 'Valor',
              value: yearId,
              items: widget.controller.year.map((marca) {
                id = marca.codigo;
                return DropdownMenuItem<int>(
                  value: int.parse(marca.anoSemHifen),
                  child: Text(marca.nome),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  yearId = newValue!;
                });
                widget.controller.showValue(
                  brandId: brandId.toString(),
                  modelId: modelId.toString(),
                  yearId: id,
                );
              },
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Observer(
                builder: (_) {
                  return Text(widget.controller.value != null
                      ? 'Valor (R\$) ${widget.controller.value!.valor}'
                      : 'Valor (R\$)');
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(color: Colors.black),
                    ),
                  ),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 4),
                ElevatedButton(
                  onPressed: () {
                    if (widget.car != null) {
                      widget.controller
                          .editCars(
                            Carro(
                              marca: widget.controller.brand.first,
                              modelo: widget.controller.model.first,
                              ano: widget.controller.year.first,
                              valor: widget.controller.value!.valor,
                              combustivel: widget.controller.value!.combustivel,
                            ),
                          )
                          .then((_) async => {
                                widget.controller.cleanDropdown(),
                                widget.controller.selectCars(),
                                Navigator.of(context).pop(),
                              });
                    } else {
                      Marcas marca = widget.controller.brand
                          .firstWhere((m) => m.codigo == brandId);
                      widget.controller
                          .insertCars(
                            Carro(
                              marca: marca,
                              modelo: widget.controller.model.first,
                              ano: widget.controller.year.first,
                              valor: widget.controller.value!.valor,
                              combustivel: widget.controller.value!.combustivel,
                            ),
                          )
                          .then((_) async => {
                                await widget.controller.selectCars(),
                                Navigator.of(context).pop(),
                              });
                    }
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black,
                    ),
                  ),
                  child: Text(widget.car != null ? 'Editar' : 'Salvar'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
