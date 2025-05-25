import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srock_music/models/repo/card_repo.dart';
import 'package:srock_music/viewmodels/home_viewmodel.dart';
import 'package:srock_music/viewmodels/navbar_viewmodel.dart';
import 'package:srock_music/views/screen/home_screen.dart';
import 'package:srock_music/views/widget/bottom_navbar_widget.dart';

void main() async {
  //Firebase Initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Run App with Provider
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel(CardRepository())),
        ChangeNotifierProvider(create: (_) => BottomNavViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(
        child: Text('Search Page',
            style: TextStyle(fontSize: 30, color: Colors.white))),
    const Center(
        child: Text('TrackBox Page',
            style: TextStyle(fontSize: 30, color: Colors.white))),
    const Center(
        child: Text('Project Page',
            style: TextStyle(fontSize: 30, color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    //Get Current Navbar Index
    final currentIndex = context.watch<BottomNavViewModel>().currentIndex;

    return MaterialApp(
      title: 'S.Rock Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF18171c),
        body: _pages[currentIndex],
        bottomNavigationBar: BottomNavBar(
          items: [
            NavItem(icon: 'assets/home_navbar.png', label: 'Home'),
            NavItem(icon: 'assets/news_navbar.png', label: 'News'),
            NavItem(icon: 'assets/trackbox_navbar.png', label: 'TrackBox'),
            NavItem(icon: 'assets/projects_navbar.png', label: 'Projects'),
          ],
        ),
      ),
    );
  }
}
