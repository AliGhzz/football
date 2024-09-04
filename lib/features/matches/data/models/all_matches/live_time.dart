class LiveTime {
  String? short;
  String? shortKey;
  String? long;
  String? longKey;
  int? maxTime;
  int? addedTime;

  LiveTime(
      {this.short,
      this.shortKey,
      this.long,
      this.longKey,
      this.maxTime,
      this.addedTime});

  factory LiveTime.fromJson(Map<String, dynamic> json) {
    return LiveTime(
      short: json['short'],
      shortKey: json['shortKey'],
      long: json['long'],
      longKey: json['longKey'],
      maxTime: json['maxTime'],
      addedTime: json['addedTime'],
    );
  }
}
