class News {
  String? imageUrl;
  String? title;
  String? gmtTime;
  String? source;
  String? sourceIconUrl;
  String? page;
  News(this.imageUrl,this.title,this.gmtTime,this.source,this.sourceIconUrl,this.page);

  factory News.fromJson(Map<String,dynamic> json){
    return News(
      json['imageUrl'], 
      json['title'], 
      json['gmtTime'], 
      json['source'], 
      json['sourceIconUrl'], 
      json['page']['url']
    );
  }
}