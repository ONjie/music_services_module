import 'package:flutter/material.dart';

import 'home_screen.dart';

class MusicServiceScreen extends StatefulWidget {
  const MusicServiceScreen({super.key});

  @override
  State<MusicServiceScreen> createState() => _MusicServiceScreenState();
}

class _MusicServiceScreenState extends State<MusicServiceScreen> {
  late int currentIndex = 0;
  final screens = [HomeScreen()];
  late Widget currentScreen;

  @override
  void initState() {
    currentScreen = screens[currentIndex];
    super.initState();
  }

  void changeScreen({required int selectedIndex}) {
    setState(() {
      currentIndex = selectedIndex;
      currentScreen = screens[currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: currentScreen,
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 10,
      selectedItemColor: Colors.white,
      unselectedItemColor: Theme.of(context).colorScheme.tertiary,
      items: [
         BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/news_icon.png')),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/trackbox_icon.png')),
          label: 'Tracks',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icons/projects_icon.png')),
          label: 'Projects',
        ),
      ],
    );
  }
}
