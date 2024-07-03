import 'package:evm_test_task/ui/screens/main_screen/main_screen_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'widgets/feeling_list_submenu.dart';
import 'widgets/feeling_list_with_icons.dart';
import 'widgets/notes_widget.dart';
import 'widgets/save_button.dart';
import 'widgets/self_rating_widget.dart';
import 'widgets/stress_widget.dart';
import 'widgets/title_widget.dart';
import 'widgets/toggle_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenViewModel>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 253, 252, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget(),

              CustomToggleButtons(),

              if (model.toggleIndex == 0)...[
                const FeelingListWithIcons(),

                model.selectedFeeling != -1 ? const FeelingListSubmenu() : const SizedBox.shrink(),

                const StressWidget(),

                const SelfRatingWidget(),

                const NotesWidget(),

                const SaveButton()
              ],

              if (model.toggleIndex == 1)...[
                Image.asset('assets/images/coming_soon.png')
              ]
            ],
          ),
        ),
      ),
    );
  }
}











