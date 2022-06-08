import 'dart:convert';

import 'package:assignment_1_flutter_course/detail_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/news.dart';

class NewsList extends StatefulWidget {
  String jsonString;
  String _title;

  NewsList(this._title,this.jsonString) : super();

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<News> _newsItem = [];
  late bool _loading;
  var title = "";
 
  @override
  void initState(){
    _loading = true;
    super.initState();

    readJson();
  }

  void readJson() async {
    final String response = await rootBundle.loadString(widget.jsonString);
    final data = await json.decode(response)['data'] as List;

    var news = data.map((newsJson) => News.fromJson(newsJson)).toList();
    debugPrint("Read Json");

    setState(() {
      _loading = false;
      _newsItem = news;
      
    debugPrint("Set Json");
     
    });
    
  }

   List<News> getListNews() {
    debugPrint("Set Json");
    return _newsItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: SingleChildScrollView(
        child:  _loading ? Center(child: CircularProgressIndicator(color: Colors.blue,)) :
    Container(
      width: double.infinity,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return Card(
              elevation: 5,
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(_newsItem[index]))),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(image: NetworkImage(_newsItem[index].urlToImage), fit: BoxFit.fitHeight)
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
                                  _newsItem[index].title,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(_newsItem[index].description, 
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
        itemCount: _newsItem.length,
      ),
    )
      )
    );
  }
}

