
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
      appBar: AppBar(
        title: const Text("Phim mới nhất"),
      ),
      body: Container(
        color: Color.fromRGBO(48, 48, 48, 1),
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
              child: GridView.count(
                childAspectRatio: (1/1.51),
                crossAxisCount: 1,
                children:[
                  ListView(
                    children: [
                      Column(
                        children: [
                          for(int i =0; i<snapshot.data!.results.length;i=i+2)
                            movilayout(context,snapshot,i)
                        ],
                      )
                    ],
                )
                ],
              ),
              //child: buildBurgers(snapshot),
              //child: layouttest(snapshot),
            )
                : Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }





}




