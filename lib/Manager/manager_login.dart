import 'package:flutter/material.dart';
import 'manager_home.dart';

class ManagerLogin extends StatefulWidget {
  const ManagerLogin({Key? key}) : super(key: key);
  static const String managerID = '01234';
  @override
  State<ManagerLogin> createState() => _ManagerLoginState();
}

class _ManagerLoginState extends State<ManagerLogin> {
  final IdController = TextEditingController();
  var info = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manager Login'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: IdController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.admin_panel_settings_outlined),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Manager Identification Code',
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
              onPressed: () {
                if (IdController.text != ManagerLogin.managerID) {
                  info = 'Wrong Identification Code';
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => ManagerHome()));
                }
              },
              child: Text('Log In'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(info),
          ),
        ],
      ),
    );
  }
}
