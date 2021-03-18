import 'package:firsttry/Model/allcountriesmodel.dart';
import 'package:http/http.dart' as http;

class ApiCountry {
  var link = "https://restcountries.eu/rest/v2/all";
  Future fetchdata() async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      return allCountriesFromJson(response.body);
    }
  }
}
