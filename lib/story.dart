
import 'package:flutter/material.dart';

import 'detail_news.dart';
import 'model/news.dart';

class StoryNews extends StatelessWidget {
    final List<News> news;

  StoryNews(this.news) : super();

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(news[index]))),
            child: CircleAvatar(
              radius: 48, backgroundImage: NetworkImage(news[index].urlToImage),backgroundColor: Colors.grey,
            ),
          );},
          itemCount: news.length,
    )
    );
  }
}