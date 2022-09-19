import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest/allkategoripage.dart';
import './apiservices.dart';
import './detailkategori.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Kategori Barang"),
        ),
        body: Container(
          child: FutureBuilder(
              future: ApiService().getAllCategory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(DetailKategori(
                                categoryName: snapshot.data[index]));
                          },
                          child: Card(
                            elevation: 2,
                            margin: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              padding: EdgeInsets.all(40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    snapshot.data[index]
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Edit",
                                            style:
                                                TextStyle(color: Colors.green),
                                          )),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(color: Colors.red),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ));
  }
}
