import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:provider/provider.dart';
import '../Models/History_item.dart';
import '../Widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lịch sử xem"),
        actions: [
          IconButton(
              onPressed: () {
                History history = new History(key: "truong quoc huy", id: 2904, title: "huy quoc truong");
                context.read<QLHistory>().writeHistory(history);
              },
              icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<QLHistory>(
        builder: (context, data,child){
          if(data.list.isEmpty){
            return Center(child: Text("Không có dữ liệu"));
          }else {
            return
              ListView.separated(
                itemCount: data.list.length,
                separatorBuilder: (context, index)=>Divider(thickness: 1,),
                itemBuilder: (context, index)=>Slidable(
                  child: ListTile(
                    title: getImageDetail(data.list[index].key),
                    trailing: Text(data.list[index].title),
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          context.read<QLHistory>().deleteHistory(index);
                        },
                        backgroundColor: Colors.red.shade300,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Xóa',
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      )
    );
  }
}
