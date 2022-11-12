import 'package:flutter/material.dart';
import 'package:news_app/domain/api_service.dart';
import 'package:news_app/models/article_model.dart';

import '../widgets/customListTile.dart';

class NewsScreen extends StatefulWidget {

  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}


class _NewsScreenState extends State<NewsScreen> {
  ApiService client = ApiService();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewsApp'),

      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          print(client.getArticle().toString());
          if (snapshot.hasData) {

           var articles = snapshot.data;

            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
