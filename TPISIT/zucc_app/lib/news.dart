// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';
import 'package:zucc_app/main.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<Notizia> _news = [];

  @override
  void initState() {
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse("https://www.itiszuccante.edu.it/categoria/news");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final elements = html.querySelectorAll('.views-row');

    var news = [];

    for (final element in elements) {
      final titleElement = element.querySelector('.field-content > h1');
      final title = titleElement?.text ?? '';

      final imageElement = element.querySelector('.views-field-body img');
      final imageUrl = imageElement?.attributes['src'] ?? '';

      final dateElement =
          element.querySelector('.views-field-created .field-content');
      final date = dateElement?.text ?? '';

      final bodyElement = element.querySelector('.views-field-body')!;
      final paragrafo = bodyElement
          .getElementsByTagName('p')
          .map((p) => p.text.trim())
          .join('\n');

      final urlElement = element.querySelector('.views-field-view-node a');
      final url = urlElement?.attributes['href'];

      news.add({
        'titolo': title,
        'immagine': imageUrl,
        'data': date,
        'paragrafo': paragrafo,
        'url': url
      });
    }

    setState(() {
      _news = List.generate(
        news.length,
        (index) => Notizia(
          titolo: news[index]['titolo'],
          immagini: news[index]['immagine'],
          sito: news[index]['url'],
          pubblicazione: news[index]['data'],
          paragrafo: news[index]['paragrafo'],
        ),
      );
    });
  }

  Future<void> _launcherUri(url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "News",
          style: TextStyle(
              color: Colors.blue.shade400,
              fontSize: 30,
              fontWeight: FontWeight.w200),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.blue.shade400,
        ),
      ),
      body: ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          final notizia = _news[index];
          return Card(
              child: ListTile(
            tileColor: Colors.blue.shade200,
            onTap: () {
              _launcherUri('https://www.itiszuccante.edu.it/${notizia.sito}');
            },
            title: Text(
              notizia.titolo,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pubblicato in data: ${notizia.pubblicazione}',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  notizia.paragrafo,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}

class Notizia {
  final String titolo;
  final String sito;
  final String pubblicazione;
  final String paragrafo;

  const Notizia({
    required this.titolo,
    required this.sito,
    required this.pubblicazione,
    required this.paragrafo,
    required immagini,
  });
}
