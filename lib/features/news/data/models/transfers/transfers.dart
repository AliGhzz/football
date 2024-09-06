import 'package:football/features/news/data/models/transfers/transfer.dart';

class Transfers {
  List<Transfer>? transfers;
  Transfers({this.transfers});

  factory Transfers.fromJson(Map<String, dynamic> json){
    print("factory Transfers.fromJson(Map<String, dynamic> json){");
    return Transfers(   
      transfers: (json['transfers'] as List<dynamic>?)
        !.map((e) => Transfer.fromJson(e as Map<String, dynamic>))
        .toList()
    ); 
  }
}