


class AllComplaints{
   bool status;
   List<Complaints> complaints;

  AllComplaints({required this.status,required this.complaints});

   factory AllComplaints.fromJson(Map<String, dynamic> parsedJson) => AllComplaints(
       status: parsedJson["status"],
       complaints: List<Complaints>.from(parsedJson["data"].map((x) => Complaints.fromJson(x))).toList()
      );

}

class Complaints{
   String complain_id;
   String dist;
   String ward;
   String complaint_type;
   String date;
   String status;
   String fixBy;
   String mobile;
   String snapshot;

  Complaints({required this.complain_id,required this.dist,required this.ward,required ,required this.complaint_type,required this.date,required this.status,required this.fixBy,required this.mobile,required this.snapshot});

  factory Complaints.fromJson(Map<String, dynamic> parsedJson) => Complaints(
    complain_id: parsedJson["complain_id"],
    dist: parsedJson["district"],
    ward: parsedJson["ward"],
    complaint_type: parsedJson["complaint_type"],
    date: parsedJson["date"],
    status: parsedJson["status"],
    fixBy: parsedJson["fix_by"],
    mobile: parsedJson["mobile"],
    snapshot : parsedJson["snapshot"]
  );

}
