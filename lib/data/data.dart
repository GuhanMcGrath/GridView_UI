import 'dart:convert';
import 'package:http/http.dart' as ht;
import 'package:grid_view/data/datamodel.dart';

class GetData {
  List<DataModel> datalist = [];
  Future<List<DataModel>> getDetails() async {
    var data = await ht.get(Uri.parse(
        "https://softawork2.xyz/fandlApi/doctor/get_doctor_search?user_id=46&distance_range=100"));
    print("object");
    var response = jsonDecode(data.body);
    if (response["status"] == 200) {
      print("got it");
      response["doctorAllList"].forEach((element) {
        DataModel dataModel = DataModel(
            doctors_id: element["doctors_id"],
            doctors_user_id: element["doctors_user_id"],
            doctors_name: element["doctors_name"],
            doctor_clinic_name: element["doctor_clinic_name"],
            doctors_email: element["doctors_email"],
            doctors_contact_number: element["doctors_contact_number"],
            doctors_address: element["doctors_address"],
            doctors_website: element["doctors_website"],
            doctors_images: element["doctors_images"],
            doctors_is_visit: element["doctors_is_visit"],
            doctor_specialist_id: element["doctor_specialist_id"],
            doctors_week_days_opening_time:
                element["doctors_week_days_opening_time"],
            doctors_week_days_closing_time:
                element["doctors_week_days_closing_time"],
            doctors_week_ends_opening_time:
                element["doctors_week_ends_opening_time"],
            doctors_week_ends_closing_time:
                element["doctors_week_ends_closing_time"],
            doctors_is_available: element["doctors_is_available"],
            doctors_status: element["doctors_status"],
            doctors_description: element["doctors_description"],
            doctor_latitude: element["doctor_latitude"],
            doctor_longitude: element["doctor_longitude"],
            doctor_business_id: element["doctor_business_id"],
            created_date: element["created_date"],
            modified_date: element["modified_date"],
            doctor_specialist_name: element["doctor_specialist_name"],
            doctor_schedule_details: element["doctor_schedule_details"]);
        datalist.add(dataModel);
      });
    }
    return datalist;
  }
}



// https://softawork2.xyz/fandlApi/product/get_doctor_all?user_id=46&distance_range=100000&page_no=1