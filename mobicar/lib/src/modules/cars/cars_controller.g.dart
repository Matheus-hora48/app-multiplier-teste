// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarsController on CarsControllerBase, Store {
  late final _$_brandAtom =
      Atom(name: 'CarsControllerBase._brand', context: context);

  List<Marcas> get brand {
    _$_brandAtom.reportRead();
    return super._brand;
  }

  @override
  List<Marcas> get _brand => brand;

  @override
  set _brand(List<Marcas> value) {
    _$_brandAtom.reportWrite(value, super._brand, () {
      super._brand = value;
    });
  }

  late final _$_modelAtom =
      Atom(name: 'CarsControllerBase._model', context: context);

  List<Modelos> get model {
    _$_modelAtom.reportRead();
    return super._model;
  }

  @override
  List<Modelos> get _model => model;

  @override
  set _model(List<Modelos> value) {
    _$_modelAtom.reportWrite(value, super._model, () {
      super._model = value;
    });
  }

  late final _$_yearAtom =
      Atom(name: 'CarsControllerBase._year', context: context);

  List<Anos> get year {
    _$_yearAtom.reportRead();
    return super._year;
  }

  @override
  List<Anos> get _year => year;

  @override
  set _year(List<Anos> value) {
    _$_yearAtom.reportWrite(value, super._year, () {
      super._year = value;
    });
  }

  late final _$_carsAtom =
      Atom(name: 'CarsControllerBase._cars', context: context);

  List<Carro> get cars {
    _$_carsAtom.reportRead();
    return super._cars;
  }

  @override
  List<Carro> get _cars => cars;

  @override
  set _cars(List<Carro> value) {
    _$_carsAtom.reportWrite(value, super._cars, () {
      super._cars = value;
    });
  }

  late final _$errorMensageAtom =
      Atom(name: 'CarsControllerBase.errorMensage', context: context);

  @override
  String get errorMensage {
    _$errorMensageAtom.reportRead();
    return super.errorMensage;
  }

  @override
  set errorMensage(String value) {
    _$errorMensageAtom.reportWrite(value, super.errorMensage, () {
      super.errorMensage = value;
    });
  }

  late final _$selectedBrandIdAtom =
      Atom(name: 'CarsControllerBase.selectedBrandId', context: context);

  @override
  int get selectedBrandId {
    _$selectedBrandIdAtom.reportRead();
    return super.selectedBrandId;
  }

  @override
  set selectedBrandId(int value) {
    _$selectedBrandIdAtom.reportWrite(value, super.selectedBrandId, () {
      super.selectedBrandId = value;
    });
  }

  late final _$selectedModelIdAtom =
      Atom(name: 'CarsControllerBase.selectedModelId', context: context);

  @override
  int get selectedModelId {
    _$selectedModelIdAtom.reportRead();
    return super.selectedModelId;
  }

  @override
  set selectedModelId(int value) {
    _$selectedModelIdAtom.reportWrite(value, super.selectedModelId, () {
      super.selectedModelId = value;
    });
  }

  late final _$selectedYearIdAtom =
      Atom(name: 'CarsControllerBase.selectedYearId', context: context);

  @override
  int get selectedYearId {
    _$selectedYearIdAtom.reportRead();
    return super.selectedYearId;
  }

  @override
  set selectedYearId(int value) {
    _$selectedYearIdAtom.reportWrite(value, super.selectedYearId, () {
      super.selectedYearId = value;
    });
  }

  late final _$_valueAtom =
      Atom(name: 'CarsControllerBase._value', context: context);

  Valor? get value {
    _$_valueAtom.reportRead();
    return super._value;
  }

  @override
  Valor? get _value => value;

  @override
  set _value(Valor? value) {
    _$_valueAtom.reportWrite(value, super._value, () {
      super._value = value;
    });
  }

  late final _$valueInputAtom =
      Atom(name: 'CarsControllerBase.valueInput', context: context);

  @override
  String get valueInput {
    _$valueInputAtom.reportRead();
    return super.valueInput;
  }

  @override
  set valueInput(String value) {
    _$valueInputAtom.reportWrite(value, super.valueInput, () {
      super.valueInput = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'CarsControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$showBrandAsyncAction =
      AsyncAction('CarsControllerBase.showBrand', context: context);

  @override
  Future<void> showBrand() {
    return _$showBrandAsyncAction.run(() => super.showBrand());
  }

  late final _$showModelAsyncAction =
      AsyncAction('CarsControllerBase.showModel', context: context);

  @override
  Future<void> showModel({required String brandId}) {
    return _$showModelAsyncAction.run(() => super.showModel(brandId: brandId));
  }

  late final _$showYearAsyncAction =
      AsyncAction('CarsControllerBase.showYear', context: context);

  @override
  Future<void> showYear({required String brandId, required String modelId}) {
    return _$showYearAsyncAction
        .run(() => super.showYear(brandId: brandId, modelId: modelId));
  }

  late final _$showValueAsyncAction =
      AsyncAction('CarsControllerBase.showValue', context: context);

  @override
  Future<void> showValue(
      {required dynamic brandId,
      required String modelId,
      required String yearId}) {
    return _$showValueAsyncAction.run(() =>
        super.showValue(brandId: brandId, modelId: modelId, yearId: yearId));
  }

  late final _$CarsControllerBaseActionController =
      ActionController(name: 'CarsControllerBase', context: context);

  @override
  dynamic cleanDropdown() {
    final _$actionInfo = _$CarsControllerBaseActionController.startAction(
        name: 'CarsControllerBase.cleanDropdown');
    try {
      return super.cleanDropdown();
    } finally {
      _$CarsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Marcas getBrandById(int brandId) {
    final _$actionInfo = _$CarsControllerBaseActionController.startAction(
        name: 'CarsControllerBase.getBrandById');
    try {
      return super.getBrandById(brandId);
    } finally {
      _$CarsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMensage: ${errorMensage},
selectedBrandId: ${selectedBrandId},
selectedModelId: ${selectedModelId},
selectedYearId: ${selectedYearId},
valueInput: ${valueInput},
isLoading: ${isLoading}
    ''';
  }
}
