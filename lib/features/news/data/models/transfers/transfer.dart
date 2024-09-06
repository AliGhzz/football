import 'package:football/features/news/data/models/transfers/fee.dart';
import 'package:football/features/news/data/models/transfers/position.dart';
import 'package:football/features/news/data/models/transfers/transfer_type.dart';

class Transfer {
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final int? playerId;
  final Position? position;
  final String? transferDate;
  final String? fromClub;
  final int? fromClubId;
  final String? toClub;
  final int? toClubId;
  final Fee? fee;
  final TransferType? transferType;
  final bool? contractExtension;
  final bool? onLoan;
  final String? fromDate;
  final String? toDate;
  final int? marketValue;

  Transfer({
    this.firstName,
    this.lastName,
    this.fullName,
    this.playerId,
    this.position,
    this.transferDate,
    this.fromClub,
    this.fromClubId,
    this.toClub,
    this.toClubId,
    this.fee,
    this.transferType,
    this.contractExtension,
    this.onLoan,
    this.fromDate,
    this.toDate,
    this.marketValue,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) {
    print("factory Transfer.fromJson(Map<String, dynamic> json) {");
    String fn='';
    String ln='';
    List<String> words = json['name'].split(" ");
    String fullname = json['name'].replaceAll(" ","-");
    if(words.length==2){
      fn = words[0];
      ln = words[1];
    }else{
      fn = words[0];
      ln = words[0];
    }
    try{
      return Transfer(
      firstName: fn,
      lastName: ln,
      fullName: fullname,
      playerId: json['playerId'],
      position: Position.fromJson(json['position']),
      transferDate: json['transferDate'],
      fromClub: json['fromClub'],
      fromClubId: json['fromClubId'],
      toClub: json['toClub'],
      toClubId: json['toClubId'],
      // fee: Fee.fromJson(json['fee']),
      // transferType: TransferType.fromJson(json['transferType']),
      contractExtension: json['contractExtension'],
      onLoan: json['onLoan'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      marketValue: json['marketValue'],
    );
    }catch (e){
      print("------------------");
      print(json);
      return Transfer(
      firstName: fn,
      lastName: ln,
      fullName: fullname,
      playerId: json['playerId'],
      // position: Position.fromJson(json['position']),
      transferDate: json['transferDate'],
      fromClub: json['fromClub'],
      fromClubId: json['fromClubId'],
      toClub: json['toClub'],
      toClubId: json['toClubId'],
      // fee: Fee.fromJson(json['fee']),
      // transferType: TransferType.fromJson(json['transferType']),
      contractExtension: json['contractExtension'],
      onLoan: json['onLoan'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      marketValue: json['marketValue'],
    );
    }
    
  }
}
