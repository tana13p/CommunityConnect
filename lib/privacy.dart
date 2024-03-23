import 'package:flutter/material.dart';

void main() {
  runApp(PrivacyPage());
}

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool _accountPrivacy = false;
  bool _comments = false;
  bool _events = false;
  bool _messages = false;
  String _selectedUser = '';

  List<String> _users = [
    'Mark Wallace',
    'Amrut Kare',
    'Susan Dsouza',
    'Joseph Watt',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Privacy'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Privacy',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: Text('Private Account'),
                value: _accountPrivacy,
                onChanged: (value) {
                  setState(() {
                    _accountPrivacy = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Interactions',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              _buildSwitchTile('Comments', _comments, (value) {
                setState(() {
                  _comments = value;
                });
              }),
              _buildSwitchTile('Events', _events, (value) {
                setState(() {
                  _events = value;
                });
              }),
              _buildSwitchTile('Messages', _messages, (value) {
                setState(() {
                  _messages = value;
                });
              }),
              SizedBox(height: 16.0),
              Text(
                'Block User',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                value: _selectedUser.isNotEmpty ? _selectedUser : null,
                hint: Text('Select User to Block'),
                onChanged: (value) {
                  setState(() {
                    _selectedUser = value!;
                  });
                },
                items: _users.map((user) {
                  return DropdownMenuItem<String>(
                    value: user,
                    child: Text(user),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}