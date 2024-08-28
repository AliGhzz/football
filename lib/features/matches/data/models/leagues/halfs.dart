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
}


