
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/Models/Item_movie.dart';
import 'package:laptrinhdidong/Group/Models/Sao_item.dart';
import 'Movie_data.dart';
import 'Widget.dart';

class MoviePageTrailer extends StatefulWidget {
  const MoviePageTrailer({Key? key}) : super(key: key);

  @override
  State<MoviePageTrailer> createState() => _MoviePageTrailerState();
}

class _MoviePageTrailerState extends State<MoviePageTrailer> with SingleTickerProviderStateMixin{
  late Future<Item_movie> movie;
  late Future<Item_movie> cartoon;
  late Future<Item_movie> horror;
  late Future<Item_movie> romance;
  late Future<Item_movie> comedy;
  late TabController _tabController;
  late List<Item_movie> list;
  @override
  void initState(){
    super.initState();
    movie = fetchMovieList();
    cartoon = fetchSearchMovie("cartoon");
    horror = fetchSearchMovie("horror");
    romance = fetchSearchMovie("romance");
    comedy = fetchSearchMovie("comedy");
    _tabController = TabController(length: 4,vsync: this);

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu,color: Colors.black45,),
        backgroundColor: Colors.transparent,
        title: Text("MOVIE APP",
        style: Theme.of(context).textTheme.caption?.copyWith(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://img.freepik.com/free-vector/click-movie-logo-vector_18099-258.jpg?w=740'),
            ),
          ),
        ],
      ),
      body: Container(
        color: Color.fromRGBO(244, 244, 244, 1),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: FutureBuilder<Item_movie>(
          future: movie,
          builder: (context, snapshot){
            if(snapshot.hasError) {
              print("Error" + movie.toString());
              return Text("Error");
            }
            return snapshot.hasData
                ? Column(
                  children: [
                    Container(
                      child: CarouselSlider.builder(
                        itemCount: 5,
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (context,index,realIndex){
                          final image = snapshot.data!.results[index].poster_path;
                          final title = snapshot.data!.results[index].title;
                          return buildImageslider(image!,title!,index);
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: ListView(
                            children: [
                              Container(
                                child:Align(
                                  alignment:Alignment.centerLeft,
                                  child: TabBar(
                                    isScrollable: true,
                                    controller: _tabController,
                                    labelColor: Colors.black,
                                    labelStyle: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold
                                    ),
                                    tabs: [
                                      Tab(text: "Hoạt Hình",),
                                      Tab(text: "Kinh dị",),
                                      Tab(text: "Tình cảm",),
                                      Tab(text: "Hài",),
                                    ],
                                  ),
                                ) ,
                              ),
                              SizedBox(height: 5,),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                width: double.maxFinite,
                                height: 273,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    FutureBuilder(
                                      future: cartoon,
                                        builder: (_,moviecartoon){
                                          return moviecartoon.hasData ?
                                           ListView.builder(
                                              itemCount: 10,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (_,index){
                                                return Container(
                                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                    width: 150,
                                                    child: cardMovie(context,moviecartoon,index)
                                                );
                                              }
                                          ) :
                                          Center(child: CircularProgressIndicator(),);
                                        }
                                    ),
                                    FutureBuilder(
                                        future: horror,
                                        builder: (_,moviehorror){
                                          return moviehorror.hasData ?
                                          ListView.builder(
                                              itemCount: 10,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (_,index){
                                                return Container(
                                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                    width: 150,
                                                    child: cardMovie(context,moviehorror,index)
                                                );
                                              }
                                          ) :
                                          Center(child: CircularProgressIndicator(),);
                                        }
                                    ),
                                    FutureBuilder(
                                        future: romance,
                                        builder: (_,movieromance){
                                          return movieromance.hasData ?
                                          ListView.builder(
                                              itemCount: 10,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (_,index){
                                                return Container(
                                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                    width: 150,
                                                    child: cardMovie(context,movieromance,index)
                                                );
                                              }
                                          ) :
                                          Center(child: CircularProgressIndicator(),);
                                        }
                                    ),
                                    FutureBuilder(
                                        future: comedy,
                                        builder: (_,moviecomedy){
                                          return moviecomedy.hasData ?
                                          ListView.builder(
                                              itemCount: 10,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (_,index){
                                                return Container(
                                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                    width: 150,
                                                    child:cardMovie(context,moviecomedy,index)
                                                );
                                              }
                                          ) :
                                          Center(child: CircularProgressIndicator(),);
                                        }
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Sao hoolywood'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'muli',
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                width: double.maxFinite,
                                height: 100,
                                child: ListView.builder(
                                    itemCount: listSao.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_,index){
                                      return Container(
                                          padding:EdgeInsets.fromLTRB(3, 0, 3, 0) ,
                                          child: cardSao(context,index)
                                      );
                                    }
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'Phim hot'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'muli',
                                ),
                              ),
                              Column(
                                children: [
                                  for(int i =0; i<snapshot.data!.results.length;i=i+3)
                                    movilayout(context,snapshot,i)
                                ],
                              ),
                            ],
                          ),
                        ),
                    ),
                  ],
                )
                : Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }

  Widget buildImageslider(String image,String title, int index) => Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              alignment: Alignment.center,
              child: Image.network("https://image.tmdb.org/t/p/original/$image",fit: BoxFit.cover,width: 500,)
          ),
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child: Text(title,style: Theme.of(context).textTheme.headline6!.apply(color: Colors.white),)
        ),
      ],
    ),
  );
}




