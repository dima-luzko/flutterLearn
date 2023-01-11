import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/university/university_bloc.dart';
import 'package:practice_app/university/university_event.dart';
import 'package:practice_app/university/university_state.dart';
import '../university/models/university_model.dart';

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({Key? key}) : super(key: key);

  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  final UniversityBloc _universityBloc = UniversityBloc();

  @override
  void initState() {
    _universityBloc.add(GetUniversityList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _universityBloc,
      // child: BlocListener<UniversityBloc, UniversityState>(
      //   listener: (context, state) {
      //     if (state is UniversityError) {
      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //         content: Text(state.message!),
      //       ));
      //     }
      //   },
        child: BlocBuilder<UniversityBloc, UniversityState>(
          builder: (context, state) {
            if (state is UniversityInitial) {
              return const LoaderWidget();
            } else if (state is UniversityLoading) {
              return const LoaderWidget();
            } else if (state is UniversityLoaded) {
              return UniversityListWidget(data: state.universityModel);
            } else if (state is UniversityError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      // ),
    );
  }
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text('Something Went Wrong')
        ],
      ),
    );
  }
}


class UniversityListWidget extends StatelessWidget {
  final List<UniversityData>? data;
  const UniversityListWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return UniversityItem(
            nameUniversity: data![index].name,
            country: data![index].country,
            webSite: data![index].webPages.first);
      },
      itemCount: data!.length
    );
  }
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
