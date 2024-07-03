import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_screen_view_model.dart';

class FeelingListSubmenu extends StatefulWidget {
  const FeelingListSubmenu({super.key});

  @override
  State<FeelingListSubmenu> createState() => _FeelingListSubmenuState();
}

class _FeelingListSubmenuState extends State<FeelingListSubmenu> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Wrap(
        spacing: 8.0, // spacing between adjacent chips
        runSpacing: 8.0, // spacing between lines of chips
        children: List.generate(model.feelingSubmenuNames.length, (index) {
          return GestureDetector(
            onTap: () => model.selectedFeelingSubmenu = index,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: model.selectedFeelingSubmenu == index ? const Color.fromRGBO(255, 135, 2, 1) : Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(182, 161, 192, 0.11),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0.5, -0.5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Text(model.feelingSubmenuNames[index], style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: model.selectedFeelingSubmenu == index ? Colors.white : Colors.black,),),
              ),
            ),
          );
        }),
      ),
    );
  }
}