
import 'package:flutter/material.dart';

import 'detail_news.dart';
import 'model/news.dart';

class ReferenceNews extends StatelessWidget {
    final List<News> news;

  ReferenceNews(this.news) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Card(
              elevation: 5,
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(news[index]))),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 205,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(image: NetworkImage(news[index].urlToImage), fit: BoxFit.fill)
                        ),
                        child: Stack(
                          children: [
                            Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0.0),
                                ],
                                stops: [
                                  0.0,
                                  1.0,
                                ],
                              ),
                            ),
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  news[index].title,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                    ]),
                      ),
                    ],
                  ),
                ),
              ));
        },
        itemCount: news.length,
      ),
    );
  }

}