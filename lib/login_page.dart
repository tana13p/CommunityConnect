// // import 'package:flutter/material.dart';
// // import 'mainpage.dart'; // Import the main page
// // import 'signup.dart'; // Import the sign-up page
// // import 'forgotpassword.dart'; // Import the forgot password page

// // class LoginPage extends StatelessWidget {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Login'),
// //         centerTitle: true, // Center the title
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text(
// //               'Welcome back!',
// //               style: TextStyle(fontSize: 20),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               'Login',
// //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 20),
// //             TextFormField(
// //               controller: emailController,
// //               decoration: InputDecoration(
// //                 labelText: 'Username',
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             TextFormField(
// //               controller: passwordController,
// //               decoration: InputDecoration(
// //                 labelText: 'Password',
// //               ),
// //               obscureText: true,
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Validate if both fields are not empty
// //                 if (emailController.text.isEmpty || passwordController.text.isEmpty) {
// //                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                     content: Text('Please enter both username and password'),
// //                   ));
// //                 } else {
// //                   // Navigate to main page
// //                   Navigator.pushReplacement(
// //                     context,
// //                     MaterialPageRoute(builder: (context) => MainPage()),
// //                   );
// //                 }
// //               },
// //               child: Text('Login'),
// //             ),
// //             SizedBox(height: 10),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: <Widget>[
// //                 TextButton(
// //                   onPressed: () {
// //                     // Navigate to forgot password page
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
// //                     );
// //                   },
// //                   child: Text('Forgot Password?'),
// //                 ),
// //                 TextButton(
// //                   onPressed: () {
// //                     // Navigate to sign-up page
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => SignUpPage()),
// //                     );
// //                   },
// //                   child: Text('Sign Up'),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:cc1/homepage.dart';
// import 'package:cc1/mainpage.dart';
// import 'package:cc1/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';


// class LoginPage extends StatefulWidget {
//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   final _auth = FirebaseAuth.instance;
//   bool showProgress = false;
//   late String email, password;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Firebase Authentication"),
//       ),
//       body: Center(
//         child: ModalProgressHUD(
//           inAsyncCall: showProgress,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 "Login Page",
//                 style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   email = value; // get value from TextField
//                 },
//                 decoration: InputDecoration(
//                     hintText: "Enter your Email",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(32.0)))),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               TextField(
//                 obscureText: true,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   password = value; //get value from textField
//                 },
//                 decoration: InputDecoration(
//                     hintText: "Enter your Password",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(32.0)))),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Material(
//                 elevation: 5,
//                 color: Colors.lightBlue,
//                 borderRadius: BorderRadius.circular(32.0),
//                 child: MaterialButton(
//                   onPressed: () async {
//                     setState(() {
//                       showProgress = true;
//                     });

//                     try {
//                       final newUser = await _auth.signInWithEmailAndPassword(
//                           email: email, password: password);

//                       print(newUser.toString());

//                       if (newUser != null) {
//                         Fluttertoast.showToast(
//                             msg: "Login Successfull",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.blueAccent,
//                             textColor: Colors.white, 
//                             fontSize: 16.0);
                        
//                         setState(() {
//                           showProgress = false;
//                         });

//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => MainPage(),
//                           ),
//                         );
//                       }
//                     } catch (e) {}
//                   },
//                   minWidth: 200.0,
//                   height: 45.0,
//                   child: Text(
//                     "Login",
//                     style:
//                         TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignUpPage()), // Navigate to SignUpPage()
//                   );
//                 },
//                 child: Text(
//                   'Don\'t have an account? Sign up',
//                   style: TextStyle(
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'forgotpassword.dart'; // Import the forgot password page
import 'signup.dart'; // Import the sign-up page
import 'mainpage.dart'; // Import the main page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Authentication"),
      ),
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login Page",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value; // get value from TextField
                },
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value; //get value from textField
                },
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 5,
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () async {
                    setState(() {
                      showProgress = true;
                    });

                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      print(newUser.toString());

                      if (newUser != null) {
                        Fluttertoast.showToast(
                            msg: "Login Successfull",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueAccent,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        setState(() {
                          showProgress = false;
                        });

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                      }
                    } catch (e) {}
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Login",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage()),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
