// превразщаем сырые данные в объекты Material

import 'package:cubit_example/data/models/products/material_model.dart';

abstract class MaterialsRepository {
  Future<List<MaterialModel>> getMaterials();
}

// impl репозитория материалов - который возврощает как мы получаем данные

class MaterialsRepositoryImpl implements MaterialsRepository {
  @override
  Future<List<MaterialModel>> getMaterials() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      MaterialModel(title: 'Wood', price: '10.0'),
      MaterialModel(title: 'Metal', price: '20.0'),
      MaterialModel(title: 'Plastic', price: '5.0'),
    ];
  }
}
