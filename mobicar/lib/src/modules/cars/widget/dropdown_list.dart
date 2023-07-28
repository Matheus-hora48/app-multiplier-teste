import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobicar/src/modules/cars/widget/custom_dropdown.dart';

import '../cars_controller.dart';

class DropdownList extends StatefulWidget {
  final CarsController controller;
  const DropdownList({super.key, required this.controller});

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  int brandId = 1;

  int modelId = 0;

  int yearId = 0;

  String value = '';

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Expanded(
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
                  await widget.controller
                      .showModel(brandId: brandId.toString());
                  modelId = int.parse(widget.controller.model.first.codigo);
                },
              ),
              const SizedBox(height: 8),
              CustomDropdown(
                hintText: 'Modelos',
                value: modelId,
                items: widget.controller.model.map((marca) {
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
                  yearId = int.parse(widget.controller.year.first.anoSemHifen);
                },
              ),
              CustomDropdown(
                hintText: 'Valor',
                value: yearId,
                items: widget.controller.year.map((marca) {
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
                    yearId: yearId.toString(),
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
                child: Text(value.isEmpty ? 'Valor (R\$)' : value),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
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
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black,
                      ),
                    ),
                    child: const Text('Salvar'),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
