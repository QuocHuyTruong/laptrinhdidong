import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/Item_movie.dart';
import 'package:laptrinhdidong/Group/MovieList.dart';

import 'Movie_data.dart';
import 'Movie_detail.dart';

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
        title: const Text("ahihi"),
      ),
      body: Container(
        color: Colors.black54,
        child: FutureBuilder<Item_movie>(
          future: movie,
          builder: (context, snapshot){
            if(snapshot.hasError) {
              print("Error" + movie.toString());
              return Text("Error");
            }
            return snapshot.hasData
                ? Container(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Route route = MaterialPageRoute(builder: (context) => Moviedetail(id: snapshot.data!.results[index].id,anh: snapshot.data!.results[index].backdrop_path,));
                            Navigator.push(context, route);
                          },
                          child: Container(
                            height: 550,
                            width: 500,
                            child: _getImage(snapshot.data!.results[index].poster_path),
                          ),
                        ),
                        Text(snapshot.data?.results[index].title ?? "", style: TextStyle(fontSize: 24, color: Colors.white70),),
                        Row(
                          children: [
                            Text("Dang gia:"),
                            Text(snapshot.data!.results[index].vote_average.toString(), style: TextStyle(fontSize: 15),),
                            Icon(Icons.star, color: Colors.amberAccent,),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index)=>Divider(thickness: 2,),
                itemCount: snapshot.data!.results.length,
              ),
            )
                : Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}

Widget _getImage(String? url){
  if (url!= null)
    return Image.network("https://image.tmdb.org/t/p/original/$url",fit: BoxFit.fill,);
  else
    return Center(
      child: Icon(Icons.image),
    );
}

// class Movie_hepper{
//   static String datafetch = 'photos';
//   static Future<List<Photo>> readPhoto() async{
//     List data =await fetchData(datafetch);
//     return data.map((item) => Photo.fromJson(item)).toList();
//   }
// }