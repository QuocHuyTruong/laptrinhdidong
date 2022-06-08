
import 'package:flutter/material.dart';
import 'Movie_detail.dart';
import 'Video_youtube.dart';
import 'getMovie.dart';

Widget movieLayout(data) {
  if (data.results.length > 0) {
    return Column(
      children: [
        for(int i =0; i<data.results.length;i++)
          getMovie(data: data.results[i],)
      ],
    );
  }
  else
    return Text("Không có kết quả",style: TextStyle(fontSize: 20,color: Colors.white),);
}

Widget getImage(String? url){
  if (url!= null)
    return Image.network("https://image.tmdb.org/t/p/original/$url",fit: BoxFit.contain,width: 200,height: 200,);
  else
    return Center(
      child: Icon(Icons.image),
    );
}

Widget getImageDetail(String? url){
  if (url!= null)
    return Image.network("https://image.tmdb.org/t/p/original/$url",fit: BoxFit.cover,);
  else
    return Center(
      child: Icon(Icons.image),
    );
}

Widget trailerLayout(data, context) {
  if (data.results.length > 0) {
    return Column(
      children: [
        for(int i =0; i<data.results.length;i++)
          VideoTrailer(url: data.results[i].key,title: data.results[i].name,type: data.results[i].type,),

      ],
    );
  }
  else
    return Text("Không có trailer",style: TextStyle(fontSize: 20,color: Colors.white),);
}

Widget cardMovies(context,snapshot,i) => Row(
  children: [
    Expanded(child: cardMovie(context,snapshot,i)),
    const SizedBox(width: 5),
    Expanded(child: cardMovie(context,snapshot,i+1)),
    const SizedBox(width: 5),
    Expanded(child: cardMovie(context,snapshot,i+2)),
  ],
);

Widget movilayout(context,snapshot,i){
  return (
      Column(
        children: [
          cardMovies(context, snapshot,i),
          const SizedBox(height: 5),
        ],
      )
  );

}

Widget cardMovie(context,snapshot,i) {
  if(snapshot.data!.results.length>i){
    return
      GestureDetector(
        onTap: () {
          Route route = MaterialPageRoute(builder: (context) => Moviedetail(id: snapshot.data!.results[i].id,dataphim: snapshot.data!.results[i],));
          Navigator.push(context, route);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(12),
            color: Color(0xFF010101),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getImage(snapshot.data!.results[i].poster_path),
                Text(
                  snapshot.data?.results[i].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Đánh giá:' + snapshot.data!.results[i].vote_average.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }else
    return
      Text("");
}
