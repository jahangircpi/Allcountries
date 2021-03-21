import 'package:firsttry/Model/Controller/countriescontroller.dart';
import 'package:firsttry/detailspage/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class homepagecountry extends StatelessWidget {
  var ctx = Get.put(controller());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () {
          return Get.dialog(AlertDialog(
            title: Text("Alert!"),
            content: Text("Are you sure you want to exit?"),
            actions: [
              FlatButton(
                  color: Colors.black.withOpacity(0.50),
                  splashColor: Colors.red,
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text("Yes")),
              FlatButton(
                  splashColor: Colors.green,
                  color: Colors.green.withOpacity(0.90),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
            ],
          ));
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("All Countries"),
          ),
          body: SafeArea(
              child: Obx(
            () => Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (v) {
                        ctx.countryname.value = ctx.onlysearch
                            .where((e) =>
                                e.name.toLowerCase().contains(v.toLowerCase()))
                            .toList();
                      },
                      decoration: InputDecoration(
                        hintText: "Search a country",
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ctx.countryname.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ctx.countryname.length == null
                          ? Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Get.to(detailspage(
                                    details:
                                        ctx.countryname.value[index] == null
                                            ? CircleAvatar()
                                            : ctx.countryname.value[index],
                                  ));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        height: 100,
                                        width: 300,
                                        color: Colors.blue,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: Text(
                                            ctx.countryname[index].name
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          )),
                                        )),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
