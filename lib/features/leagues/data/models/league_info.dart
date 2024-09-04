class LeagueInfo {
  int? id;
  String? name;
  String? localizedName;
  String? pageUrl;

  LeagueInfo({this.id, this.name, this.localizedName, this.pageUrl});

  factory LeagueInfo.fromJson(Map<String, dynamic> json) => LeagueInfo(
        id: json['id'] as int?,
        name: json['name'] as String?,
        localizedName: json['localizedName'] as String?,
        pageUrl: json['pageUrl'] as String?,
      );
}
