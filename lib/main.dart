import 'dart:convert';

import 'package:bacbontutors/test.dart';
import 'package:bacbontutors/tutorinfopage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(tabs());

class tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabs',
      theme: ThemeData(),
      home: tabpage(),
    );
  }
}

class tabpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return tabstate();
  }
}

class tabstate extends State {
  Future getData() async {
    var data;
    String link = "http://api.bacbontutors.com/V2/getTutorDetailsById/2";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    if (res.statusCode == 200) {
      data = json.decode(res.body);
    }
    return data;
  }

  Widget checkBacboncertification(var data) {
    if (data == 0) {
      return Container(
          margin: EdgeInsets.only(left: 5),
          child: Image.asset('images/tick.png', height: 15, width: 15));
    }
    else{
      return Container(
          margin: EdgeInsets.only(left: 5),
          child: Image.asset('', height: 15, width: 15));
    }
  }

  Widget checkOnlineTutoring(var data) {
    if (data == 1) {
      return Container(
          margin: EdgeInsets.only(left: 5),
          child: Image.asset('images/tick.png', height: 15, width: 15));
    }
    else{
      return Container(
          margin: EdgeInsets.only(left: 5),
          child: Image.asset('', height: 15, width: 15));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                return snapshot.data != null
                    ? DefaultTabController(
                  length: 2,
                  child: Stack(children: <Widget>[
                    Column(
                        children: <Widget>[
                          Container(height: 55.0),
                          Container(
                              height: 240,
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.black26),
                                  )),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        margin: EdgeInsets
                                                            .only(
                                                            left:
                                                            15,
                                                            right:
                                                            20),
                                                        child:
                                                        CircleAvatar(
                                                          backgroundImage:
                                                          NetworkImage(
                                                              "http://api.bacbontutors.com/V2/uploads/tutors/${snapshot.data['profile_pic']}"),
                                                        ),
                                                      ),
                                                      Container(
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  45),
                                                              color: Color.fromRGBO(
                                                                  220,
                                                                  220,
                                                                  220,
                                                                  0.5)),
                                                          margin:
                                                          EdgeInsets.only(
                                                              top:
                                                              5),
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                              10,
                                                              5,
                                                              10,
                                                              5),
                                                          child: Text(
                                                            snapshot.data[
                                                            'bacbon_rank'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                          ))
                                                    ],
                                                  )),
                                              Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: <Widget>[
                                                      Container(
                                                        child: Text(
                                                            snapshot.data[
                                                            'name'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                25.0,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                      ),
                                                      Container(
                                                          margin: EdgeInsets
                                                              .only(
                                                              top:
                                                              5),
                                                          child: Row(
                                                            children: <
                                                                Widget>[
                                                              Text(
                                                                'Ref: ',
                                                                textAlign:
                                                                TextAlign.start,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    15),
                                                              ),
                                                              Text(
                                                                  snapshot.data[
                                                                  'tutor_code'],
                                                                  textAlign: TextAlign
                                                                      .start,
                                                                  style:
                                                                  TextStyle(fontSize: 15))
                                                            ],
                                                          )),
                                                      Container(
                                                          margin: EdgeInsets
                                                              .only(
                                                              top:
                                                              5),
                                                          child: Row(
                                                            children: <
                                                                Widget>[
                                                              Text(
                                                                  'Provide online tutoring',
                                                                  style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 15.0,fontStyle: FontStyle.italic)),
                                                              checkOnlineTutoring(snapshot.data['onlineTutoringStatus'])
                                                            ],
                                                          )),
                                                      Container(
                                                          margin: EdgeInsets
                                                              .only(
                                                              top:
                                                              5),
                                                          child: Row(
                                                            children: <
                                                                Widget>[
                                                              Text(
                                                                  'Bacbon Certified',
                                                                  style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 15.0,fontStyle: FontStyle.italic)),
                                                              checkBacboncertification(
                                                                  snapshot
                                                                      .data['isBacBonCertified'])
                                                            ],
                                                          )),
                                                      checkRating(snapshot.data['guardian_rating'])
                                                    ],
                                                  ))
                                            ],
                                          ))),
                                  Container(
                                      margin:
                                      EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceEvenly,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                '${snapshot.data['total_earned']} tk',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    color: Colors
                                                        .black),
                                              ),
                                              Container(
                                                  margin: EdgeInsets
                                                      .only(top: 5),
                                                  child: Text(
                                                      'Total Earned'))
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                '${snapshot.data['total_online_tuition_duration']} sec',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    color: Colors
                                                        .black),
                                              ),
                                              Container(
                                                  margin: EdgeInsets
                                                      .only(top: 5),
                                                  child: Text(
                                                      'Online Tution'))
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                '${snapshot.data['total_physical_tuition_count']} job',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    color: Colors
                                                        .black),
                                              ),
                                              Container(
                                                  margin: EdgeInsets
                                                      .only(top: 5),
                                                  child: Text(
                                                      'Home Tution'))
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              )),
                          Container(
                            height: 48.0,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(45),
                                color: Color.fromRGBO(
                                    220, 220, 220, 0.5)),
                            margin:
                            EdgeInsets.fromLTRB(30, 20, 30, 0),
                            padding: EdgeInsets.all(4),
                            child: TabBar(
                                unselectedLabelColor: Colors.black,
                                indicatorSize:
                                TabBarIndicatorSize.tab,
                                indicator: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.indigo,
                                          Colors.indigo
                                        ]),
                                    borderRadius:
                                    BorderRadius.circular(40),
                                    color: Colors.indigo),
                                tabs: [
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Personal Info"),
                                    ),
                                  ),
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Tution Info"),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                              height: MediaQuery.of(context)
                                  .size
                                  .height,
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  test(getData()),
                                  tutorinfopage(getData()),
                                ],
                              ))
                        ]),
                    Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: AppBar(
                              title: Text(''),
                              // You can add title here
                              leading: IconButton(
                                icon: Icon(Icons.arrow_back,
                                    color: Colors.indigo, size: 30),
                                onPressed: () =>
                                    Navigator.of(context).pop(),
                              ),
                              backgroundColor: Colors.transparent,
                              //You can make this transparent
                              elevation: 0.0, //No shadow
                            ))),
                  ]),
                )
                    : Center(child: CircularProgressIndicator());
              })
        ));
  }
}

Widget checkRating(double rating){
  if(rating>=1&&rating<2){
    return Container(
        margin: EdgeInsets
            .only(
            top:
            5),
        child: Row(
          children: <
              Widget>[
            Container(
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            )
          ],
        ));
  }

  else if(rating>=2&&rating<3){
    return Container(
        margin: EdgeInsets
            .only(
            top:
            5),
        child: Row(
          children: <
              Widget>[
            Container(
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            )
          ],
        ));
  }

  else if(rating>=3&&rating<4){
    return Container(
        margin: EdgeInsets
            .only(
            top:
            5),
        child: Row(
          children: <
              Widget>[
            Container(
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            )
          ],
        ));
  }

  else if(rating>=4&&rating<5){
    return Container(
        margin: EdgeInsets
            .only(
            top:
            5),
        child: Row(
          children: <
              Widget>[
            Container(
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            )
          ],
        ));
  }

  else if(rating==5){
    return Container(
        margin: EdgeInsets
            .only(
            top:
            5),
        child: Row(
          children: <
              Widget>[
            Container(
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/star.png'),
            )
          ],
        ));
  }
  else {
    return Container(
        margin: EdgeInsets
            .only(
            top:
            5),
        child: Row(
          children: <
              Widget>[
            Container(
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left:
                  2),
              height:
              20,
              width:
              20,
              child: Image.asset(
                  'images/halfstar.png'),
            )
          ],
        ));
  }
}
