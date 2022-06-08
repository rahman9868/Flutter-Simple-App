import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';
import '../model/news.dart';

class NewsDetail extends StatelessWidget {
  final News news;

  NewsDetail(this.news) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail News'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Card(
            elevation: 5,
            child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: NetworkImage(news.urlToImage), fit: BoxFit.fitHeight)),
                child: Stack(children: [
                  Container(
                    width: double.infinity,
                    height: 300,
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
                  ),
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      _getDateTime(news.publishedAt),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      news.content,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => _launchURL(news.url),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Click to read full news",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  String _getDateTime(String datetime) {
    DateTime parseDate =
        new DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(datetime);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MMM dd, yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  _launchURL(String url) async {
    var encodeUrl = Uri.encodeFull(url);
    if (await canLaunch(encodeUrl)) {
      await launch(encodeUrl);
    } else {
      throw 'Could not launch $url';
    }
  }
}
