import 'package:assignment_1_flutter_course/detail_news.dart';
import 'package:flutter/material.dart';
import '../model/news.dart';

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList(this.news) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return Card(
              elevation: 5,
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(news[index]))),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(image: NetworkImage(news[index].urlToImage), fit: BoxFit.fitHeight)
                        ),
                        child: Stack(
                          children: [
                            Container(
                            width: double.infinity,
                            height: 250,
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
                                ),
                                Text(news[index].description, 
                                style: TextStyle(
                                  color: Colors.grey
                                ),)
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

