import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(AboutPage());
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('About'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: AboutContent(),
        ),
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'More info about our app',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        Text(
          'Hoping to provide you with the best experience possible.',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () => _launchURL('https://drive.google.com/file/d/1FF0s7yiTII3VfivS8rC7KWLPUu7oUhRr/view?usp=sharing'),
          child: Text('Data Policy'),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () => _launchURL(''),
          child: Text('Terms of Use'),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}