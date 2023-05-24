import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:zucc_app/main.dart';

class Circolari extends StatefulWidget {
  const Circolari({super.key});
  @override
  State<Circolari> createState() => _CircolariState();
}

class _CircolariState extends State<Circolari> {
  List<Circolare> circolari = [];

  @override
  void initState() {
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse(
        "https://web.spaggiari.eu/sdg/app/default/comunicati.php?sede_codice=VEIT0007&referer=https://www.itiszuccante.edu.it");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titolo = html
        .querySelectorAll('td.cell-border[colspan="20"] > span:nth-child(1)')
        .map((element) => element.innerHtml.trim())
        .toList();

    final categoria = html
        .querySelectorAll('td.cell-border[colspan="20"] > span:nth-child(9)')
        .map((element) => element.innerHtml.trim())
        .toList();

    final pubblicato = html
        .querySelectorAll('td.cell-border[colspan="20"] > span:nth-child(6)')
        .map((element) => element.innerHtml.trim())
        .toList();

    final validoFino = html
        .querySelectorAll('td.cell-border[colspan="20"] > span:nth-child(15)')
        .map((element) => element.innerHtml.trim())
        .toList();

    final documenti = html
        .querySelectorAll('td.cell-border[colspan="5"] > div.download-file')
        .map((element) => element.attributes['id_doc'] ?? '')
        .toList();

    var objAllegati = {};
    final allegati = html.querySelectorAll('.link-to-file');
    var selectedDoc = 0;
    var swapAllegati = [];
    for (final allegato in allegati) {
      if (documenti.contains(allegato.attributes['id_doc'])) {
        selectedDoc = documenti
            .indexOf(allegato.attributes['id_doc']!); // prendo l'indice
        objAllegati[selectedDoc] = swapAllegati;
        swapAllegati = [];
      }
      if (!documenti.contains(allegato.attributes['id_doc'])) {
        swapAllegati
            .add({'name': allegato.text, 'id': allegato.attributes['id_doc']});
      }
    }

    setState(() {
      circolari = List.generate(
        categoria.length,
        (index) => Circolare(
            titolo: titolo[index],
            categoria: categoria[index],
            pubblicato: pubblicato[index],
            validoFino: validoFino[index],
            documenti: documenti[index],
            allegati: objAllegati[index],
            id: documenti[index]),
      );
    });
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Circolari'),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: ListView.builder(
            itemCount: circolari.length,
            itemBuilder: (context, index) {
              final circolare = circolari[index];
              return Card(
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () {
                      print(circolare.documenti);
                      _launchUrl(Uri.parse(
                          'https://web.spaggiari.eu/sdg/app/default/view_documento.php?a=akVIEW_FROM_ID&id_documento=${circolare.documenti}&sede_codice=VEIT0007'));
                    },
                  ),
                  title: Text(
                    circolare.titolo,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        'Categoria: ${circolare.categoria}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Pubblicato il: ${circolare.pubblicato}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Valido fino al: ${circolare.validoFino}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 1 /* */),
                      if (circolare.allegati.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: circolare.allegati.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(Icons.attachment),
                              title: Text(circolare.allegati[index]['name']),
                              onTap: () {
                                final url = Uri.parse(
                                    'https://web.spaggiari.eu/sdg/app/default/view_documento.php?a=akVIEW_FROM_ID&id_documento=${circolare.allegati[index]['id']}&sede_codice=VEIT0007');
                                _launchUrl(url);
                              },
                            );
                          },
                        )
                    ],
                  ),
                ),
              );
            }));
  }
}

class Circolare {
  final String titolo;
  final String categoria;
  final String pubblicato;
  final String validoFino;
  final List<dynamic> allegati;
  final String documenti;
  final String id;

  const Circolare({
    required this.titolo,
    required this.categoria,
    required this.pubblicato,
    required this.validoFino,
    required this.allegati,
    required this.documenti,
    required this.id,
  });
}
