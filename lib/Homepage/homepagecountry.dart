import 'package:firsttry/Model/Controller/countriescontroller.dart';
import 'package:firsttry/detailspage/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homepagecountry extends StatelessWidget {
  var ctx = Get.put(controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Countries"),
      ),
      body: SafeArea(
          child: Obx(
        () => ListView.builder(
          itemCount: ctx.countryname.length,
          itemBuilder: (BuildContext context, int index) {
            return ctx.countryname.length == null
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(detailspage(
                          details: ctx.countryname.value[index] == null
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
                                  ctx.countryname[index].name.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )),
                              )),
                        ],
                      ),
                    ),
                  );
          },
        ),
      )),
    );
  }
}
