import 'package:evm_test_task/ui/screens/calendar_screen/calendar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_screen_view_model.dart';

class TitleWidget extends StatelessWidget {

  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Text(model.dateAndTime, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color.fromRGBO(188, 188, 191, 1)),),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalendarScreen(),));
            },
              child: const Icon(Icons.calendar_month, size: 24, color: Color.fromRGBO(188, 188, 191, 1),)),
        ],
      ),
    );
  }
}