import 'dart:convert';

import 'package:complaint_portal/Pages/Dashboard.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Complaints"),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 20
        ),
      ),
      body: load == true?
      ListView.builder(
         shrinkWrap: true,
           physics: ClampingScrollPhysics(),
           itemCount: complaintData == null ? 0 : complaintData.length,
           itemBuilder:(BuildContext context,index){
             return Card(
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
             );
           } ): Center(child: CircularProgressIndicator())
    );
  }
}
