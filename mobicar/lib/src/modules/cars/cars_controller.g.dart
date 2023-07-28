// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarsController on CarsControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'CarsControllerBase._status', context: context);

  @override
  CarsStateStatus get _status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  set _status(CarsStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

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

  @override
  String toString() {
    return '''

    ''';
  }
}
