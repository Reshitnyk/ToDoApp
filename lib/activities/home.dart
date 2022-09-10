import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _userChoice = '';
  List listOfTargets = [];

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: Text(
            'Ще один екран',
            style: TextStyle(fontFamily: 'Pacifico'),
          )),
          body: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: Text('На головну'),
              ),
              SizedBox(
                width: 5,
                height: 5,
              ),
              Text('третій елемент строки'),
              Column(
                children: [Text('Четвертий елемент ')],
              ),
            ],
          ));
    }));
  }

  @override
  void initState() {
    super.initState();
    listOfTargets.addAll([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      //
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Список справ:',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: _menuOpen,
          )
        ],
      ),
      //
      body: ListView.builder(
          itemCount: listOfTargets.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(listOfTargets[index]),
              child: Card(
                child: ListTile(
                  title: Text(listOfTargets[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_sweep_outlined,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () {
                      setState(() {
                        listOfTargets.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                // if (direction==DismissDirection.endToStart)
                setState(() {
                  listOfTargets.removeAt(index);
                });
              },
            );
          }),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(
                    'Що будемо робити?',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                    ),
                  ),
                  content: TextField(
                    onChanged: (String value) {
                      _userChoice = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent),
                        onPressed: () {
                          setState(() {
                            listOfTargets.add(_userChoice);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Запамятайка'))
                  ],
                );
              });
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
