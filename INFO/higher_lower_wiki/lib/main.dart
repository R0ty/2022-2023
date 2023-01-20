import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/it.wikipedia/all-access/all-agents/Donald_Trump/monthly/2022010100/2022123100'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String project;
  final String article;
  final String granularity;
  final String timestap;
  final String access;
  final String agent;
  final int views;

  const Album({
    required this.project,
    required this.article,
    required this.granularity,
    required this.timestap,
    required this.access,
    required this.agent,
    required this.views,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      project: json["project"],
      article: json["article"],
      granularity: json["granularity"],
      timestap: json["timestap"],
      access: json["access"],
      agent: json["agent"],
      views: json["views"],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('${snapshot.data}');
              } else {
                // return Text('${snapshot.error}');
                return Text('Failed to load album');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
