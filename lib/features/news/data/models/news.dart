class News {
  String? imageUrl;
  String? title;
  String? gmtTime;
  String? source;
  String? sourceStr;
  String? sourceIconUrl;
  String? page;
  News(this.imageUrl,this.title,this.gmtTime,this.source,this.sourceStr,this.sourceIconUrl,this.page);

  factory News.fromJson(Map<String,dynamic> json){
    return News(
      json['imageUrl'], 
      json['title'], 
      json['gmtTime'], 
      json['sourceStr'],
      json['sourceStr']=="90min" ? "small90min" :json['sourceStr'], 
      json['sourceIconUrl'], 
      json['page']['url']
    );
  }
}