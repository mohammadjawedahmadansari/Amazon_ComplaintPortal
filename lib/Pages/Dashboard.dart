import 'package:complaint_portal/Widgets/appbar.dart';
import 'package:complaint_portal/Widgets/picchart.dart';
import 'package:complaint_portal/config/Pellete.dart';
import 'package:flutter/material.dart';

import 'ViewComplaints.dart';



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
        backgroundColor: Palette.primaryColor,
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            title(),
            Flexible(
              child: Row(
                children: <Widget>[
                  _buildStatCard('New', '50', Colors.red),
                  _buildStatCard('Closed', '50', Colors.green),
                  _buildStatCard('In-Progress', '20', Colors.orange),
                ],
              ),
            ),
            PieChartSample2(),
            Flexible(child: Row(
                  children: [
                    _buildAddViewCard('Add Complaints', Icon(Icons.edit,color: Colors.white,), Colors.lightGreen),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=> ViewComplaints()));
                        },
                        child: _buildAddViewCard('View Complaints',Icon(Icons.visibility,color: Colors.white), Colors.red)),
                  ],
                )),
            dataTable(),
          ],
        ),
      )
    );
  }

  Widget title(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:const EdgeInsets.only(top: 30.0,bottom: 20.0),
        child: Center(
          child: Text("Complaints Overview",style: TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),)
        ),
      ),
    );
}

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildAddViewCard(String title, Icon icon, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(3, 10), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: title + "\t",
                      style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)
                  ),
                  WidgetSpan(
                    child: icon,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dataTable(){
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 20,
            offset: Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        child: DataTable(
          columns: const<DataColumn>[
            DataColumn(
                label:Text('ID'),
            ),
            DataColumn(
              label:Text('District'),
            ),
            DataColumn(
              label:Text('Ward'),
            ),
            DataColumn(
              label:Text('Type'),
            ),
            DataColumn(
              label:Text('Date'),
            ),
            DataColumn(
              label:Text('Status'),
            ),
          ],
          rows: const<DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('1001')),
                DataCell(Text('Nalanda')),
                DataCell(Text('40')),
                DataCell(Text('Device Burnt')),
                DataCell(Text('Today')),
                DataCell(Text('Closed'))
              ]
            ),
            DataRow(
                cells: <DataCell>[
                  DataCell(Text('1002')),
                  DataCell(Text('Chapra')),
                  DataCell(Text('30')),
                  DataCell(Text('Motor Issue')),
                  DataCell(Text('Yesterday')),
                  DataCell(Text('New'))
                ]
            ),
            DataRow(
                cells: <DataCell>[
                  DataCell(Text('1003')),
                  DataCell(Text('Gaya')),
                  DataCell(Text('47')),
                  DataCell(Text('Device Not Working')),
                  DataCell(Text('16-Jun-2021')),
                  DataCell(Text('In-Progress'))
                ]
            ),
            DataRow(
                cells: <DataCell>[
                  DataCell(Text('1004')),
                  DataCell(Text('Siwan')),
                  DataCell(Text('52')),
                  DataCell(Text('Device Burnt')),
                  DataCell(Text('05-May-2021')),
                  DataCell(Text('Closed'))
                ]
            ),

          ],
        ),
      ),
    );
  }
}
