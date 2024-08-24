class Halfs {
  String? firstHalfStarted;
  String? secondHalfStarted;
  String? firstExtraHalfStarted;
  String? secondExtraHalfStarted;
  Halfs({
    this.firstHalfStarted,
    this.secondHalfStarted,
    this.firstExtraHalfStarted,
    this.secondExtraHalfStarted
  });

  factory Halfs.fromJson(Map<String, dynamic> json) {
   return Halfs(
    firstHalfStarted: json['firstHalfStarted'],
    secondHalfStarted: json['secondHalfStarted'],
    firstExtraHalfStarted: json['firstExtraHalfStarted'],
    secondExtraHalfStarted: json['secondExtraHalfStarted']
   );
  }

  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}


  // factory Status.fromJson(Map<String, dynamic> json) => Status(
  //       utcTime: json['utcTime'] == null
  //           ? null
  //           : DateTime.parse(json['utcTime'] as String),
  //       halfs: json['halfs'] == null
  //           ? null
  //           : Halfs.fromJson(json['halfs'] as Map<String, dynamic>),
  //       started: json['started'] as bool?,
  //       cancelled: json['cancelled'] as bool?,
  //       finished: json['finished'] as bool?,
  //       scoreStr: json['scoreStr'], 
  //     );