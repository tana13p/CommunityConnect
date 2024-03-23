import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventDetailsPage(),
    );
  }
}

class EventDetailsPage extends StatefulWidget {
  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _attendeesController = TextEditingController();
  String _imageUrl = "";

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Upload image to Firebase Storage
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('images/$imageName.jpg');
      UploadTask uploadTask = reference.putFile(imageFile);

      // Monitor the upload task
      await uploadTask.whenComplete(() async {
        // Retrieve download URL
        String imageUrl = await reference.getDownloadURL();

        setState(() {
          _imageUrl = pickedFile.path;
        });
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: _getImage,
                child: _imageUrl.isNotEmpty
                    ? Image.file(
                        File(_imageUrl),
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        Icons.add_a_photo,
                        size: 100,
                        color: Colors.grey,
                      ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                decoration:
                    InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _startTimeController,
                decoration: InputDecoration(labelText: 'Start Time'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _endTimeController,
                decoration: InputDecoration(labelText: 'End Time'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Type of Event'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _attendeesController,
                decoration:
                    InputDecoration(labelText: 'Number of Attendees'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // You can access the entered values using the controllers
                  String name = _nameController.text;
                  String location = _locationController.text;
                  String date = _dateController.text;
                  String startTime = _startTimeController.text;
                  String endTime = _endTimeController.text;
                  String type = _typeController.text;
                  int attendees = int.parse(_attendeesController.text);

                  // Save data to Firestore
                  DocumentReference docRef =
                      FirebaseFirestore.instance.collection("events").doc();
                  await docRef.set({
                    'name': name,
                    'location': location,
                    'date': date,
                    'startTime': startTime,
                    'endTime': endTime,
                    'type': type,
                    'attendees': attendees,
                    'imageUrl': _imageUrl,
                    'likes': 0,
                    'comments': 0,
                    'dislikes': 0,
                    'eventId': docRef.id,
                  });

                  // Show success dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text('Event submitted successfully!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Navigate back to MainPage
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _nameController.dispose();
    _locationController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _typeController.dispose();
    _attendeesController.dispose();
    super.dispose();
  }
}
