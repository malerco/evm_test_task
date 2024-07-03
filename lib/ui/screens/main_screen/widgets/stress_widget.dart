import 'package:flutter/material.dart';

import 'slider_widget.dart';

class StressWidget extends StatelessWidget {
  const StressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Уровень стресса', style: TextStyle(color: Color.fromRGBO(76, 76, 105, 1), fontSize: 16, fontWeight: FontWeight.w800),),

          const SizedBox(height: 25,),

          SliderWidget(type: 'stress', leftText: 'Низкий', rightText: 'Высокий'),
        ],
      ),
    );
  }
}
