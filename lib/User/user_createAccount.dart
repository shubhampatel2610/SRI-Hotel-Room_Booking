import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCreateAccount extends StatefulWidget {
  const UserCreateAccount({Key? key}) : super(key: key);

  @override
  State<UserCreateAccount> createState() => _UserCreateAccountState();
}

class _UserCreateAccountState extends State<UserCreateAccount> {
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();
  final confirmPassWordController = TextEditingController();
  var info = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: userNameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'username',
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passWordController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'password',
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: confirmPassWordController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'confirm Password',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 40,
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                primary: Colors.black,
              ),
              onPressed: () async {
                String enteredUsername = userNameController.text;
                String eneteredPassWord = passWordController.text;
                String enteredConfirmPassWord = confirmPassWordController.text;

                //SharedPreferences prefs = await SharedPreferences.getInstance();
                DatabaseReference usersRef =
                    FirebaseDatabase.instance.ref().child("users");

                var userSnap = await FirebaseDatabase.instance
                    .ref()
                    .child("users/$enteredUsername")
                    .get();
                if (enteredUsername == '') {
                  setState(() {
                    info = 'Enter Username';
                  });
                } else if (userSnap.exists) {
                  setState(() {
                    info = 'username: $enteredUsername already exists!';
                  });
                } else {
                  //if its new
                  //check for password validity
                  if (eneteredPassWord != enteredConfirmPassWord) {
                    setState(() {
                      info =
                          'Password and confirm Password fields do not match!';
                    });
                  } else {
                    // all ok
                    usersRef.child(enteredUsername).set(eneteredPassWord);
                    setState(() {
                      info = 'Account Created SuccesFully';
                    });
                  }
                }
              },
              child: const Text('Create Account'),
            ),
          ),
          Text(info),
        ],
      ),
    );
  }
}
