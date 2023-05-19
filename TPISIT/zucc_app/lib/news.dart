/*filzuccapi.piovonoofferte.it
/news
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  // ignore: unused_field
  List<NewsItem> _news = [];

  Future<void> getNewsFromServer() async {
    debugPrint('yes');
    final response =
        await Dio().get('https://filzuccapi.piovonoofferte.it/news');
    debugPrint(response.toString());
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.data) as List<dynamic>;
      debugPrint('no');
      setState(() {
        _news = jsonList.map((json) => NewsItem.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load News');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _buildProductsList(),
    );
  }

  Widget _buildProductsList() {
    getNewsFromServer();
    if (_news.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return LayoutBuilder(
          builder: ((context, constraints) => ListView.builder(
                itemCount: _news.length,
                itemBuilder: (context, index) {
                  final news = _news[index];
                  return TextButton(
                      onPressed: () => _launchUrl(Uri.parse(news.link)),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.blue.shade400,
                            child: Text(news.title),
                          ),
                          Divider(height: constraints.maxHeight * 0.02),
                          Text(news.body),
                        ],
                      ));
                },
              )));
    }
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class NewsItem {
  final String title;
  final String date;
  final String body;
  final String link;

  NewsItem(
      {required this.title,
      required this.date,
      required this.body,
      required this.link});

  static NewsItem fromJson(json) => NewsItem(
      title: json['title'],
      date: json['date'],
      body: json['body'],
      link: json['link']);
}
