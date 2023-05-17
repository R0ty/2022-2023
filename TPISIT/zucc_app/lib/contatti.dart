// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContattiPage extends StatelessWidget {
  const ContattiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contatti'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Hai bisogno di contattarci?',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Ecco come puoi farlo:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Sede Triennio:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ContactItem(
                icon: Icons.fmd_good_rounded,
                title: 'Posizione',
                subtitle: 'Via Baglioni, n. 22 30173 Mestre (VE)',
                onTap: () => _launchUrl(
                    Uri.parse('https://goo.gl/maps/aUHwitNZp4BA9WTA7')),
              ),
              ContactItem(
                icon: Icons.phone,
                title: 'Telefono',
                subtitle: '041-5341046  ',
                onTap: () => _launchUrl(Uri.parse('tel:+390415341046')),
              ),
              ContactItem(
                icon: Icons.phone,
                title: 'FAX',
                subtitle: '041-5341472 ',
                onTap: () => _launchUrl(Uri.parse('tel:+390415341472')),
              ),
              SizedBox(height: 20),
              Text(
                'Sede Biennio:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ContactItem(
                icon: Icons.fmd_good_rounded,
                title: 'Posizione',
                subtitle: 'Via Raffaele Cattaneo, 3, 30173 Venezia (VE)',
                onTap: () => _launchUrl(
                    Uri.parse('https://goo.gl/maps/wdM9w2ZPs8b4n3Bj9')),
              ),
              ContactItem(
                icon: Icons.phone,
                title: 'Telefono',
                subtitle: '041-950960 ',
                onTap: () => _launchUrl(Uri.parse('tel:+39041950960')),
              ),
              ContactItem(
                icon: Icons.phone,
                title: 'FAX',
                subtitle: '041-5058416 ',
                onTap: () => _launchUrl(Uri.parse('tel:+390415058416  ')),
              ),
              const SizedBox(height: 20),
              Text(
                'In Generale:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ContactItem(
                icon: Icons.web,
                title: 'Sito Web',
                subtitle: 'itiszuccante.edu.it',
                onTap: () =>
                    _launchUrl(Uri.parse('https://www.itiszuccante.edu.it/')),
              ),
              ContactItem(
                icon: Icons.email,
                title: 'Email',
                subtitle: 'vetf04000t@istruzione.it',
                onTap: () =>
                    _launchUrl(Uri.parse('mailto:vetf04000t@istruzione.it')),
              ),
              ContactItem(
                icon: Icons.email,
                title: 'PEC',
                subtitle: 'vetf04000t@pec.istruzione.it',
                onTap: () => _launchUrl(
                    Uri.parse('mailto:vetf04000t@pec.istruzione.it')),
              ),
              ContactItem(
                  icon: Icons.copy_rounded,
                  title: 'Codice Fiscale',
                  subtitle: '82005200272',
                  onTap: () async {
                    Clipboard.setData(
                      const ClipboardData(text: '82005200272'),
                    );
                  }),
              ContactItem(
                  icon: Icons.copy_rounded,
                  title: 'Codice IPA',
                  subtitle: 'istsc_vetf04000t',
                  onTap: () async {
                    Clipboard.setData(
                      const ClipboardData(text: 'istsc_vetf04000t'),
                    );
                  }),
              ContactItem(
                  icon: Icons.copy_rounded,
                  title: 'Codice MECC.',
                  subtitle: 'vetf04000t',
                  onTap: () async {
                    Clipboard.setData(
                      const ClipboardData(text: 'vetf04000t'),
                    );
                  }),
            ],
          ),
        ));
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  ContactItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,  
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
