import 'package:json_annotation/json_annotation.dart';

part 'provider_data.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ProviderData {
  String? categoryId;
  String? word;
  String? order;
  String? refresh;

  ProviderData({this.categoryId, this.word, this.order, this.refresh});


}
