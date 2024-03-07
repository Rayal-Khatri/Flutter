class Products {
  int? _totalSize;
  int? _offset;
  List<Items>? _items;
  List<Items>? get items => _items;

  Products({required totalSize, required offset, required List<Items>? items}) {
    if (totalSize != null) {
      this._totalSize = totalSize;
    }
    if (offset != null) {
      this._offset = offset;
    }
    if (items != null) {
      this._items = items;
    }
  }

  int? get totalSize => _totalSize;
  set totalSize(int? totalSize) => _totalSize = totalSize;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;

  set items(List<Items>? items) => _items = items;

  Products.fromJson(Map<String, dynamic> json) {
    _totalSize = json['totalSize'];
    _offset = json['offset'];
    if (json['items'] != null) {
      _items = <Items>[];
      json['items'].forEach((v) {
        _items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalSize'] = this._totalSize;
    data['offset'] = this._offset;
    if (this._items != null) {
      data['items'] = this._items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? _name;
  String? _shop;
  String? _category;
  String? _img;
  int? _price;
  String? _personality;
  String? _description;

  Items(
      {String? name,
      String? shop,
      String? category,
      String? img,
      int? price,
      String? personality,
      String? description}) {
    if (name != null) {
      this._name = name;
    }
    if (shop != null) {
      this._shop = shop;
    }
    if (category != null) {
      this._category = category;
    }
    if (img != null) {
      this._img = img;
    }
    if (price != null) {
      this._price = price;
    }
    if (personality != null) {
      this._personality = personality;
    }
    if (description != null) {
      this._description = description;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get shop => _shop;
  set shop(String? shop) => _shop = shop;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get img => _img;
  set img(String? img) => _img = img;
  int? get price => _price;
  set price(int? price) => _price = price;
  String? get personality => _personality;
  set personality(String? personality) => _personality = personality;
  String? get description => _description;
  set description(String? description) => _description = description;

  Items.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _shop = json['shop'];
    _category = json['category'];
    _img = json['img'];
    _price = json['price'];
    _personality = json['personality'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['shop'] = this._shop;
    data['category'] = this._category;
    data['img'] = this._img;
    data['price'] = this._price;
    data['personality'] = this._personality;
    data['description'] = this._description;
    return data;
  }
}
