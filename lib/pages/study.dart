import 'package:flutter/material.dart';

class StudyPage extends StatelessWidget {
  const StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Topics'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text('Topic 1'),
            children: <Widget>[
              ListTile(title: Text('Subtopic 1.1')),
              ListTile(title: Text('Subtopic 1.2')),
              ListTile(title: Text('Subtopic 1.3')),
            ],
          ),
          ExpansionTile(
            title: Text('Topic 2'),
            children: <Widget>[
              ListTile(title: Text('Subtopic 2.1')),
              ListTile(title: Text('Subtopic 2.2')),
              ListTile(title: Text('Subtopic 2.3')),
            ],
          ),
          ExpansionTile(
            title: Text('Topic 3'),
            children: <Widget>[
              ListTile(title: Text('Subtopic 3.1')),
              ListTile(title: Text('Subtopic 3.2')),
              ListTile(title: Text('Subtopic 3.3')),
            ],
          ),
          // Add more topics as needed
        ],
      ),
    );
  }
}