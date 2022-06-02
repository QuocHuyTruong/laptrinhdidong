
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/Item_movie.dart';
import 'package:laptrinhdidong/Group/testmoviedetail.dart';

import 'Movie_data.dart';
import 'Movie_detail.dart';
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
                            movilayout(snapshot,i)
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


  Widget cardMovie(snapshot,i) {
          if(snapshot.data!.results.length>i){
            return
              GestureDetector(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (context) => MoviedetailTest(id: snapshot.data!.results[i].id,dataphim: snapshot.data!.results[i],));
                  Navigator.push(context, route);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    color: Color(0xFF010101),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getImage(snapshot.data!.results[i].poster_path),
                        Text(
                          snapshot.data?.results[i].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Đánh giá:' + snapshot.data!.results[i].vote_average.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }else
            return
                Text("");
  }

  Widget cardMovies(snapshot,i) => Row(
    children: [
      Expanded(child: cardMovie(snapshot,i)),
      const SizedBox(width: 5),
      Expanded(child: cardMovie(snapshot,i+1)),
    ],
  );

  Widget movilayout(snapshot,i){
    return (
        Column(
          children: [
            cardMovies(snapshot,i),
            const SizedBox(height: 5),
          ],
        )
    );

  }

}




