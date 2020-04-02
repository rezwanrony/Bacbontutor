import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class test extends StatelessWidget{
  Future data;

  test(this.data);

  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NestedScrollView(
      controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
          ];
        },
        body:FutureBuilder(
          future: data,
          builder: (context,snapshot){
            return snapshot.data!=null?
                  ListView(
                    children: <Widget>[
                      Card(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Biography',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        child: Text(snapshot.data['bio'],style: TextStyle(fontSize: 16),)
                                    )
                                  ],
                                )
                              )
                          ),
                      Card(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Educations',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:20 ),),
                                  Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: FutureBuilder(
                                          future: data,
                                          builder: (context, snapshot) {
                                            return snapshot.data != null
                                                ? Container(

                                                child: ListView.builder(
                                                    physics: NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: snapshot.data['educations'].length,
                                                    itemBuilder: (context,i){
                                                      return Container(
                                                          margin: EdgeInsets.only(top: 5),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Container(
                                                                      height: 60,
                                                                      child: VerticalDivider(
                                                                        thickness: 5,
                                                                        color: Colors.greenAccent,
                                                                      )
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(left: 10),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: <Widget>[
                                                                          Text(snapshot.data['educations'][i]['edu_title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                                                                          Container(
                                                                              margin: EdgeInsets.only(top: 5),
                                                                              child: Text(snapshot.data['educations'][i]['institute'])
                                                                          ),
                                                                          Container(
                                                                              margin: EdgeInsets.only(top: 5),
                                                                              child: Text('Department: ${snapshot.data['educations'][i]['division']}')
                                                                          ),
                                                                          Container(
                                                                              margin: EdgeInsets.only(top: 5),
                                                                              child: Text('Grade: ${snapshot.data['educations'][i]['grade']}')
                                                                          ),
                                                                          Container(
                                                                              margin: EdgeInsets.only(top: 5),
                                                                              child: Text('Passing Year: ${snapshot.data['educations'][i]['passing_year']}')
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
                      Card(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Work Experiences',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:20 ),),
                                  Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: FutureBuilder(
                                          future: data,
                                          builder: (context, snapshot) {
                                            return snapshot.data != null
                                                ? Container(

                                                child: ListView.builder(
                                                    physics: NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: snapshot.data['work_experiences'].length,
                                                    itemBuilder: (context,i){
                                                      return Container(
                                                          margin: EdgeInsets.only(top: 5),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Container(
                                                                      height: 60,
                                                                      child: VerticalDivider(
                                                                        thickness: 5,
                                                                        color: Colors.redAccent,
                                                                      )
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(left: 10),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: <Widget>[
                                                                          Text(snapshot.data['work_experiences'][i]['organization'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                                                                          Container(
                                                                              margin: EdgeInsets.only(top: 5),
                                                                              child: Text(snapshot.data['work_experiences'][i]['work_title'])
                                                                          ),
                                                                          Container(
                                                                              margin: EdgeInsets.only(top: 5),
                                                                              child: Text('Start: ${snapshot.data['work_experiences'][i]['join_date']}')
                                                                          ),
                                                                          Container(
                                                                              margin: EdgeInsets.only(top: 5),
                                                                              child: Text('Currently work here')
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

                      Card(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('About',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:20 ),),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                                          height: 40,
                                          child: VerticalDivider(
                                            thickness: 5,
                                            color: Colors.blueAccent,
                                          )
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Text('Gender: ${snapshot.data['gender']}')
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Text('Blood group: ${snapshot.data['blood_group']}')
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            )
                      ),
                      Card(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('About',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:20 ),),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                                          height: 40,
                                          child: VerticalDivider(
                                            thickness: 5,
                                            color: Colors.blueAccent,
                                          )
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Text('Gender: ${snapshot.data['gender']}')
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Text('Blood group: ${snapshot.data['blood_group']}')
                                          ),
                                        ],
                                      )
                                    ],
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

class educations {
  String edu_title;
  String institute;
  String division;
  double grade;
  String passing_year;

  educations(this.edu_title, this.institute, this.division, this.grade,
      this.passing_year);

}
