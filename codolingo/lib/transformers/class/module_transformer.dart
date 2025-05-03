import 'package:codolingo/model/class/module.dart';
import 'package:codolingo/transformers/transformer_exception.dart';

class CodolingoModuleTransformer {
  CodolingoModule fromJson(dynamic data) {
    try {
      return CodolingoModule(data[CodolingoModule.idField], data[CodolingoModule.labelField],
          data[CodolingoModule.nbStarsToUnlockField] ?? 0, data[CodolingoModule.isUnlockedField]?? true, [], null);
    } on Error catch (e) {
      print(e);
      throw MissingFieldTransformerException(e);
    }
  }

  List<CodolingoModule> fromListJson(dynamic data) {
    print(data);
    List<dynamic> rawList = data as List<dynamic>;
    return rawList.map((dynamic rawCodolingoModule) => fromJson(rawCodolingoModule)).toList();
  }
}
