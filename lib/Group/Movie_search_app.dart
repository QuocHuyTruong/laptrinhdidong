
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/getMovie.dart';
import 'package:laptrinhdidong/Group/testlayout.dart';

import 'Item_movie.dart';
import 'Movie_data.dart';
import 'Widget.dart';

class SearchMovie extends StatefulWidget {
  const SearchMovie({Key? key,}) : super(key: key);
  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  TextEditingController txtName = TextEditingController();
  var data;


  @override
  void initState() {
    super.initState();
    data = fetchSearchMovie("Batman");
  }

  void _incrementCounter(){
    setState((){

      data = fetchSearchMovie(txtName.text);

    });
  }


  @override
  void dispose() {
    txtName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Tìm kiếm"),
      // ),
            body: Container(
              color: Color.fromRGBO(48,48,48, 1),
              child: ListView(
                children: [
                  TextFormField(
                      controller: txtName,
                      decoration: InputDecoration(
                        labelText: 'Tên phim',
                      ),
                  ),
                  ElevatedButton(
                    onPressed: () => _incrementCounter(),
                    child: Text("Tìm kiếm"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                        FutureBuilder<Item_movie>(
                          future: data,
                          builder: (context, snapshot){
                            if(snapshot.hasError) {
                              return Text("Error");
                            }else if(snapshot.connectionState==ConnectionState.done){
                              return snapshot.hasData ?
                              Container(
                                   child: movieLayout(snapshot.data),
                              )
                                  :
                                Center(child: CircularProgressIndicator(),);
                            }
                            return Center(child: CircularProgressIndicator(),);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
    );
  }
}
