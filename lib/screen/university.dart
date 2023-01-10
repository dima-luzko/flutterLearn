import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../university/api/api_client.dart';
import '../university/models/university_model.dart';

class UniversityScreen extends StatelessWidget {
  const UniversityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    final client = ApiClient(dio);
    return FutureBuilder<List<University>>(
      future: client.getUniversityList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<University>? posts = snapshot.data;
          return _buildListView(context, posts!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

Widget _buildListView(BuildContext context, List<University> posts) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return UniversityItem(
          nameUniversity: posts[index].name,
          country: posts[index].country,
          webSite: posts[index].web_pages.first);
    },
    itemCount: posts.length,
  );
}

class UniversityItem extends StatelessWidget {
  final String nameUniversity;
  final String country;
  final String webSite;

  const UniversityItem(
      {Key? key,
      required this.nameUniversity,
      required this.country,
      required this.webSite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      width: 350,
      height: 180,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 320,
                height: 50,
                child: Center(
                    child: Text(nameUniversity,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))),
              )),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Image.asset(
                    'images/icon_country.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  country,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text("website:",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black))),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 3, right: 10),
                  child: Text(webSite,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.blueAccent)))
            ],
          )
        ],
      ),
    ));
  }
}
