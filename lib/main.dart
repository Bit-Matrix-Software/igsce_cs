import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  PageController _pageController = PageController();

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

class StudyPage extends StatelessWidget {
  const StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> topics = [
      'Data Representation',
      'Data Transmission',
      'Hardware',
      'Software',
      'The Internet',
      'Automated Technologies',
      'Computational Thinking',
      'Algorithms',
      'Programming',
      'Databases',
      'Boolean Logic'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Study Page'),
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(topics[index]),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopicDetailPage(topic: topics[index]),
                ),
              );
            },
          );
        },
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
      body: Center(
        child: Text('Details for $topic'),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Quiz Page'),
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

