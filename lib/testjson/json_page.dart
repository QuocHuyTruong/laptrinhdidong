import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'json_item.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  void initState() {
    super.initState();
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
      appBar: AppBar(
        title: Text("kh co gi"),
        actions: [
          IconButton(
            onPressed: () {
              Favorite favorite = Favorite(id: 2,title: "2",url: "3");
              FavoriteSnapshot.addNew(favorite).whenComplete(() => print("kh co gi ca"));
            },
            icon: Icon(Icons.add_circle_outline, color: Colors.white,),
          )
        ],
      ),
      body:  StreamBuilder<List<FavoriteSnapshot>>(
        stream: FavoriteSnapshot.getAllFavorite(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            print(snapshot.error);
            return Center(
              child: Text("Loi xay ra khi truy van"),
            );
          }else
          if(!snapshot.hasData)
            return Center(
              child: Text("Dang tai du lieu"),
            );
          else{
            print(snapshot.data!.length);
            return
              ListView.separated(
                itemBuilder: (context, index){
                  return Slidable(
                    child: ListTile(
                      leading: Text("${snapshot.data![index].favorite!.id}"),
                      title: Text("${snapshot.data![index].favorite!.title}"),
                      subtitle: Text("${snapshot.data![index].favorite!.url}"),
                    ),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [],
                    ),
                    endActionPane:ActionPane(
                      motion: ScrollMotion(),
                      children: [],
                    ) ,
                  );
                },
                separatorBuilder: (context,index)=>const Divider(thickness: 1,),
                itemCount: snapshot.data!.length,
              );
          }
        },
      ),
    );
  }
}
