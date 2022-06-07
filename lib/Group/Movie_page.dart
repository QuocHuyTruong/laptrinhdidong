
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/Item_movie.dart';
import 'package:laptrinhdidong/Group/Movie_detail.dart';
import 'Movie_data.dart';
import 'Widget.dart';

class MoviePageTrailer extends StatefulWidget {
  const MoviePageTrailer({Key? key}) : super(key: key);

  @override
  State<MoviePageTrailer> createState() => _MoviePageTrailerState();
}

class _MoviePageTrailerState extends State<MoviePageTrailer> {
  late Future<Item_movie> movie;

  @override
  void initState(){
    super.initState();
    movie = fetchMovieList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<Item_movie>(
          future: movie,
          builder: (context, snapshot){
            if(snapshot.hasError) {
              print("Error" + movie.toString());
              return Text("Error");
            }
            return snapshot.hasData
                ? Container(
                    padding: EdgeInsets.all(5),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            for(int i =0; i<snapshot.data!.results.length;i=i+3)
                              movilayout(context,snapshot,i)
                          ],
                        )
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }





}




