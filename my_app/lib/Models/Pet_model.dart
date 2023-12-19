class Adoption {
  int? _totalSize;
  int? _offset;
  late List<Dogs>? _dogs;
  List<Dogs>? get dogs => _dogs;

  Adoption({required totalSize, required offset, required List<Dogs>? dogs}) {
    if (totalSize != null) {
      this._totalSize = totalSize;
    }
    if (offset != null) {
      this._offset = offset;
    }
    this._dogs = dogs;
  }

  int? get totalSize => _totalSize;
  set totalSize(int? totalSize) => _totalSize = totalSize;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  set dogs(List<Dogs>? dogs) => _dogs = dogs;

  Adoption.fromJson(Map<String, dynamic> json) {
    _totalSize = json['totalSize'];
    _offset = json['offset'];
    if (json['dogs'] != null) {
      _dogs = <Dogs>[];
      json['dogs'].forEach((v) {
        _dogs!.add(new Dogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalSize'] = this._totalSize;
    data['offset'] = this._offset;
    if (this._dogs != null) {
      data['dogs'] = this._dogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dogs {
  String? _name;
  String? _shelter;
  String? _breed;
  String? _img;
  String? _size;
  int? _age;
  String? _personality;
  HealthStatus? _healthStatus;
  String? _history;
  Training? _training;
  Requirements? _requirements;

  Dogs(
      {String? name,
      String? shelter,
      String? breed,
      String? img,
      String? size,
      int? age,
      String? personality,
      HealthStatus? healthStatus,
      String? history,
      Training? training,
      Requirements? requirements}) {
    if (name != null) {
      this._name = name;
    }
    if (shelter != null) {
      this._shelter = shelter;
    }
    if (breed != null) {
      this._breed = breed;
    }
    if (img != null) {
      this._img = img;
    }
    if (size != null) {
      this._size = size;
    }
    if (age != null) {
      this._age = age;
    }
    if (personality != null) {
      this._personality = personality;
    }
    if (healthStatus != null) {
      this._healthStatus = healthStatus;
    }
    if (history != null) {
      this._history = history;
    }
    if (training != null) {
      this._training = training;
    }
    if (requirements != null) {
      this._requirements = requirements;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get shelter => _shelter;
  set shelter(String? shelter) => _shelter = shelter;
  String? get breed => _breed;
  set breed(String? breed) => _breed = breed;
  String? get img => _img;
  set img(String? img) => _img = img;
  String? get size => _size;
  set size(String? size) => _size = size;
  int? get age => _age;
  set age(int? age) => _age = age;
  String? get personality => _personality;
  set personality(String? personality) => _personality = personality;
  HealthStatus? get healthStatus => _healthStatus;
  set healthStatus(HealthStatus? healthStatus) => _healthStatus = healthStatus;
  String? get history => _history;
  set history(String? history) => _history = history;
  Training? get training => _training;
  set training(Training? training) => _training = training;
  Requirements? get requirements => _requirements;
  set requirements(Requirements? requirements) => _requirements = requirements;

  Dogs.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _shelter = json['shelter'];
    _breed = json['breed'];
    _img = json['img'];
    _size = json['size'];
    _age = json['age'];
    _personality = json['personality'];
    _healthStatus = json['health_status'] != null
        ? new HealthStatus.fromJson(json['health_status'])
        : null;
    _history = json['history'];
    _training = json['training'] != null
        ? new Training.fromJson(json['training'])
        : null;
    _requirements = json['requirements'] != null
        ? new Requirements.fromJson(json['requirements'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['shelter'] = this._shelter;
    data['breed'] = this._breed;
    data['img'] = this._img;
    data['size'] = this._size;
    data['age'] = this._age;
    data['personality'] = this._personality;
    if (this._healthStatus != null) {
      data['health_status'] = this._healthStatus!.toJson();
    }
    data['history'] = this._history;
    if (this._training != null) {
      data['training'] = this._training!.toJson();
    }
    if (this._requirements != null) {
      data['requirements'] = this._requirements!.toJson();
    }
    return data;
  }
}

class HealthStatus {
  List<String>? _vaccinations;
  bool? _neutered;
  String? _medicalIssues;

  HealthStatus(
      {List<String>? vaccinations, bool? neutered, String? medicalIssues}) {
    if (vaccinations != null) {
      this._vaccinations = vaccinations;
    }
    if (neutered != null) {
      this._neutered = neutered;
    }
    if (medicalIssues != null) {
      this._medicalIssues = medicalIssues;
    }
  }

  List<String>? get vaccinations => _vaccinations;
  set vaccinations(List<String>? vaccinations) => _vaccinations = vaccinations;
  bool? get neutered => _neutered;
  set neutered(bool? neutered) => _neutered = neutered;
  String? get medicalIssues => _medicalIssues;
  set medicalIssues(String? medicalIssues) => _medicalIssues = medicalIssues;

  HealthStatus.fromJson(Map<String, dynamic> json) {
    _vaccinations = json['vaccinations'].cast<String>();
    _neutered = json['neutered'];
    _medicalIssues = json['medical_issues'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vaccinations'] = this._vaccinations;
    data['neutered'] = this._neutered;
    data['medical_issues'] = this._medicalIssues;
    return data;
  }
}

class Training {
  String? _obedience;
  String? _behavior;

  Training({String? obedience, String? behavior}) {
    if (obedience != null) {
      this._obedience = obedience;
    }
    if (behavior != null) {
      this._behavior = behavior;
    }
  }

  String? get obedience => _obedience;
  set obedience(String? obedience) => _obedience = obedience;
  String? get behavior => _behavior;
  set behavior(String? behavior) => _behavior = behavior;

  Training.fromJson(Map<String, dynamic> json) {
    _obedience = json['obedience'];
    _behavior = json['behavior'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['obedience'] = this._obedience;
    data['behavior'] = this._behavior;
    return data;
  }
}

class Requirements {
  String? _idealHome;
  String? _exerciseNeeds;

  Requirements({String? idealHome, String? exerciseNeeds}) {
    if (idealHome != null) {
      this._idealHome = idealHome;
    }
    if (exerciseNeeds != null) {
      this._exerciseNeeds = exerciseNeeds;
    }
  }

  String? get idealHome => _idealHome;
  set idealHome(String? idealHome) => _idealHome = idealHome;
  String? get exerciseNeeds => _exerciseNeeds;
  set exerciseNeeds(String? exerciseNeeds) => _exerciseNeeds = exerciseNeeds;

  Requirements.fromJson(Map<String, dynamic> json) {
    _idealHome = json['ideal_home'];
    _exerciseNeeds = json['exercise_needs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ideal_home'] = this._idealHome;
    data['exercise_needs'] = this._exerciseNeeds;
    return data;
  }
}
