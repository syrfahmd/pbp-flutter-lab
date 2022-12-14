import 'dart:convert';
import 'package:flutter/http.dart' as http;
import 'WatchListDetail.dart';
import 'watchlistModel.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  List<bool> statusMovie = [];
  Future<List<WatchList>> fetchWatchlist() async {
    var url = Uri.parse(
        'https://pbp-syarief.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print(data);

    // melakukan konversi data json menjadi object ToDo
    List<WatchList> listWatch = [];

    for (var d in data) {
      print(d);
      if (d != null) {
        listWatch.add(WatchList.fromJson(d));
        statusMovie.add(WatchList.fromJson(d).watched);
      }
    }
    return listWatch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: MyDrawer(),
        body: FutureBuilder(
            future: fetchWatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              // if (snapshot.data == null) {
              //   return const Center(child: CircularProgressIndicator());
              // } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada watchlist :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => ListTile(
                        trailing: Checkbox(
                          value: statusMovie[index],
                          onChanged: (bool? newValue) {
                            setState(() {
                              statusMovie[index] = !statusMovie[index];
                            });
                          },
                        ),
                        title: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WatchListDetail(
                                        data: snapshot.data![index])));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: statusMovie[index]
                                ? BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.0)
                                ])
                                : BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].movie_name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )));
              }
            }));
  }
}