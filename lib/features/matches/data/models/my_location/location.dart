class Location {
  String? countryCode;
  String? ccode3;
  String? timezone;
  String? ip;
  String? regionId;
  String? regionName;

  Location({this.countryCode,this.ccode3,this.timezone,this.ip,this.regionId,this.regionName});

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      countryCode: json['countryCode'],
      ccode3: json['ccode3'],
      timezone: json['timezone'],
      ip: json['ip'],
      regionId: json['regionId'],
      regionName: json['regionName'],
    );
  }
}