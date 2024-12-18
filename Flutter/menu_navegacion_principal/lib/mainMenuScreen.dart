import 'package:flutter/material.dart';
import 'package:menu_navegacion_principal/homeScreen.dart';
import 'package:menu_navegacion_principal/moviesScreen.dart';
import 'package:menu_navegacion_principal/seriesScreen.dart';

class MainMenuScreeen extends StatefulWidget {
  const MainMenuScreeen ({super.key});

  @override
  State<MainMenuScreeen> createState() => _MainMenuScreeenState();
}

class _MainMenuScreeenState extends State<MainMenuScreeen> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 255, 135, 163),
        indicatorColor: const Color.fromARGB(255, 255, 255, 255),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.movie),
            label: 'Películas',
          ),
          NavigationDestination(
            icon: Icon(Icons.tv_rounded),
            label: 'Series',
          ),
        ],
      ),
      body: [const HomeScreen(), const MoviesScreen(), const SeriesScreen()][currentPageIndex]
    );
  }
}