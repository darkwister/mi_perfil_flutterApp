import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(const MainApp());
}
//Job Jefferson Pérez Cabrera
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  String currentTime = "";
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => updateTime());
  }
  
  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void updateTime(){
    final now = DateTime.now();
    if(now.minute <= 9 && now.second <=9){
      setState(() => currentTime = "${now.hour}:0${now.minute}:0${now.second}");
    }
    else if(now.minute <= 9){
      setState(() => currentTime = "${now.hour}:0${now.minute}:${now.second}");
    }
    else if(now.second <= 9){
      setState(() => currentTime = "${now.hour}:${now.minute}:0${now.second}");   
    }
    else{
      setState(() => currentTime = "${now.hour}:${now.minute}:${now.second}");   
    }
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("MI PERFIL", style: TextStyle(fontSize: 30, color:  Colors.purpleAccent)),
        backgroundColor: const Color.fromRGBO(104, 9, 176, 1.0),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 120, 
            backgroundImage: AssetImage('images/my_photo.jpg'),),
            const Text("Job Jefferson Pérez Cabrera", 
            style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold)),
            Text("La hora actual es $currentTime", style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic, color: Colors.deepPurple),)
          ],
        )
      ));
  }
}
