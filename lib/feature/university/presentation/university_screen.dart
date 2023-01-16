import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:practice_app/feature/university/domain/use_case/university_use_case.dart';

import '../data/repository_impl/university_repository_impl.dart';
import '../domain/repository/university_repository.dart';
import 'bloc/university_bloc.dart';
import 'bloc/university_event.dart';
import 'bloc/university_state.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
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

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({Key? key}) : super(key: key);

  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  TextEditingController editingController = TextEditingController();
  late final UniversityRepository universityRepository;
  late final UniversityBloc _universityBloc;

  @override
  void initState() {
    universityRepository = UniversityRepositoryImpl();
    _universityBloc = UniversityBloc(UniversityUseCase(universityRepository))
      ..add(const UniversityEvent.loadUniversities());
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
