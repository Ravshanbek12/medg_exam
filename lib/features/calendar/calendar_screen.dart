import 'package:flutter/material.dart';
import 'package:medg_exam/features/calendar/parts/kvartal_item.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Kalendar'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: const [
                SizedBox(
                  height: 16,
                ),
                KvartalItem(
                  kvartalNumber: 4,
                )
              ],
            ),
          ),
        ),
      );
}
