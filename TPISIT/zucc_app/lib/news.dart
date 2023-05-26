import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

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
        title: Text("News"),
      ),
      body: ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          final notizia = _news[index];
          return GestureDetector(
            onTap: () {
              _launcherUri('https://www.itiszuccante.edu.it/${notizia.sito}');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        notizia.titolo,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        "Pubblicata il ${notizia.pubblicazione} \n${notizia.paragrafo}",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 10 / 100),
                  ],
                ),
              ),
            ),
          );
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
