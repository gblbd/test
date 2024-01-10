
import 'package:http/http.dart' as http;
import 'Constants.dart';

class BaseClient {
  var client = http.Client();

  Future<dynamic> get(String api) async {
    var url = Uri.parse(Constants.CITY_URL + api);

    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }

  Future<dynamic> getDropDownData(String URL) async {
    var url = Uri.parse(URL);

    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {}
  }

  Future<dynamic> getAllList(String URL, String path, Map<String, dynamic> params) async {
    var url = Uri.parse(URL + path);

    if (params.isNotEmpty) {
      url = url.replace(queryParameters: params);
    }

    print(url);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      // Handle the error case
    }
  }


}