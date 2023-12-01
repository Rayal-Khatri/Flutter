import 'package:flutter/material.dart';

class Pet {
  int? _totalSize;
  int? _typeID;
  int? _offset;
  late List<PetModel> _products;
}

Pet({required totalSize, required typeId, required oddset, required products}){
  this._totalSize = totalSize;
  this._typeId=typeId;
  this._offset=offset;
  this._products=products;
}

Pet.fromJson(Map<string, dynamic> json){
  _totalsize = json['total_size'];
  _typeId = json['type_id'];
  _offset = json['offset'];
  if(json['products'] != null){
    _products = <petModel>[];
    json['products'].forEach((v){
      _products!.add(PetModel.formJson(v));
    });
  }
}