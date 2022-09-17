import 'package:get/get.dart';
import 'package:technicaltest/detailproduk.dart';
import 'apiservices.dart';
import 'package:flutter/material.dart';

class CategoryWise extends StatelessWidget {
  final String categoryName;
  const CategoryWise({key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryName.toString()),
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiService().getProducts(categoryName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (
                  context,
                  index,
                ) {
                  return InkWell(
                      onTap: () {
                        Get.off(DetailProduct(snapshot.data[index]['id']));
                      },
                      child: Card(
                        child: Row(children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Image.network(
                                  snapshot.data[index]['image'],
                                  height: 70.0,
                                  width: 30.0,
                                ),
                                Text("\$" +
                                    snapshot.data[index]['price'].toString())
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(snapshot.data[index]['title']),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ));
                  // return ListTile(
                  //   title: Text(snapshot.data[index]['title']),
                  //   leading: Image.network(
                  //     snapshot.data[index]['image'],
                  //     height: 50,
                  //     width: 30,
                  //   ),
                  //   subtitle: Text("Price - \$" +
                  //       snapshot.data[index]['price'].toString()),
                  //   onTap: () {
                  //     Navigator.push(context,
                  //         // ignore: missing_return
                  //         MaterialPageRoute(builder: (context) {
                  //       return DetailProduct(snapshot.data[index]['id']);
                  //     }));
                  //   },
                  // );
                },
                itemCount: snapshot.data.length,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
