import 'package:get/get.dart';
import 'package:technicaltest/detailproduk.dart';
import 'apiservices.dart';
import 'package:flutter/material.dart';

class DetailKategori extends StatelessWidget {
  final String categoryName;
  const DetailKategori({key, required this.categoryName}) : super(key: key);

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
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "\$" +
                                      snapshot.data[index]['price'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1,
                                      color: Colors.green),
                                )
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
                                  Text(
                                    snapshot.data[index]['title'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data[index]['description'],
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: Icon(Icons.star),
                                      ),
                                      Container(
                                          child: Text(snapshot.data[index]
                                                  ['rating']['rate']
                                              .toString())),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ));
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
