import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestLayout extends StatefulWidget {
  const TestLayout({Key? key}) : super(key: key);

  @override
  State<TestLayout> createState() => _TestLayoutState();
}

class _TestLayoutState extends State<TestLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset("assets/Marilyn_Monroe.jpg",fit: BoxFit.cover,)
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            'Title'.toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,)
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "overviewmovie",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Release date'.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'muli',
                              ),
                            ),
                            Text(
                              "movieDetail.releaseDate",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                color: Colors.yellow[800],
                                fontSize: 12,
                                fontFamily: 'muli',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'run time'.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'muli',
                              ),
                            ),
                            Text(
                              "movieDetail.runtime",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                color: Colors.yellow[800],
                                fontSize: 12,
                                fontFamily: 'muli',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'budget'.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'muli',
                              ),
                            ),
                            Text(
                              "movieDetail.budget",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                color: Colors.yellow[800],
                                fontSize: 12,
                                fontFamily: 'muli',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Screenshots'.toUpperCase(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'muli',
                      ),
                    ),
                    Container(
                      height: 155,
                      child: Text("data"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Casts'.toUpperCase(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'muli',
                      ),
                    ),
                    Container(
                      height: 110,
                      child: Text("data"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
