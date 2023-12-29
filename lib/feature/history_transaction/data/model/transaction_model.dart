import 'package:flutter_fe_rpl/feature/history_transaction/business/entity/transaction_entity.dart';

class TransactionHistoryModel extends MyTransactonHistory {
  String? id;
  final String name;
  final String imageUrl;
  final String price;

  TransactionHistoryModel({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          price: price,
        );

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "price": price,
      };
}
