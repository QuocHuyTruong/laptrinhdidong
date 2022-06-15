import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Favorite {
  final int? id;
  final String? title;
  final String? url;
  Favorite({required this.id, this.title,this.url});
  Favorite.fromJson(Map<String, dynamic> json):
        id = json['id']  ,
        title = json['title'],
        url = json['url'];
  Map<String, dynamic> toJson()
  {
    return {
      'id': id,
      'title': title,
      'url': url
    };
  }
}

class FavoriteSnapshot{
  Favorite? favorite;
  DocumentReference? docRef;

  FavoriteSnapshot({required this.favorite,required this.docRef});

  factory FavoriteSnapshot.fromSnapshot(DocumentSnapshot docSnap){
    return FavoriteSnapshot(
      favorite: Favorite.fromJson(docSnap.data() as Map<String, dynamic>),
      docRef: docSnap.reference,
    );
  }



  Future<void> delete()async{
    await docRef!.delete();
  }

  static Future<DocumentReference> addNew (Favorite favorite)async {
    return await FirebaseFirestore.instance.collection("Favorite").add(favorite.toJson());
  }

  static Stream<List<FavoriteSnapshot>> getAllFavorite(){
    Stream<QuerySnapshot> qs = FirebaseFirestore.instance.collection("Favorite").snapshots();
    Stream<List<DocumentSnapshot>> listDocSnap = qs.map((qsnap) => qsnap.docs);
    return listDocSnap.map((lds) =>
        lds.map((DocSnap) => FavoriteSnapshot.fromSnapshot(DocSnap))
            .toList());
  }

}