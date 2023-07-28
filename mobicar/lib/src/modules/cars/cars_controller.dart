import 'package:mobicar/src/models/anos.dart';
import 'package:mobicar/src/models/marcas.dart';
import 'package:mobicar/src/models/modelos.dart';
import 'package:mobicar/src/repositories/cars/cars_repository.dart';
import 'package:mobx/mobx.dart';

import '../../models/valor.dart';

part 'cars_controller.g.dart';

class CarsController = CarsControllerBase with _$CarsController;

enum CarsStateStatus {
  initial,
  loading,
  loaded,
  error,
}

abstract class CarsControllerBase with Store {
  final CarsRepository _carsRepository;

  CarsControllerBase(this._carsRepository);

  @observable
  CarsStateStatus _status = CarsStateStatus.initial;

  @readonly
  List<Marcas> _brand = [];

  @readonly
  List<Modelos> _model = [];

  @readonly
  List<Anos> _year = [];

  @readonly
  List<Valor> _value = [];

  @observable
  String? _errorMessage;

  @action
  Future<void> showBrand() async {
    _status = CarsStateStatus.loading;
    _brand = await _carsRepository.findBrand();
    _status = CarsStateStatus.loaded;
  }

  @action
  Future<void> showModel({required String brandId}) async {
    _status = CarsStateStatus.loading;
    _model = await _carsRepository.findModel(brandId);
    _status = CarsStateStatus.loaded;
  }

  @action
  Future<void> showYear(
      {required String brandId, required String modelId}) async {
    _status = CarsStateStatus.loading;
    _year = await _carsRepository.findYear(brandId, modelId);
    _status = CarsStateStatus.loaded;
  }

  @action
  Future<void> showValue({
    required brandId,
    required String modelId,
    required String yearId,
  }) async {
    _status = CarsStateStatus.loading;
    _value = await _carsRepository.findValue(brandId, modelId, yearId);
    _status = CarsStateStatus.loaded;
  }
}
