import 'package:flutter/material.dart';

void main() {
  runApp(AccountPage());
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Account'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: AccountContent(),
        ),
      ),
    );
  }
}

class AccountContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Personal Information',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(labelText: 'Phone Number'),
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(labelText: 'Gender'),
        ),
        SizedBox(height: 16.0),
        TextField(
          decoration: InputDecoration(labelText: 'Birthday'),
        ),
        SizedBox(height: 32.0),
        Text(
          'Events',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Navigate to enrolled events page
          },
          child: Text('Enrolled Events'),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Navigate to liked events page
          },
          child: Text('Liked Events'),
        ),
      ],
    );
  }
}