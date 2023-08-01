import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobicar/src/dto/carro.dart';
import 'package:mobicar/src/modules/cars/widget/custom_dropdown.dart';

import '../../../models/marcas.dart';
import '../../../models/model_anos.dart';
import '../../../models/modelos.dart';
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
    super.initState();
    resetDropdownValues();
  }

  void resetDropdownValues() {
    brandId = 1;
    modelId = 0;
    yearId = 0;
    value = '';
    id = '';

    initialEdit();
  }

  Future<void> initialEdit() async {
    widget.controller.cleanDropdown();
    if (widget.car != null) {
      brandId = int.parse(widget.car!.marca.codigo);
      modelId = int.parse(widget.car!.modelo.codigo);
      yearId = int.parse(widget.car!.ano.anoSemHifen);
      id = widget.car!.ano.codigo;
      await widget.controller.showModel(brandId: brandId.toString());
      await widget.controller.showYear(
        brandId: brandId.toString(),
        modelId: modelId.toString(),
      );
      await widget.controller.showValue(
        brandId: brandId.toString(),
        modelId: modelId.toString(),
        yearId: id,
      );
      setState(() {});
    }
  }

  void _onBrandChanged(int? newValue) async {
    setState(() {
      brandId = newValue!;
    });
    await widget.controller.showModel(brandId: brandId.toString());
    setState(() {
      modelId = int.parse(widget.controller.model.first.codigo);
    });
  }

  void _onModelChanged(int? newValue) async {
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
  }

  void _onYearChanged(int? newValue) {
    yearId = newValue!;
    id = widget.controller.year
        .firstWhere((m) => int.tryParse(m.anoSemHifen) == yearId)
        .codigo;
    widget.controller.showValue(
      brandId: brandId.toString(),
      modelId: modelId.toString(),
      yearId: id,
    );
    setState(() {});
  }

  void _saveEditCar(BuildContext context) {
    Marcas marca = widget.controller.brand
        .firstWhere((m) => int.tryParse(m.codigo) == brandId);
    Modelos modelo = widget.controller.model
        .firstWhere((m) => int.tryParse(m.codigo) == modelId);
    Anos ano = widget.controller.year.firstWhere(
        (m) => m.codigo.substring(0, 4) == yearId.toString().substring(0, 4));

    Carro car = Carro(
      id: widget.car?.id,
      marca: marca,
      modelo: modelo,
      ano: ano,
      valor: widget.controller.value!.valor,
    );

    if (widget.car != null) {
      widget.controller.editCars(car).then((_) {
        resetDropdownValues();
        widget.controller.selectCars();
        Navigator.of(context).pop();
      });
    } else {
      widget.controller.insertCars(car).then((_) {
        widget.controller.selectCars();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Expanded(
        child: widget.controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                      onChanged: _onBrandChanged,
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
                      onChanged: _onModelChanged,
                    ),
                    const SizedBox(height: 8),
                    CustomDropdown(
                      hintText: 'Anos',
                      value: yearId,
                      items: widget.controller.year.map((marca) {
                        id = marca.codigo;
                        return DropdownMenuItem<int>(
                          value: int.parse(marca.anoSemHifen),
                          child: Text(marca.nome),
                        );
                      }).toList(),
                      onChanged: _onYearChanged,
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
                            _saveEditCar(context);
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
    });
  }
}
