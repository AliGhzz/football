class Reason {
  String? short;
  String? shortKey;
  String? long;
  String? longKey;

  Reason({
    this.short,this.shortKey,this.long,this.longKey
  });

  factory Reason.fromJson(Map<String, dynamic> json) {
   return Reason(
    short: json['short'],
    shortKey: json['shortKey'],
    long: json['long'],
    longKey: json['longKey'],
   );
  }

}