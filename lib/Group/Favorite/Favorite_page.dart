import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Models/Favorite_item.dart';

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
      backgroundColor: Color.fromRGBO(233, 233 , 233, 1),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Phim yêu thích".toUpperCase(),
            style: Theme.of(context).textTheme.caption?.copyWith(
              color: Colors.black45,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),),
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
                    endActionPane:ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            snapshot.data![index].delete();
                          },
                          backgroundColor: Colors.red.shade300,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Xóa',
                        ),
                      ],
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
