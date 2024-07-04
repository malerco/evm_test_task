import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_screen_view_model.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: GestureDetector(
        onTap: () {
          if (model.savePossible) {
            final snackBar = SnackBar(
              content: const Text('Успешно добавлено'),
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: 'Ok',
                onPressed: () {

                },
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            model.saveButtonPressed();
          }
        } ,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: model.savePossible ? const Color.fromRGBO(255, 135, 2, 1) : const Color.fromRGBO(242, 242, 242, 1),

          ),
          child: Center(child: Text('Сохранить', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: model.savePossible ? Colors.white : const Color.fromRGBO(188, 188, 191, 1) ),)),
        ),
      ),
    );
  }
}