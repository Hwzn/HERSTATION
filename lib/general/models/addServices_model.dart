// class AddServicesModel {
//   String? name;
//   int? categoryId;
//   String? price;
//   String? retainer;

//   AddServicesModel({
//     this.name,
//     this.categoryId,
//     this.price,
//     this.retainer,
//   });
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "category_id": categoryId,
//         "price": price,
//         "retainer": retainer,
//       };
// }
import 'dart:convert';

class AddServicesModel {
  List<Map<String, dynamic>>? services;

  AddServicesModel({
    this.services,
  });

  Map<String, dynamic> toJson() => {
        "services": json.encode(services),
      };
}
