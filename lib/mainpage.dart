// import 'package:cc1/create_event.dart';
// import 'package:cc1/discussion_forum.dart';
// import 'package:cc1/invite_guests.dart';
// import 'package:cc1/settings.dart';
// import 'package:cc1/share_event.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// // Custom Widget for Event
// class EventWidget extends StatefulWidget {
//   final String name;
//   final String imagePath;
//   final int likes;
//   final int comments;
//   final int dislikes;
//   final String eventId;

//   EventWidget({
//     required this.name,
//     required this.imagePath,
//     required this.likes,
//     required this.comments,
//     required this.dislikes,
//     required this.eventId,
//   });

//   @override
//   _EventWidgetState createState() => _EventWidgetState();
// }

// class _EventWidgetState extends State<EventWidget> {
//   int _likes = 0;
//   int _comments = 0;
//   int _dislikes = 0;

//   @override
//   void initState() {
//     super.initState();
//     _likes = widget.likes;
//     _comments = widget.comments;
//     _dislikes = widget.dislikes;
//   }

//   Future<void> _updateEventDetails() async {
//     await FirebaseFirestore.instance.collection('events').doc(widget.eventId).update({
//       'likes': _likes,
//       'comments': _comments,
//       'dislikes': _dislikes,
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Image.network(widget.imagePath),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.name,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.thumb_up),
//                 onPressed: () {
//                   setState(() {
//                     _likes++;
//                   });
//                   _updateEventDetails();
//                 },
//               ),
//               Text(_likes.toString()),
//               IconButton(
//                 icon: Icon(Icons.comment),
//                 onPressed: () {
//                   setState(() {
//                     _comments++;
//                   });
//                   _updateEventDetails();
//                 },
//               ),
//               Text(_comments.toString()),
//               IconButton(
//                 icon: Icon(Icons.thumb_down),
//                 onPressed: () {
//                   setState(() {
//                     _dislikes++;
//                   });
//                   _updateEventDetails();
//                 },
//               ),
//               Text(_dislikes.toString()),
//               IconButton(
//                 icon: Icon(Icons.share),
//                 onPressed: () {
//                   // Handle share functionality
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ShareEventPage()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Query query = FirebaseFirestore.instance.collection('events');
//     print(query);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Community Connect'),
//       ),
//       body: FutureBuilder<QuerySnapshot>(
//         future: query.get(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("Something went wrong");
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             return ListView(
//               children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                 Map<String, dynamic> data =
//                     document.data() as Map<String, dynamic>;
//                     print(data);
//                  if (data != null) {
//                   // Check if the fields are not null before accessing them
//                   return EventWidget(
//                     name: data['name'] ?? '', // Use empty string as fallback if name is null
//                     imagePath: data['imageUrl'] ?? '', // Use empty string as fallback if imagePath is null
//                     likes: data['likes'] ?? 0, // Use 0 as fallback if likes is null
//                     comments: data['comments'] ?? 0, // Use 0 as fallback if comments is null
//                     dislikes: data['dislikes'] ?? 0,
//                     eventId: data['eventId'], // Use 0 as fallback if dislikes is null
//                   );
//                 } else {
//                   // Handle case where data is null
//                   return SizedBox(); // Placeholder widget or empty container
//                 }
//               }).toList(),
//             );
//           }

//           return CircularProgressIndicator();
//         },
//       ),
//       // bottomNavigationBar remains the same
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: Icon(Icons.home),
//               onPressed: () {
//                 // Handle navigation to home page
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.group),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => InviteGuestsPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.message),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ChatInterface()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.event),
//               onPressed: () {
//                 // Navigate to EventDetailsPage when clicking on event icon
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EventDetailsPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.person),
//               onPressed: () {
//                 // Handle navigation to profile page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SettingsPage()),
//                 );
//               },
//             ),
            
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:cc1/create_event.dart';
import 'package:cc1/discussion_forum.dart';
import 'package:cc1/invite_guests.dart';
import 'package:cc1/payment.dart';
import 'package:cc1/settings.dart';
import 'package:cc1/share_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Custom Widget for Event
class EventWidget extends StatefulWidget {
  final String name;
  final String imagePath;
  final int likes;
  final int comments;
  final int dislikes;
  final String eventId;

  EventWidget({
    required this.name,
    required this.imagePath,
    required this.likes,
    required this.comments,
    required this.dislikes,
    required this.eventId,
  });

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  int _likes = 0;
  int _comments = 0;
  int _dislikes = 0;

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
    _comments = widget.comments;
    _dislikes = widget.dislikes;
  }

  Future<void> _updateEventDetails() async {
    await FirebaseFirestore.instance.collection('events').doc(widget.eventId).update({
      'likes': _likes,
      'comments': _comments,
      'dislikes': _dislikes,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(widget.imagePath),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  setState(() {
                    _likes++;
                  });
                  _updateEventDetails();
                },
              ),
              Text(_likes.toString()),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  setState(() {
                    _comments++;
                  });
                  _updateEventDetails();
                },
              ),
              Text(_comments.toString()),
              IconButton(
                icon: Icon(Icons.thumb_down),
                onPressed: () {
                  setState(() {
                    _dislikes++;
                  });
                  _updateEventDetails();
                },
              ),
              Text(_dislikes.toString()),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  // Handle share functionality
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShareEventPage()),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to PaymentPage for booking ticket
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },
                child: Text('Book Ticket'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance.collection('events');
    print(query);

    return Scaffold(
      appBar: AppBar(
        title: Text('Community Connect'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: query.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                 if (data != null) {
                  // Check if the fields are not null before accessing them
                  return EventWidget(
                    name: data['name'] ?? '', // Use empty string as fallback if name is null
                    imagePath: data['imageUrl'] ?? '', // Use empty string as fallback if imagePath is null
                    likes: data['likes'] ?? 0, // Use 0 as fallback if likes is null
                    comments: data['comments'] ?? 0, // Use 0 as fallback if comments is null
                    dislikes: data['dislikes'] ?? 0,
                    eventId: data['eventId'], // Use 0 as fallback if dislikes is null
                  );
                } else {
                  // Handle case where data is null
                  return SizedBox(); // Placeholder widget or empty container
                }
              }).toList(),
            );
          }

          return CircularProgressIndicator();
        },
      ),
      // bottomNavigationBar remains the same
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Handle navigation to home page
              },
            ),
            IconButton(
              icon: Icon(Icons.group),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InviteGuestsPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatInterface()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.event),
              onPressed: () {
                // Navigate to EventDetailsPage when clicking on event icon
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventDetailsPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Handle navigation to profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
