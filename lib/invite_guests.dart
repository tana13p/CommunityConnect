import 'package:flutter/material.dart';

class InviteGuestsPage extends StatefulWidget {
  @override
  _InviteGuestsPageState createState() => _InviteGuestsPageState();
}

class _InviteGuestsPageState extends State<InviteGuestsPage> {
  List<String> _allContacts = [
    "Deepak Pal",
    "Sara Smith",
    "Robert Patricia",
    "Kishori",
    "Manish Yadav",
    "Jagdeep Samota",
    "Abhay Saroj",
  ];
  List<String> _selectedContacts = [];
  List<String> _filteredContacts = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredContacts.addAll(_allContacts);
    super.initState();
  }

  @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  _filterContacts(value);
                },
                decoration: InputDecoration(
                  hintText: "Search friends to invite",
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = _filteredContacts[index];
                    return ListTile(
                      title: Text(contact),
                      leading: Checkbox(
                        value: _selectedContacts.contains(contact),
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                _selectedContacts.add(contact);
                              } else {
                                _selectedContacts.remove(contact);
                              }
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle the "Invite" action
                  inviteAllSelectedContacts();
                },
                child: Text("Invite"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void inviteAllSelectedContacts() {
    // Here you can implement the logic to invite all selected contacts
    print("Inviting all selected contacts: $_selectedContacts");
    // Implement your invitation logic here

    // Show pop-up message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Invite Sent Successfully"),
          content: Text("Invitations have been sent successfully to: ${_selectedContacts.join(", ")}"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _filterContacts(String query) {
    _filteredContacts.clear();
    _allContacts.forEach((contact) {
      if (contact.toLowerCase().contains(query.toLowerCase())) {
        _filteredContacts.add(contact);
      }
    });
    setState(() {});
  }
}