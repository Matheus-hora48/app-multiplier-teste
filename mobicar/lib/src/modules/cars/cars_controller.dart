import 'dart:developer';

import 'package:mobicar/src/models/model_anos.dart';
import 'package:mobicar/src/models/marcas.dart';
import 'package:mobicar/src/models/modelos.dart';
import 'package:mobicar/src/repositories/cars/cars_repository.dart';
import 'package:mobx/mobx.dart';

import '../../dto/carro.dart';
import '../../models/valor.dart';

part 'cars_controller.g.dart';

class CarsController = CarsControllerBase with _$CarsController;

abstract class CarsControllerBase with Store {
  final CarsRepository _carsRepository;

  CarsControllerBase(this._carsRepository);

  @readonly
  List<Marcas> _brand = [];

  @readonly
  List<Modelos> _model = [];

  @readonly
  List<Anos> _year = [];

  @readonly
  List<Carro> _cars = [];

  @observable
  String errorMensage = '';

  @observable
  int selectedBrandId = 1;

  @observable
  int selectedModelId = 0;

  @observable
  int selectedYearId = 0;

  @readonly
  Valor? _value;

  @observable
  String valueInput = '';

  @observable
  bool isLoading = false;

  @action
  cleanDropdown() {
    _model.clear();
    _year.clear();
    _value = null;
  }

  @action
  Future<void> showBrand() async {
    isLoading = true;
    _brand = await _carsRepository.findBrand();
    isLoading = false;
  }

  @action
  Future<void> showModel({required String brandId}) async {
    isLoading = true;
    _model = await _carsRepository.findModel(brandId);
    isLoading = false;
  }

  @action
  Future<void> showYear(
      {required String brandId, required String modelId}) async {
    isLoading = true;
    _year = await _carsRepository.findYear(brandId, modelId);
    isLoading = false;
  }

  @action
  Future<void> showValue({
    required String brandId,
    required String modelId,
    required String yearId,
  }) async {
    isLoading = true;
    _value = await _carsRepository.findValue(brandId, modelId, yearId);
    isLoading = false;
  }

  Future<void> selectCars() async {
    try {
      isLoading = true;
      _cars = await _carsRepository.selectCars();
      isLoading = false;
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      errorMensage = 'Erro ao buscar os carro';
      isLoading = false;
    }
  }

  Future<void> insertCars(Carro car) async {
    try {
      isLoading = true;
      await _carsRepository.insertCars(car);
      isLoading = false;
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      errorMensage = 'Erro ao inserir o carro';
      isLoading = false;
    }
  }

  Future<void> deleteCars(String id) async {
    try {
      isLoading = true;
      await _carsRepository.deleteCars(id);
      isLoading = false;
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      errorMensage = 'Erro ao deletar o carro';
      isLoading = false;
    }
  }

  Future<void> editCars(Carro car) async {
    try {
      isLoading = true;
      await _carsRepository.editCars(car);
      isLoading = false;
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      errorMensage = 'Erro ao editar o carro';
      isLoading = false;
    }
  }
}
