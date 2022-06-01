import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../testjson/json_page.dart';
import 'Movie_page.dart';
import 'Movie_search_app.dart';




class Movie extends StatefulWidget {

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  int _currentIndex = 0;
  final _widgetOptions = [
    MoviePageTrailer(),
    SearchMovie(),
    Test(),
  ];


  @override
  void initState() {
    super.initState();
    _khoiTaoFirebase();
  }

  _khoiTaoFirebase()async{
    try{
      // await Firebase.initializeApp();
      await Firebase.initializeApp();
    }catch(e){
      print("ket noi that bai");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.article_outlined),
            title: Text('Mới nhất'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('Tìm kiếm'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.star),
            title: Text('Yêu thích'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}