import 'package:flutter/material.dart';

void main() => runApp(BasicAppBarSample());

class BasicAppBarSample extends StatefulWidget{
  @override
  _BasicAppBarSample createState() => _BasicAppBarSample();
}

class _BasicAppBarSample extends State<BasicAppBarSample>{
  Choice _selectedChoice = choices[0];

  void _select(Choice choice){
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
          backgroundColor: Color.fromARGB(255, 25, 120, 245),
          actions: <Widget>[
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: (){
                _select(choices[0]);
              },
            ),
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: (){
                _select(choices[1]);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChoiceCard(choice: _selectedChoice),
        ),
      ),
    );
  }
}

class Choice {
  const Choice ({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Boat', icon: Icons.directions_boat)
];


class ChoiceCard extends StatelessWidget{
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display3;

    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 256.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}




