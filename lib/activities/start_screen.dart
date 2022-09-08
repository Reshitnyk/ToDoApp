import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Welcome to APP',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      //
      //
      body: Container(
          child: Row(children: [
        //
        SizedBox(
          width: 100,
        ),
        //
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Start screen',
              style: TextStyle(
                  color: Colors.white, fontSize: 40, fontFamily: 'Pacifico'),
            ),
            Container(
              color: Colors.deepPurple,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/second_page');
                  },
                  child: Text('Розпочати')),
            )
          ],
        ),
        //
        SizedBox(
          width: 0,
        ),
      ])),
    );
  }
}
