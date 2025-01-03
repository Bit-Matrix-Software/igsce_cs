
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'quiz_type.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  _StudyPageState createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  List<String> topics = [];

  @override
  void initState(){
    super.initState();
    loadTopics();
  }

  Future<void> loadTopics() async{
    final String response = await rootBundle.loadString('assets/text_files/topics.txt');
    final List<String> loadedTopics = response.split('\n').map((topic) => topic.trim()).toList();
    setState(() {
      topics = loadedTopics;
    });
  }

  @override
  Widget build(BuildContext build){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Study Page',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),),
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index){
          return Card(
            color: Colors.blue.shade600,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                topics[index],
                style: TextStyle(color: Colors.white)
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicDetailPage(topic: topics[index]),
                  ),
                );
              },
            ),
          );
        }
      ),
    );
  }
}

class TopicDetailPage extends StatefulWidget {
  final String topic;
  const TopicDetailPage({super.key, required this.topic});

  @override
  State<TopicDetailPage> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  String topicContent = '';

  @override
  void initState(){
    super.initState();
    loadTopicContent();
  }

  Future<void> loadTopicContent() async{
    try{
      final String response = await rootBundle.loadString('assets/text_files/${widget.topic.toLowerCase().replaceAll(' ', '_')}.txt');
      setState((){
        topicContent = response;
      });
    }catch(e){
      setState(() {
        topicContent = 'Error loading topic content';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.topic,
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction to ${widget.topic}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              topicContent,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.justify,
            ),
            // Images and more content to be added here
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Quiz Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizType1Page()
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Quiz Type 1',
              style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizType2Page()
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Quiz Type 2',
              style: TextStyle(fontSize: 20)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressPage extends StatelessWidget{
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Progress Page'),
    );
  }
}

class GlossaryPage extends StatelessWidget{
  const GlossaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Glossary Page'),
    );
  }
}

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Page'),
    );
  }
}