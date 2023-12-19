class Shelters_adopt {
  int? _totalSize;
  int? _offset;
  late List<Shelter>? _shelter;
  List<Shelter>? get shelter => _shelter;

  Shelters_adopt(
      {required totalSize, required offset, required List<Shelter>? shelter}) {
    if (totalSize != null) {
      this._totalSize = totalSize;
    }
    if (offset != null) {
      this._offset = offset;
    }
    if (shelter != null) {
      this._shelter = shelter;
    }
  }

  int? get totalSize => _totalSize;
  set totalSize(int? totalSize) => _totalSize = totalSize;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  set shelter(List<Shelter>? shelter) => _shelter = shelter;

  Shelters_adopt.fromJson(Map<String, dynamic> json) {
    _totalSize = json['totalSize'];
    _offset = json['offset'];
    if (json['shelter'] != null) {
      _shelter = <Shelter>[];
      json['shelter'].forEach((v) {
        _shelter!.add(new Shelter.fromJson(v));
      });
    }
  }
}

class Shelter {
  String? _name;
  String? _location;
  double? _rating;
  String? _img;
  String? _contact;
  String? _description;
  List<String>? _facilities;

  Shelter(
      {String? name,
      String? location,
      double? rating,
      String? img,
      String? contact,
      String? description,
      List<String>? facilities}) {
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
    if (facilities != null) {
      this._facilities = facilities;
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
  List<String>? get facilities => _facilities;
  set facilities(List<String>? facilities) => _facilities = facilities;

  Shelter.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _location = json['location'];
    _rating = json['rating'];
    _img = json['img'];
    _contact = json['contact'];
    _description = json['description'];
    _facilities = json['facilities'].cast<String>();
  }
}
