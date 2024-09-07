import 'package:football/features/news/data/models/transfers/transfer.dart';

class TopTransfers {
  List<Transfer>? transfers;
  TopTransfers({this.transfers});

  factory TopTransfers.fromJson(Map<String, dynamic> json){
    return TopTransfers(   
      transfers: (json['transfers'] as List<dynamic>?)
        !.map((e) => Transfer.fromJson(e as Map<String, dynamic>))
        .toList()
    ); 
  }
}