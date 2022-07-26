import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn/Manager/create_room_page.dart';
import 'package:learn/Manager/manager_home.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDcsm0hKbsZmEqtnFqA_uNrsTn0YoioQaU',
    appId: 'com.example.learn',
    messagingSenderId:
        '933700698852-gcueg7pfbo64lm62je7hgr9e0hibdsho.apps.googleusercontent.com',
    projectId: 'seproj-65641',
  ));
  runApp(MaterialApp(
    home: CreateRoomPage(),
    debugShowCheckedModeBanner: false,
  ));
}
