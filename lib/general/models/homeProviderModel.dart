class HomeProviderModel {
  HomeProviderModel({
    this.homeProviderDataModel,
    this.message,
    this.status,
  });
  HomeProviderDataModel? homeProviderDataModel;
  String? message;
  bool? status;

  HomeProviderModel.fromJson(Map<String, dynamic> json) {
    homeProviderDataModel = HomeProviderDataModel.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = homeProviderDataModel?.toJson();
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}

class HomeProviderDataModel {
  HomeProviderDataModel({
    this.providerModel,
  });
  ProviderModel? providerModel;

  HomeProviderDataModel.fromJson(Map<String, dynamic> json) {
    providerModel = ProviderModel.fromJson(json['provider']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['provider'] = providerModel?.toJson();
    return _data;
  }
}

class ProviderModel {
  ProviderModel({
    this.id,
    this.image,
    this.contactPhone,
    this.gallery,
    this.walletBalance,
    this.instructions,
    this.schedules,
    this.rates,
    this.rate,
    this.rateCount,
    this.ratesAvg,
    this.isApproved,
    this.hasSubscription,
  });
  int? id;
  String? image;
  String? contactPhone;
  List<Gallery>? gallery;
  String? walletBalance;
  String? instructions;
  List<dynamic>? schedules;
  List<dynamic>? rates;
  Null rate;
  int? rateCount;
  int? ratesAvg;
  int? isApproved;
  bool? hasSubscription;

  ProviderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    contactPhone = json['contact_phone'];
    gallery =
        List.from(json['gallery']).map((e) => Gallery.fromJson(e)).toList();
    walletBalance = json['wallet_balance'];
    instructions = json['instructions'];
    schedules = List.castFrom<dynamic, dynamic>(json['schedules']);
    rates = List.castFrom<dynamic, dynamic>(json['rates']);
    rate = null;
    rateCount = json['rate_count'];
    ratesAvg = json['rates_avg'];
    isApproved = json['is_approved'];
    hasSubscription = json['has_subscription'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['contact_phone'] = contactPhone;
    _data['gallery'] = gallery?.map((e) => e.toJson()).toList();
    _data['wallet_balance'] = walletBalance;
    _data['instructions'] = instructions;
    _data['schedules'] = schedules;
    _data['rates'] = rates;
    _data['rate'] = rate;
    _data['rate_count'] = rateCount;
    _data['rates_avg'] = ratesAvg;
    _data['is_approved'] = isApproved;
    _data['has_subscription'] = hasSubscription;
    return _data;
  }
}

class Gallery {
  Gallery({
    this.id,
    this.image,
    this.collection,
    this.isMain,
  });
  int? id;
  String? image;
  String? collection;
  bool? isMain;

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    collection = json['collection'];
    isMain = json['is_main'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['collection'] = collection;
    _data['is_main'] = isMain;
    return _data;
  }
}
