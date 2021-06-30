import 'dart:convert';

import 'package:complaint_portal/Pages/Dashboard.dart';
import 'package:complaint_portal/const/TextStyle.dart';
import 'package:complaint_portal/models/model_allcomplaints.dart';
import 'package:complaint_portal/provider/provider_allcomplaint.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ViewComplaints extends StatefulWidget {
  @override
  _ViewComplaintsState createState() => _ViewComplaintsState();
}

class _ViewComplaintsState extends State<ViewComplaints> {

  var data,complaintData;
  bool load = false;
  getData() async {
    var response = await DefaultAssetBundle.of(context).loadString('asset/localJson/AllComplaints.json');
    var mJson = jsonDecode(response);
    AllComplaints allComplaints = AllComplaints.fromJson(mJson);
    if(allComplaints.status == true){
    setState(() {
      load = true;
      complaintData = allComplaints.complaints;
    });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  bool isExpand = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("All Complaints",style: TextStyle(color: Colors.black,fontSize: 20.0),),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 20
        ),
          elevation: 0.0,
      ),
      body: load == true?
      ListView.builder(
         shrinkWrap: true,
           physics: ClampingScrollPhysics(),
           itemCount: complaintData == null ? 0 : complaintData.length,
           itemBuilder:(BuildContext context,index){
             return /*Card(
               elevation: 5.0,
               child: Column(
                 children: [
                   Text('Id : ${complaintData[index].complain_id}'),

                   Text('District : ${complaintData[index].dist}'),

                   Text('Ward : ${complaintData[index].ward}'),

                   Text('Type : ${complaintData[index].complaint_type}'),

                   Text('Date : ${complaintData[index].date}'),

                   Text('Status : ${complaintData[index].status}'),

                   Text('Fixed By : ${complaintData[index].fixBy}'),

                   Text('Mobile : ${complaintData[index].mobile}'),
                  Container(
                    height: 100,
                    width: 200,
                    child:  Image.asset('${complaintData[index].snapshot}',width: 200,height: 100,)
                  )
                 ],
               ),
             );*/
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card(
                   elevation: 5.0,
                 shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
                 ),
                   child: ExpansionTile(
                    title: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      //spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 4), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(Radius.circular(5)) ),
                              child:Column(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                        bottomRight: Radius.circular(5.0),
                                        topLeft: Radius.circular(5.0),
                                        topRight: Radius.circular(5.0),
                                        bottomLeft: Radius.circular(5.0)
                                    ),
                                    child: new Image.asset('${complaintData[index].snapshot}',
                                      width: 175,
                                      height: 120,
                                      fit: BoxFit.cover,)

                                    /*Image.network('https://virginbores.com.au/wp-content/uploads/2017/09/Blown-Lowara-Capacitor-2.png',
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,),*/
                                  ),
                                ],
                              ),
                            ),

                            /*ClipRRect(
                              borderRadius: new BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                topLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                              child: new Image.asset('${complaintData[index].snapshot}',width: 200,height: 100,
                              fit: BoxFit.cover,)
                            ),*/
                          ),
                          //Spacer(),
                          SizedBox(width: 05,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Complaint No #${complaintData[index].complain_id}',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Text('${complaintData[index].date}\t',style:FontStyle.style),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        padding: const EdgeInsets.only(top: 0.05,left: 0.10,right: 0.10,bottom: 0.05),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            width: 1.0,color: Colors.green,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomRight:Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
                                            bottomLeft: Radius.circular(5.0),
                                            topLeft: Radius.circular(5.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text('${complaintData[index].status}',
                                            style: TextStyle(fontSize:12.0,color: complaintData[index].status == ["Closed"] ? Colors.green
                                              :
                                          complaintData[index].status == ["New"] ? Colors.red : Colors.blue
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                   ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: Flexible(child: Text('${complaintData[index].dist}\t',
                                          style: FontStyle.style,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                         )
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            width: 1.0,color: Colors.green,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomRight:Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
                                            bottomLeft: Radius.circular(5.0),
                                            topLeft: Radius.circular(5.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text('Ward No ${complaintData[index].ward}',style: TextStyle(fontSize:12,color: complaintData[index].status == ["Closed"] ? Colors.green
                                              :
                                          complaintData[index].status == ["New"] ? Colors.red : Colors.blue
                                          ),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                    ),
                    trailing: Icon(Icons.arrow_drop_down_circle,color: Colors.pink,),
                    onExpansionChanged: (value){
                    setState(() {
                      isExpand = value;
                       }
                      );
                    },
                    children: [
                    SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Issue : ',style: TextStyle(fontSize: 15.0,color: Colors.black),),
                                  Spacer(),
                                  Text('${complaintData[index].complaint_type}',style:FontStyle.style,),
                                ],
                              ),
                              SizedBox(height: 05,),
                              Row(
                                children: [
                                  Text('Solver : ',style: FontStyle.style),
                                  Spacer(),
                                  Text('${complaintData[index].fixBy}',style: FontStyle.style),
                                ],
                              ),
                              SizedBox(height: 05,),
                              Row(
                                children: [
                                  Text('Mobile : ',style: FontStyle.style),
                                  Spacer(),
                                  Text(' ${complaintData[index].mobile}',style: FontStyle.style),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                     ],
                   ),
                 ),
               );
               }
           ): Center(child: CircularProgressIndicator())
    );
  }

  // complaint list
  Widget complaintList() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        //color: Colors.green,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.7),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ]
        ),
        child: ExpansionTile(
          title: Container(
            width: double.infinity,
            color: Colors.red,
            child: Text("Header",style: TextStyle(fontSize: 18.0),
            ),
          ),
          trailing: Icon(Icons.arrow_drop_down_circle,color: Colors.pink,),
          onExpansionChanged: (value){
            setState(() {
              isExpand = value;
              }
            );
          },
          children: [
            Text('Widget 1'),

            Text('Widget 1'),
          ],
        ),
      ),
    );
  }
  /*
  Widget test(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: ClipRRect(
              borderRadius: new BorderRadius.only(
                topRight: Radius.circular(5.0),
                topLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
              child: new Image.asset(complaintData[index].snapshot,
                fit: BoxFit.cover,
                height: 120,
                //width: 100,
              ),
            ),
          ),
        ),

        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (complaintData[index].status == 'New') ? Colors.red
                              : (complaintData[index].status == 'Closed' ? Colors.green :Colors.blue),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ]
                      ),
                      child: Center(child: Text('${complaintData[index].status}')),
                    ),
                    Container(
                      //height: 30,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Colors.black,
                      ),
                      child: Text('${complaintData[index].date}',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }*/

}
