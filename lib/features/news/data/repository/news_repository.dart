import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/data_source/remote/news_api_provider.dart';
import 'package:football/features/news/data/models/trending.dart';

class NewsRepository {
  NewsApiProvider newsApiProvider;
  NewsRepository(this.newsApiProvider);

  Future<DataState> getNews({String language = "en", String ccode3 = "IRN"}) async{
    var json = [
    {
        "imageUrl": "https://images2.minutemediacdn.com/image/upload/c_crop,w_5291,h_2976,x_0,y_12/c_fill,w_912,h_516,f_auto,q_auto,g_auto/images/GettyImages/mmsport/90min_en_international_web/01j6wb6dpream77c9tq6.jpg",
        "title": "Arsenal reveal Raheem Sterling squad number",
        "gmtTime": "2024-09-03T17:30:00.000Z",
        "sourceStr": "90min",
        "sourceIconUrl": null,
        "page": {
            "url": "/embed/news/01j6wb51xnwx/arsenal-reveal-raheem-sterling-squad-number"
        }
    },
    {
        "imageUrl": "https://images2.minutemediacdn.com/image/upload/c_crop,w_4360,h_2452,x_0,y_112/c_fill,w_912,h_516,f_auto,q_auto,g_auto/images/GettyImages/mmsport/90min_en_international_web/01j6w7t13v44j97rb8av.jpg",
        "title": "4 things we learned about Barcelona in August",
        "gmtTime": "2024-09-03T17:30:00.000Z",
        "sourceStr": "90min",
        "sourceIconUrl": null,
        "page": {
            "url": "/embed/news/01j6w4bknkgb/4-things-we-learned-about-barcelona-august"
        }
    },
    {
        "imageUrl": "https://images.performgroup.com/di/library/omnisport/44/67/jamal-lewis_kv8ybn0j7sz612mt9a1ijcec4.png?t=-1152361359&w=520&h=300",
        "title": "Lewis creates British history with Sao Paulo loan move",
        "gmtTime": "2024-09-03T14:39:40.000Z",
        "sourceStr": "FotMob",
        "sourceIconUrl": null,
        "page": {
            "url": "/news/oroi9exltviu1gx2k8am7xoeq-lewis-creates-british-history-sao-paulo-loan-move"
        }
    },
    {
        "imageUrl": "https://images.performgroup.com/di/library/omnisport/d6/d7/angelo-gabriel_123uluba4c4kr1rsyuwbxm6mng.png?t=-1148961103&w=520&h=300",
        "title": "Chelsea confirm Angelo exit to Al-Nassr in £19.4m transfer",
        "gmtTime": "2024-09-03T15:13:24.000Z",
        "sourceStr": "FotMob",
        "sourceIconUrl": null,
        "page": {
            "url": "/news/j6o8tq32ufrj1mps67gqa61j7-chelsea-confirm-angelo-exit-al-nassr-194m-transfer"
        }
    },
    {
        "imageUrl": "https://images2.minutemediacdn.com/image/upload/c_crop,w_5000,h_2812,x_0,y_231/c_fill,w_912,h_516,f_auto,q_auto,g_auto/images/GettyImages/mmsport/90min_en_international_web/01j6w8fawy5dy3dnj2dz.jpg",
        "title": "Cristiano Ronaldo responds to international retirement rumours",
        "gmtTime": "2024-09-03T18:00:01.000Z",
        "sourceStr": "90min",
        "sourceIconUrl": null,
        "page": {
            "url": "/embed/news/01j6w73qq353/cristiano-ronaldo-responds-international-retirement-rumours"
        }
    }
];
    try{
      Response response   = await newsApiProvider.getNews(language: language,ccode3: ccode3);
      if (response.statusCode == 200){
        print("if (response.statusCode == 200){");
        Trending trending = Trending.fromJson(response.data);
        print("Trending trending = Trending.fromJson(response.data);");
        return DataSuccess(trending);
      }else{
        // Trending trending = Trending.fromJson(json);
        // return DataSuccess(trending);
        return DataFailed(response.statusMessage);
      }
    }catch (e){
      // Trending trending = Trending.fromJson(json);
      // print("Trending trending = Trending.fromJson(response.data);");
      // return DataSuccess(trending);
      return DataFailed("$e");
    }
  }
}