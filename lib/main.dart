import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Xylophone",
      home: Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  ///This functions play audios according to the number
  void onPressed(int audioNumber) async {
    ///creating instance everytime for playing audio
    ///as given each audio required new instance in memory to play
    final audio = AudioCache();
    await audio.play("audios/note$audioNumber.wav");
  }

  //this function is redering all buttons on the screen
  List<Widget> buttons(List<Color> buttonColor) {
    // here i created a list of buttons which i later add widget
    List<Widget> buttonsList = [];
    //looping for adding 7 buttons
    for (int i = 0; i < 7; i++) {
      //here i am creating the button
      final button = Expanded(
        child: FlatButton(
          color: buttonColor[i],
          onPressed: () {
            /// name of note is starting from 1 so i add +1 each time which mean
            /// for i = 0 it became 1 and so on
            onPressed(i + 1);
          },
          child: null,
        ),
      );
      //adding the button in the list for each value of i;
      buttonsList.add(button);
    }
    //returning the list of the buttons
    return buttonsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //comment from here to run the next commented line
        children: buttons([
          Colors.red,
          Colors.green,
          Colors.purple,
          Colors.yellow,
          Colors.blue,
          Colors.orange,
          Colors.indigo,
        ]),

        /// you can run this code also but this one is look more messy

        // children: [
        //   ///You can do this thing in a list and loop through it
        //   Expanded(
        //     child: FlatButton(
        //       color: Colors.red,
        //       onPressed: () {
        //         onPressed(1);
        //       },
        //       child: Text(''),
        //     ),
        //   ),
        //   Expanded(
        //     child: FlatButton(
        //       color: Colors.green,
        //       onPressed: () {
        //         onPressed(2);
        //       },
        //       child: Text(''),
        //     ),
        //   ),
        //   Expanded(
        //     child: FlatButton(
        //       color: Colors.yellow,
        //       onPressed: () {
        //         onPressed(3);
        //       },
        //       child: Text(''),
        //     ),
        //   ),
        //   Expanded(
        //     child: FlatButton(
        //       color: Colors.purple,
        //       onPressed: () {
        //         onPressed(4);
        //       },
        //       child: Text(''),
        //     ),
        //   ),
        //   Expanded(
        //     child: FlatButton(
        //       color: Colors.blue,
        //       onPressed: () {
        //         onPressed(5);
        //       },
        //       child: Text(''),
        //     ),
        //   ),
        //   Expanded(
        //     child: FlatButton(
        //       color: Colors.orange,
        //       onPressed: () {
        //         onPressed(6);
        //       },
        //       child: Text(''),
        //     ),
        //   ),
        //   Expanded(
        //     child: FlatButton(
        //       color: Colors.indigo,
        //       onPressed: () {
        //         onPressed(7);
        //       },
        //       child: Text(''),
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
