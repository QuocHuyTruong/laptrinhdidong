



import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/History/History_data.dart';
import 'package:laptrinhdidong/Group/Models/Item_movie_detail.dart';
import 'package:provider/provider.dart';
import 'Models/Favorite_item.dart';
import 'Models/History_item.dart';
import 'Models/Item_movie.dart';
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
  var index;
  _MoviedetailState(this.id, this.datamovie);

  @override
  void initState() {
    super.initState();
    favorite = false;
    data = fetchMovieDetail(id);
    FavoriteSnapshot.getAllFavorite().forEach((element) {
      for(int i = 0 ;i<element.length;i++){
        if(element[i].favorite!.id == id){
          setState((){
            favorite = true;
          });
        }
      }
    });
    write();
  }

void write()async{
    var list = await readJsonFile();
    list.forEach((element) async {
      if(element.id != id){
        await writeJsonFile(id, datamovie.backdrop_path.toString(), datamovie.title.toString());
      }
    });
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
                      background: getImageDetail(datamovie.backdrop_path)),
                ),
              ];
            },
            body: Container(
                    color: Color.fromRGBO(244, 244, 244, 1),
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
                                    color: Colors.black45
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
                                        color: Colors.black45
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                                  ),
                                  Text(
                                    datamovie.release_date.toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black45
                                    ),
                                  ),
                                  StreamBuilder<List<FavoriteSnapshot>>(
                                    stream: FavoriteSnapshot.getAllFavorite(),
                                    builder: (context,snapshot){
                                      for(int i = 0;i<snapshot.data!.length;i++){
                                        if(snapshot.data![i].favorite!.id == id){
                                          index = i;
                                        }
                                      }
                                      return
                                        IconButton(
                                          icon: Icon(favorite ? Icons.star : Icons.star_border),
                                          color: Colors.brown,
                                          onPressed: (){
                                            if(favorite == true){
                                              snapshot.data![index].delete();
                                                favorite = false;
                                            }
                                            else{
                                              Favorite fv = new Favorite(id: id,title: datamovie.title,url: datamovie.backdrop_path);
                                              FavoriteSnapshot.addNew(fv);
                                                favorite = true;
                                            }
                                          },
                                        );
                                    },
                                  )
                                ],
                              ),
                              Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                              Text(datamovie.overview.toString(),style: TextStyle(color: Colors.black45,fontSize: 15),),
                              Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                              Text(
                                "Trailer",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45
                                ),
                              ),
                              Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                              FutureBuilder<Item_detail>(
                                future: data,
                                builder: (context, snapshottrailer){
                                  if(snapshottrailer.hasError) {
                                    return Text("Error");
                                  }
                                  return snapshottrailer.hasData
                                      ? Container(
                                    child: trailerLayout(snapshottrailer.data,context),
                                  )
                                      : Center(child: CircularProgressIndicator(),);
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }
}



