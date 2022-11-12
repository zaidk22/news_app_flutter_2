import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class ApiService {

  Future<List<Article>> getArticle() async {
    String endPointUrl =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=83b1630e152f4d2082eb757309b39cf1";
    final url = Uri.parse(endPointUrl);
    final res = await http.get(url);



    if (res.statusCode == 200) {

      Map<String, dynamic> jsonBody = jsonDecode(res.body);


      List<dynamic> bodyNews = jsonBody['articles'];


  // List<Article> uu=  bodyNews.map((e) => Article.fromJson(e)).toList();
      print(bodyNews);

      var p = bodyNews.map((e) => Article.fromJson(e)).toList();



      //this line will allow us to get the different articles from the json file and putting them into a list
   /*  List<Article> articles =
      bodyNews.map((dynamic item) =>

         Article.fromJson(item)).toList();




    */

      return p;

    } else {
      throw ("Can't get the Articles");
    }
  }
}
