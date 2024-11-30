import 'dart:io';
import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart'; 
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    initAgora();
  }

   final AgoraClient client = AgoraClient( 
  agoraConnectionData: AgoraConnectionData( 
    appId: "4d9d95f94b4a4af79d303d08772ccdfe", 
    channelName: "test", 
    tempToken: "007eJxTYOD61fR5nX2ecnrElj0rjpiYl6fJy9+7voxD99vMK1wv/hkrMJikWKZYmqZZmiSZJJokpplbphgbGKcYWJibGyUnp6Slvgr0Tm8IZGToNktgYIRCEJ+FoSS1uISBAQB/zyAc", 
  ), 
  enabledPermission: [ 
    Permission.camera, 
    Permission.microphone, 
  ], 
); 


void initAgora() async { 
  if (kIsWeb) {
      print("Initializing for Web...");
      // No specific initialization required for Agora Web SDK via agora_uikit
    } else if (Platform.isAndroid || Platform.isIOS) {
      print("Initializing for Mobile...");
      await client.initialize();
    } else {
      print("Unsupported platform");
    } 
}  

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SafeArea( 
        child: Stack( 
          children: [ 
            AgoraVideoViewer(client: client),  
            AgoraVideoButtons(client: client), 
          ], 
        ), 
      ), 
    );
  }
}