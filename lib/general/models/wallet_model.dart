class WalletModel {
  WalletModel({
    this.walletDataModel,
    this.message,
    this.status,
  });
  WalletDataModel? walletDataModel;
  String? message;
  bool? status;

  WalletModel.fromJson(Map<String, dynamic> json) {
    walletDataModel = WalletDataModel.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = walletDataModel?.toJson();
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}

class WalletDataModel {
  WalletDataModel({
    this.retainers,
    this.totals,
  });
  int? retainers;
  int? totals;

  WalletDataModel.fromJson(Map<String, dynamic> json) {
    retainers = json['retainers'];
    totals = json['totals'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['retainers'] = retainers;
    _data['totals'] = totals;
    return _data;
  }
}
