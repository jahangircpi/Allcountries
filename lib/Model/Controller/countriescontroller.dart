import 'package:firsttry/Model/allcountriesmodel.dart';
import 'package:firsttry/Service/countriesservice.dart';
import 'package:get/get.dart';

class controller extends GetxController {
  var countryname = List<AllCountries>().obs;
  var onlysearch = List<AllCountries>().obs;
  var apicalled = ApiCountry();
  @override
  void onInit() {
    apicalled.fetchdata().then((value) {
      countryname.value = value;
      onlysearch.value = countryname.value;
    });
    super.onInit();
  }
}
