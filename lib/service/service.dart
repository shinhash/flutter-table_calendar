import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

var logger = Logger();

class ScheduleApi {

  scheduleService({required String url, required Map sendData}) async {
    Map<String, dynamic> httpResult = {};
    try{
      var uri = Uri.parse('http://10.0.2.2:8088${url.toString()}');
      Map<String, String> headers = {'Content-Type':'application/json'};
      var jsonBody = json.encode(sendData);
      var response = await http.post(uri, headers: headers, body: jsonBody);
      if(response.statusCode == 200) httpResult = Map.from(jsonDecode(utf8.decode(response.bodyBytes)));
    } catch(e){
      logger.e(e);
    }
    return httpResult;
  }
}