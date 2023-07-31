import 'package:mobicar/src/dto/carro.dart';

abstract class DtoInterface {
  Carro fromInternalDatabase(Map<String, dynamic> map);
  Map<String, dynamic> toMapInternalDatabase(Carro carro);
  num parseMoney(String moneyValue);
}
