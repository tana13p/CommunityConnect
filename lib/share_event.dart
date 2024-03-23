import 'package:cc1/mainpage.dart';
import 'package:flutter/material.dart';

class ShareEventPage extends StatefulWidget {
  @override
  _ShareEventPageState createState() => _ShareEventPageState();
}

class _ShareEventPageState extends State<ShareEventPage> {
  List<String> _allContacts = [
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "Emily Davis",
    "Michael Wilson",
    "Emma Taylor",
  ];
  List<String> _filteredContacts = [];
  List<String> _selectedContacts = [];

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
        appBar: AppBar(
          title: Text('Share Event'),
        ),
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
                  hintText: "Search friends to share event",
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
                      trailing: Checkbox(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                  // Handle sharing the event with selected contacts
                  _shareEvent();
                },
                child: Text('Share'),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Handle the action for the single icon
                },
                child: Image.asset(
                  'assets/icons.jpg', // Replace 'assets/single_icon.png' with your image path
                  width: 200, // Adjust the width as needed
                  height: 200, // Adjust the height as needed
                ),
              ),
            ],
          ),
        ),
      ),
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

  void _shareEvent() {
    // Placeholder function for sharing the event
    print('Sharing event with selected contacts: $_selectedContacts');
    // Implement your sharing logic here
  }
}



