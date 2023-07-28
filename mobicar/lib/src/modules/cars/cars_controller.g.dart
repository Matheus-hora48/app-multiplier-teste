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

  late final _$_errorMessageAtom =
      Atom(name: 'CarsControllerBase._errorMessage', context: context);

  @override
  String? get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$showBrandAsyncAction =
      AsyncAction('CarsControllerBase.showBrand', context: context);

  @override
  Future<void> showBrand() {
    return _$showBrandAsyncAction.run(() => super.showBrand());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
