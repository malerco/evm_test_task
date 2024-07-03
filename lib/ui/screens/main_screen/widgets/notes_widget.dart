import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_screen_view_model.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Заметки', style: TextStyle(color: Color.fromRGBO(76, 76, 105, 1), fontSize: 16, fontWeight: FontWeight.w800),),

          const SizedBox(height: 25,),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(255, 255, 255, 1),
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
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Введите заметку',
                    hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(225, 221, 216, 1))
                ),
                minLines: 4,
                maxLines: 4,
                onChanged: (value) {
                  model.notes = value;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}