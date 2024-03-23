import 'package:flutter/material.dart';

void main() {
  runApp(NotificationsPage());
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _pauseAll = false;
  bool _messages = false;
  bool _reminders = false;
  bool _emails = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notification Settings',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 20),
              _buildNotificationSettingTile(
                'Pause All',
                _pauseAll,
                (value) {
                  setState(() {
                    _pauseAll = value;
                    if (value) {
                      _messages = false;
                      _reminders = false;
                      _emails = false;
                    }
                  });
                },
              ),
              _buildNotificationSettingTile('Messages', _messages, (value) {
                setState(() {
                  _messages = value;
                  if (value) _pauseAll = false;
                });
              }),
              _buildNotificationSettingTile(
                  'Reminders', _reminders, (value) {
                setState(() {
                  _reminders = value;
                  if (value) _pauseAll = false;
                });
              }),
              _buildNotificationSettingTile('Emails', _emails, (value) {
                setState(() {
                  _emails = value;
                  if (value) _pauseAll = false;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSettingTile(
      String title, bool value, Function(bool) onChanged) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}