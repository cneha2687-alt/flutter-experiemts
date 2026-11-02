import 'package:flutter/material.dart';
import 'loginscreen.dart';

class TabViewExample extends StatefulWidget {
  const TabViewExample({super.key});

  @override
  State<TabViewExample> createState() => _TabViewExampleState();
}

class _TabViewExampleState extends State<TabViewExample> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs:[
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),

               Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),

               Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              ),
            ] 
            ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: LoginScreen(),
            ),

             Center(
              child: Text('Search'),
            ),

             Center(
              child: Text('Profile'),
            ),

          ]
          ),
          
      ),
    );
  }
}