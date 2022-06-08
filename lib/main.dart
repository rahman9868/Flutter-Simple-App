import 'dart:convert';

import 'package:assignment_1_flutter_course/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {
  
  List<News> _items = [];
  late bool _loading;

  void readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response)['data'] as List;

    // String jsonString = 'assets/data.json';
    // List listJson = await jsonDecode(jsonString)['data'] as List;
    var news = data.map((newsJson) => News.fromJson(newsJson)).toList();

    setState(() {
      _loading = false;
      _items = news;
     
    });
  }

  @override
  void initState(){
    _loading = true;
    super.initState();

    readJson();
  }

  List<News> getListNews() {
    return _items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot News'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _loading ? Center(child: CircularProgressIndicator(color: Colors.blue,)) :
            NewsList(getListNews()),
          ],
        ),
      ),
    );
  }
}

