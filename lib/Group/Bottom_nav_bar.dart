import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Favorite_page.dart';
import 'Movie_page.dart';
import 'Movie_search_app.dart';




class Movie extends StatefulWidget {

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  int _currentIndex = 1;
  final List<Widget> _pages = <Widget>[];


  @override
  void initState() {
    super.initState();
    _pages.add( SearchMovie());
    _pages.add( MoviePageTrailer());
    _pages.add( Test());
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
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 53.5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.blue,
                iconSize: 20,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Tìm kiếm'),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outlined), label: 'Yêu thích')
                ]
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 1 ? Colors.blue : Colors.blueGrey,
          child: Icon(Icons.home),
          onPressed: () => setState(() {
            _currentIndex = 1;
          }),
        ),
      ),
    );
  }
}
