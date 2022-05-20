import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:laptrinhdidong/Firebase/firebase_data.dart';

class PageSinhViens extends StatefulWidget {
  const PageSinhViens({Key? key}) : super(key: key);

  @override
  State<PageSinhViens> createState() => _PageSinhViensState();
}

class _PageSinhViensState extends State<PageSinhViens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Firebase"),
      ),
      body: StreamBuilder<List<SinhVienSnapshot>>(
        stream: SinhVienSnapshot.getAllSinhVien(),
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
                  itemBuilder: (context, index) => Slidable(
                    child: ListTile(
                      leading: Text("${snapshot.data![index].sinhVien!.id}"),
                      title: Text("${snapshot.data![index].sinhVien!.ten}"),
                      subtitle: Text("${snapshot.data![index].sinhVien!.lop}"),
                    ),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [],
                    ),
                    endActionPane:ActionPane(
                      motion: ScrollMotion(),
                      children: [],
                    ) ,
                  ),
                  separatorBuilder: (context,index)=>const Divider(thickness: 1,),
                  itemCount: snapshot.data!.length,
                );
            }
        },
      ),
    );
  }
}
