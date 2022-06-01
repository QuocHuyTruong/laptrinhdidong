
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/Item_movie.dart';

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
      // appBar: AppBar(
      //   title: const Text("Phim mới nhất"),
      // ),
      body: Container(
        color: Color.fromRGBO(48,48,48, 1),
        child: FutureBuilder<Item_movie>(
          future: movie,
          builder: (context, snapshot){
            if(snapshot.hasError) {
              print("Error" + movie.toString());
              return Text("Error");
            }
            return snapshot.hasData
                ? Container(
              child: GridView.count(
                  crossAxisCount: 3,

                  children: List.generate(snapshot.data!.results.length, (index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: getImage(snapshot.data!.results[index].poster_path),
                          ),
                        ),
                        Text(snapshot.data!.results[index].title ?? "",),
                        Row(
                          children: [
                            const Text("Đánh giá:",),
                            Text(snapshot.data!.results[index].vote_average.toString(),),
                            Icon(Icons.star, color: Colors.amberAccent,),
                          ],
                        ),
                      ],
                    );
                  }
                  )
              ),
            )
                : Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}


