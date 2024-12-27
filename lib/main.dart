import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:igsce_cs/pages/quiz_type.dart';
import 'package:flutter/services.dart' show rootBundle;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Splash Screen Demo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationMainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // background color
        child: Center(
          child: SpinKitFadingCircle(
            color: Colors.white, // color of the spin kit
            size: 50.0, // size of the spin kit
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: Text('Welcome to the home page'),
//       ),
//     );
//   }
// }


class BottomNavigationMainScreen extends StatefulWidget{
  const BottomNavigationMainScreen({super.key});

  @override
  State<BottomNavigationMainScreen> createState() => _BottomNavigationMainScreenState();
}

class _BottomNavigationMainScreenState extends State<BottomNavigationMainScreen> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    StudyPage(),
    QuizPage(),
    ProgressPage(),
    GlossaryPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Study',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Glossary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      )
    );
  }
}

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
    final String response = await rootBundle.loadString('assets/topics.txt');
    final List<String> loadedTopics = response.split('\n').map((topic) => topic.trim()).toList();
    setState(() {
      topics = loadedTopics;
    });
  }

  @override
  Widget build(BuildContext build){
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Page'),
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

class TopicDetailPage extends StatelessWidget {
  final String topic;

  const TopicDetailPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction to $topic',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text('This is the introduction to $topic. It is a very important topic that you need to understand.',
            style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Image.network('https://via.placeholder.com/200'),
            SizedBox(height: 16.0),
            Text('This is a sample image'),
            // More text and images can come here...
          ],
        ),
      )
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

