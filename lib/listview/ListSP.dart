

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:laptrinhdidong/listview/Dialog.dart';
import 'package:provider/provider.dart';



class SanPham{
  late String ten;
  late int gia;
  late String url;
  SanPham({required this.ten,required this.gia,required this.url});
}

class QLSanPham extends ChangeNotifier{
  late List<SanPham> _list =[
    SanPham(ten: "ten1", gia: 12346, url: "url1"),
    SanPham(ten: "ten2", gia: 12346, url: "url2"),
    SanPham(ten: "ten3", gia: 12346, url: "url3"),
  ];

  List<SanPham> get list => _list;

  void xoaSP(int index){
    list.removeAt(index);
    notifyListeners();
  }
  void capnhat(SanPham moi, SanPham cu){
    // cap nhat
    notifyListeners();
  }
  void themmoi(SanPham sanpham){
    list.add(sanpham);
    notifyListeners();
  }
}
QLSanPham sp = QLSanPham();


class ListSP extends StatelessWidget {
  late BuildContext listViewContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách sản phẩm"),
      ),
      body: Consumer<QLSanPham>(
        builder: (context, sp, child){
          listViewContext = context;
          return ListView.separated(
            itemCount: sp.list.length,
            separatorBuilder: (context, index)=>Divider(thickness: 2,),
            itemBuilder: (context, index)=>Slidable(
              child: ListTile(
                leading: Icon(Icons.add_shopping_cart, color: Colors.blue,),
                title: Text(sp.list[index].ten),
                subtitle: Text(sp.list[index].url),
                trailing: Text(sp.list[index].gia.toString()),
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) async {
                      String? confirm = await showConfirmDialog(listViewContext, "ban cos muon xoa san pham");
                      if(confirm=="ok"){
                        var provider= listViewContext.read<QLSanPham>();
                        provider.xoaSP(index);
                      }
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Xóa',
                  ),
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    icon: Icons.addchart_outlined,
                    label: 'Cập nhật',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      Route route = MaterialPageRoute(builder: (context) => Themmoi());
                      Navigator.push(context, route);
                    },
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.visibility,
                    label: 'Xem',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Themmoi extends StatelessWidget {
  Themmoi({Key? key}) : super(key: key);
  GlobalKey <FormState> formState = GlobalKey<FormState>();
  SanPham m = SanPham(url: '',ten: "", gia: 0);
  TextEditingController txtName=TextEditingController();
  TextEditingController txtSoluong=TextEditingController();
  TextEditingController txtUrl=TextEditingController();
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formState,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              TextFormField(
                  controller: txtName,
                  onSaved: (newValue) => m.ten = newValue!,
                  decoration: InputDecoration(
                    labelText: 'Tên Mặt hàng',
                  )
              ),
              TextFormField(
                  controller: txtSoluong,
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) => m.gia= int.parse(newValue!),
                  decoration: InputDecoration(
                    labelText: 'Giá',
                  )
              ),
              TextFormField(
                  controller: txtUrl,
                  onSaved: (newValue) => m.url = newValue!,
                  decoration: InputDecoration(
                    labelText: 'Url',
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => _save(context),
                    child: Text("Save"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  _save(BuildContext context) {
    SanPham m = SanPham(url: txtUrl.text,ten: txtName.text, gia: int.parse(txtSoluong.text));
      context.read<QLSanPham>().themmoi(m);
      Navigator.pop(context);
    }
}


