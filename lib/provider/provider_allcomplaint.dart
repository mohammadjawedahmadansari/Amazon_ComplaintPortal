import 'dart:convert';

import 'package:complaint_portal/models/model_allcomplaints.dart';
import 'package:flutter/material.dart';



class ComplaintProvider extends ChangeNotifier {
  late AllComplaints allComplaints;

  getData(context) async {
    var response = await DefaultAssetBundle.of(context).loadString('asset/localJson/AllComplaints.json');
    var mJson = jsonDecode(response);
    this.allComplaints = AllComplaints.fromJson(mJson);
    this.notifyListeners();
  }
}