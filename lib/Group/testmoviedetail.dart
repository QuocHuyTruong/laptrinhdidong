


import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Firebase/diaglog.dart';
import 'package:laptrinhdidong/Group/Item_movie_detail.dart';
import 'package:laptrinhdidong/testjson/json_item.dart';
import '../testjson/json_item.dart';
import 'Item_movie.dart';
import 'Movie_data.dart';
import 'Widget.dart';

class Moviedetail extends StatefulWidget {
  final dataphim;
  final id;
  const Moviedetail({this.id, this.dataphim});

  @override
  createState() => _MoviedetailState(this.id,this.dataphim);
}

class _MoviedetailState extends State<Moviedetail> {
  Result datamovie;
  int id;
  var data;
  var favorite;
  _MoviedetailState(this.id, this.datamovie);

  @override
  void initState() {
    super.initState();
    data = fetchMovieDetail(id);

  }

  void setfavorite(){
    _kt();
    print("nhan lan n");
    setState((){
      favorite = !favorite;
    });
  }

  _kt(){
    if(favorite == false){
      Favorite fa =Favorite(id: id,title: datamovie.title,url: datamovie.backdrop_path);
      FavoriteSnapshot.addNew(fa).whenComplete((){
        showSnackBar(context, "da them yeu thich", 5);
      });
    }else if(favorite == true){
      print("xoa ne");
      FavoriteSnapshot.getAllFavorite().forEach((element) {
        print(element[0].favorite!.id.toString() + "day la test");
        print(element.length.toString() + "day la test");
        for(int i = 0; i<element.length;i++){
          if(element[i].favorite!.id ==id){
            element[i].delete().whenComplete((){
              showSnackBar(context, "da xoa yeu thich", 5);
            });
          }
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 600.0,
                  floating: false,
                  pinned: true,
                  elevation: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                      background: getImage(datamovie.backdrop_path)),
                ),
              ];
            },
            body: Container(
              color: Color.fromRGBO(48,48,48, 1),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(margin: EdgeInsets.only(top: 5.0)),
                        Text(
                          datamovie.title.toString(),
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 1.0, right: 1.0),
                            ),
                            Text(
                              datamovie.vote_average.toString(),
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                            ),
                            Text(
                              datamovie.release_date.toString(),
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white
                              ),
                            ),
                            IconButton(
                              icon: Icon(favorite ? Icons.star : Icons.star_border),
                              color: Colors.brown,
                              onPressed: setfavorite,
                            ),
                          ],
                        ),
                        Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                        Text(datamovie.overview.toString(),style: TextStyle(color: Colors.white,fontSize: 15),),
                        Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                        Text(
                          "Trailer",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                        FutureBuilder<Item_detail>(
                          future: data,
                          builder: (context, snapshot){
                            if(snapshot.hasError) {
                              return Text("Error");
                            }
                            return snapshot.hasData
                                ? Container(
                              child: trailerLayout(snapshot.data,context),
                            )
                                : Center(child: CircularProgressIndicator(),);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}



