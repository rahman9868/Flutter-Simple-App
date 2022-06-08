
import 'package:assignment_1_flutter_course/model/news.dart';
import 'package:assignment_1_flutter_course/news_list.dart';
import 'package:flutter/material.dart';

class CategoryNews extends StatelessWidget {
  final List<TypeNews> category = [
    TypeNews("Technology","assets/technology.json"),
    TypeNews("Entertainment","assets/entertainment.json"),
    TypeNews("Business","assets/business.json"),
    TypeNews("General","assets/general.json"),
    TypeNews("Health","assets/health.json"),
    TypeNews("Science","assets/science.json"),
    TypeNews("Sports","assets/sports.json")
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.maxFinite,
      child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(category.length, (index) {
            return Center(
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsList(category[index].title,category[index].source))),
                child: Text(
                  category[index].title,
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18, ),
                ),
              ),
            );
          }),
        ),
      );
  }
}