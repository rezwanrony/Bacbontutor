import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tutorinfopage extends StatelessWidget{
  Future data;

  tutorinfopage(this.data);

  ScrollController _scrollController = new ScrollController();
  Widget setScore(var data) {
      return Container(
        width: 200,
        height: 10,
        child: LinearProgressIndicator(
          value: (data/5)*100,
          backgroundColor: Colors.purple,
        )
      );

    }

  Widget checkOnlinetution(var data) {

    if (data['is_active_online']== 1) {
      return Container(
          margin: EdgeInsets.only(top: 5),
          child: Column(
          children: <Widget>[
           Row(
             children: <Widget>[
               Image.asset('images/online.png',height: 15,width: 15,),
               Container(margin: EdgeInsets.only(left: 3),child:Text('Online Tution'))
             ],
           ),
           Text('${data['online_hour_rate']} tk/hour')
    ],
          )
      );
    }
    else{
      return Container(
          child: Text(''));
    }

  }

  Widget checkHomeTution(var data) {

    if (data['is_active_physical']== 1) {
      return Container(
          margin: EdgeInsets.only(top: 5),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset('images/home.png',height: 15,width: 15,),
                  Container(margin: EdgeInsets.only(left: 3),child:Text('Home Tution'))
                ],
              ),
              Text('${data['salary_max']} tk/month')
            ],
          )
      );
    }
    else{
      return Container(
          child: Text(''));
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
        ];
      },
       body: FutureBuilder(
          future: data,
          builder: (context,snapshot){
            return snapshot.data!=null?
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Text('Preferred Subjects',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:20 ),),
                            Container(
                                child: FutureBuilder(
                                    future: data,
                                    builder: (context, snapshot) {
                                      return snapshot.data != null
                                          ? Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: ListView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: snapshot.data['preferred_subjects'].length,
                                              itemBuilder: (context,i){
                                                return Container(
                                                    margin: EdgeInsets.only(top: 10),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Container(
                                                                height:120,
                                                                child: VerticalDivider(
                                                                  thickness: 5,
                                                                  color: Colors.blueAccent,
                                                                )
                                                            ),
                                                            Container(
                                                                margin: EdgeInsets.only(left: 10),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: <Widget>[
                                                                    Text(snapshot.data['preferred_subjects'][i]['course_name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                                                                    Container(
                                                                        margin: EdgeInsets.only(top: 5),
                                                                        child: Text('Class ${snapshot.data['preferred_subjects'][i]['class_name']} (${snapshot.data['preferred_subjects'][i]['medium_name']})')
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.only(top: 5),
                                                                        child: Row(
                                                                          children: <Widget>[
                                                                            setScore(snapshot.data['preferred_subjects'][i]['rating'])
                                                                          ],
                                                                        )
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.only(top: 5),
                                                                        child: Row(
                                                                          children: <Widget>[
                                                                            checkHomeTution(snapshot.data['preferred_subjects'][i])
                                                                          ],
                                                                        )
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.only(top: 5),
                                                                        child: Row(
                                                                          children: <Widget>[
                                                                            checkOnlinetution(snapshot.data['preferred_subjects'][i])
                                                                          ],
                                                                        )
                                                                    ),
                                                                  ],
                                                                )
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                ) ;
                                              }
                                          )
                                      )
                                          : Center(child: CircularProgressIndicator());
                                    })
                            )
                          ],
                        )
                    )
                ),


              ],
            )
                :
            Text('');
          },
        )
    );
  }

  }

