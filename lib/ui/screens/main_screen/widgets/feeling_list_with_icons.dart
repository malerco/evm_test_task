import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_screen_view_model.dart';

class FeelingListWithIcons extends StatelessWidget {
  const FeelingListWithIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Что чувствуешь?', style: TextStyle(color: Color.fromRGBO(76, 76, 105, 1), fontSize: 16, fontWeight: FontWeight.w800),),

          const SizedBox(height: 25,),

          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.feelingWithIconAssetsPath.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
                  child: GestureDetector(
                    onTap: () => model.feelingSelected(index),
                    child: Container(
                      width: 83,
                      height: 118,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: model.selectedFeeling == index ? Border.all(color: const Color.fromRGBO(255, 135, 2, 1), width: 2) : null,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(182, 161, 192, 0.11),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0.5, -0.5),
                          ),
                        ],
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(model.feelingWithIconAssetsPath[index]),

                          const SizedBox(height: 2,),

                          Text(model.feelingWithIconNames[index], style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromRGBO(76, 76, 105, 1)),)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}