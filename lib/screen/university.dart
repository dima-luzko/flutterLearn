import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:practice_app/new/bloc/university_bloc.dart';

import '../new/bloc/university_event.dart';
import '../new/bloc/university_state.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
    //   return Center(child: Lottie.network(
    //       'https://assets1.lottiefiles.com/packages/lf20_rwq6ciql.json'));
  }
}

class ErrorWidget extends StatelessWidget {
  final String message;

  const ErrorWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/error.json', width: 150, height: 150),
          Text(message,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
        ],
      ),
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

class UniversityStateWidget extends StatefulWidget {
  const UniversityStateWidget({Key? key}) : super(key: key);

  @override
  State<UniversityStateWidget> createState() => _UniversityStateWidgetState();
}

class _UniversityStateWidgetState extends State<UniversityStateWidget> {
  final UniversityBloc _universityBloc = UniversityBloc();
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    _universityBloc.add(const UniversityEvent.loadUniversities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 10, left: 16, right: 16),
            child: TextField(
              onChanged: (value) {
                _universityBloc.add(UniversityEvent.searchUniversity(value));
              },
              controller: editingController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            )),
        Expanded(
            child: BlocProvider(
          create: (_) => _universityBloc,
          child: BlocBuilder<UniversityBloc, UniversityState>(
            builder: (context, state) {
              if (state is Loading) {
                return const LoaderWidget();
              } else if (state is Data) {
                final universityList = state.data;
                return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemBuilder: (context, index) {
                      return UniversityItem(
                          nameUniversity: universityList[index].name,
                          country: universityList[index].country,
                          webSite: universityList[index].webPages.first);
                    },
                    itemCount: universityList.length);
              } else if (state is Error) {
                return ErrorWidget(message: state.message.toString());
              } else {
                return Container();
              }
            },
          ),
          // ),
        ))
      ]),
    );
  }
}
