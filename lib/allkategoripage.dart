// import './detailkategori.dart';
// import './apiservices.dart';
// import 'package:flutter/material.dart';

// class AllKategoriPage extends StatelessWidget {
//   const AllKategoriPage({key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         title: Text('Seluruh Kategori'),
//       ),
//       body: Container(
//         child: FutureBuilder(
//             future: ApiService().getAllCategory(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return DetailKategori(
//                               categoryName: snapshot.data[index],
//                             );
//                           }));
//                         },
//                         child: Card(
//                           elevation: 2,
//                           margin: EdgeInsets.all(15),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Container(
//                             padding: EdgeInsets.all(40),
//                             child: Center(
//                               child: Text(
//                                 snapshot.data[index].toString().toUpperCase(),
//                                 style: TextStyle(
//                                   fontSize: 25,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     });
//               }
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
