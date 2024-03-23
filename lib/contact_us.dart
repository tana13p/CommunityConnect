import 'package:flutter/material.dart';

void main() {
  runApp(ContactUsPage());
}

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ContactUsContent(),
        ),
      ),
    );
  }
}

class ContactUsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Feel free to contact us with any questions or concerns:',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 16.0),
        Text(
          'Email: armahajan_b22@it.vjti.ac.in',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'Phone: +91 9321621391',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 16.0),
        Text(
          'Email: tvppatil_b22@it.vjti.ac.in',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'Phone: +91 9136388896',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 16.0),
        Text(
          'Email: srkare_b22@it.vjti.ac.in',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'Phone: +91 9833320576',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 16.0),
        Text(
          'Email: kkzoher_b22@it.vjti.ac.in',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'Phone: +91 9152960526',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'SY BTech IT, VJTI',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () {
            // Implement functionality to launch email app with pre-filled email
          },
          child: Text('Send Email'),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Implement functionality to launch phone app with pre-filled phone number
          },
          child: Text('Call Us'),
        ),
      ],
    );
  }
}