import 'package:flutter/material.dart';
import 'package:video_conference/homepage.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
 const MyApp({super.key});

 
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Video Conference',
      theme: ThemeData(
        useMaterial3: true,
        
      ),
       home: const HomePage()
    );
  }

}