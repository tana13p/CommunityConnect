import 'package:flutter/material.dart';

void main() {
  runApp(SupportPage());
}

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Support'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SupportForm(),
        ),
      ),
    );
  }
}

class SupportForm extends StatefulWidget {
  @override
  _SupportFormState createState() => _SupportFormState();
}

class _SupportFormState extends State<SupportForm> {
  final TextEditingController _bugReportController = TextEditingController();

  @override
  void dispose() {
    _bugReportController.dispose();
    super.dispose();
  }

  void _submitReport() {
    String bugReport = _bugReportController.text;
    // Here you can implement the logic to send the bug report
    // For now, let's just print it
    print('Bug Report: $bugReport');
    // You can also show a confirmation dialog or navigate to a confirmation page
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _bugReportController,
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Report a Bug',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: _submitReport,
          child: Text('Report'),
        ),
      ],
    );
  }
}