import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_screen_view_model.dart';

class CustomToggleButtons extends StatefulWidget {
  @override
  _CustomToggleButtonsState createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 47.0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 242, 242, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  model.toggleIndex = 0;
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: selectedIndex == 0 ? const Color.fromRGBO(255, 135, 2, 1) : const Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const AssetImage('assets/images/journal.png'),
                        color: selectedIndex == 0 ?  Colors.white : const Color.fromRGBO(60, 60, 67, 0.6),
                        size: 12,
                      ),
                      const SizedBox(width: 5,),
                      Text('Дневник настроения', style: TextStyle(color: selectedIndex == 0 ? Colors.white : const Color.fromRGBO(188, 188, 191, 1), fontSize: 12, fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  model.toggleIndex = 1;
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: selectedIndex == 1 ? const Color.fromRGBO(255, 135, 2, 1) : const Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const AssetImage('assets/images/chart.png'),
                        color: selectedIndex == 1 ?  Colors.white : const Color.fromRGBO(60, 60, 67, 0.6),
                        size: 12,
                      ),
                      const SizedBox(width: 5,),
                      Text('Статистика', style: TextStyle(color: selectedIndex == 1 ? Colors.white : const Color.fromRGBO(188, 188, 191, 1), fontSize: 12, fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}