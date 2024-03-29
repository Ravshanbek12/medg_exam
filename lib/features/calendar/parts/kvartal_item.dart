import 'package:flutter/material.dart';

import '../../../core/functions/w_button.dart';
import '../widgets/my_functions.dart';
import 'calendar.dart';


class KvartalItem extends StatefulWidget {
  final int kvartalNumber;

  const KvartalItem({
    required this.kvartalNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<KvartalItem> createState() => _KvartalItemState();
}

class _KvartalItemState extends State<KvartalItem> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(
                'Coming soon',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              content: Text(
                'These features are coming soon...',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: [
                WButton(
                  onTap: () {
                    Navigator.pop(_);
                  },
                  text: 'Close',
                )
              ],
            ),
          );
        },
        child: Column(
          children: [
      
            const SizedBox(
              height: 16,
            ),
            CustomCalendar(
                dateTimeMonths:
                    MyFunctions.getMonthIndexes(widget.kvartalNumber)),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );
}
