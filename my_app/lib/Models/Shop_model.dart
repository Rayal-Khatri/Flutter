class Shops {
  int? _totalSize;
  int? _offset;
  late List<Shop>? _shop;
  List<Shop>? get shop => _shop;

  Shops({required totalSize, required offset, required List<Shop>? shop}) {
    if (totalSize != null) {
      this._totalSize = totalSize;
    }
    if (offset != null) {
      this._offset = offset;
    }
    if (shop != null) {
      this._shop = shop;
    }
  }

  int? get totalSize => _totalSize;
  set totalSize(int? totalSize) => _totalSize = totalSize;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  set shelter(List<Shop>? shop) => _shop = shop;

  Shops.fromJson(Map<String, dynamic> json) {
    _totalSize = json['totalSize'];
    _offset = json['offset'];
    if (json['shop'] != null) {
      _shop = <Shop>[];
      json['shop'].forEach((v) {
        _shop!.add(new Shop.fromJson(v));
      });
    }
  }
}

class Shop {
  String? _name;
  String? _location;
  double? _rating;
  String? _img;
  String? _contact;
  String? _description;
  List<String>? _products;

  Shop(
      {String? name,
      String? location,
      double? rating,
      String? img,
      String? contact,
      String? description,
      List<String>? products}) {
    if (name != null) {
      this._name = name;
    }
    if (location != null) {
      this._location = location;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (img != null) {
      this._img = img;
    }
    if (contact != null) {
      this._contact = contact;
    }
    if (description != null) {
      this._description = description;
    }
    if (products != null) {
      this._products = products;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get location => _location;
  set location(String? location) => _location = location;
  double? get rating => _rating;
  set rating(double? rating) => _rating = rating;
  String? get img => _img;
  set img(String? img) => _img = img;
  String? get contact => _contact;
  set contact(String? contact) => _contact = contact;
  String? get description => _description;
  set description(String? description) => _description = description;
  List<String>? get products => products;
  set products(List<String>? products) => products = products;

  Shop.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _location = json['location'];
    _rating = json['rating'];
    _img = json['img'];
    _contact = json['contact'];
    _description = json['description'];
    _products = json['products'].cast<String>();
  }
}
