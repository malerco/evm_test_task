import 'package:flutter/material.dart';

import 'slider_widget.dart';

class SelfRatingWidget extends StatelessWidget {
  const SelfRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Самооценка', style: TextStyle(color: Color.fromRGBO(76, 76, 105, 1), fontSize: 16, fontWeight: FontWeight.w800),),

          const SizedBox(height: 25,),

          SliderWidget(type: 'self_rating', leftText: 'Неуверенность', rightText: 'Уверенность'),
        ],
      ),
    );
  }
}