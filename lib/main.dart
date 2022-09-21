import 'package:flutter/material.dart';
import 'package:project1/viewscreen/start_screen.dart';

void main(){
  runApp(const Floricap());
}

class Floricap extends StatelessWidget {

  const Floricap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (context) => const StartScreen(),
      },
    ); 
  }


}
