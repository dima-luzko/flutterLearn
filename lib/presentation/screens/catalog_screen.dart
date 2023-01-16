import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import '../widgets/button_widgets.dart';
import '../widgets/change_count_button_widget.dart';
import '../widgets/general_count_widget.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text('ТУРРОН БИТС',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:
                          Text('Мороженое', style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                    Text(
                      'АРТ-505467',
                      style: TextStyle(color: Colors.grey[500], fontSize: 18),
                    ),
                    const Text(
                      'Место хранения: Подвал',
                      style: TextStyle(color: placeColor, fontSize: 18),
                    ),
                    const GeneralCount(),
                  ],
                ),
              ),
              Column(
                children: [
                  const ButtonSection(),
                  Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      children: const [
                        Text('USD',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22)),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('6.25',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22)),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'images/ice_cream.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        const TitleSection(),
        Row(
          children: const [
            Button(
                background: activeButtonColor,
                textColor: Colors.white,
                remainderTextColor: Colors.white,
                count: "7",
                remainder: "Осталось"),
            Button(
                background: unActiveButtonColor,
                textColor: unActiveTextColor,
                remainderTextColor: Colors.black,
                count: "3",
                remainder: "Резерв"),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Text('Описание',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              )),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Нежнейший десерт',
              style: TextStyle(
                fontSize: 22,
              )),
        ),
      ],
    );
  }

}