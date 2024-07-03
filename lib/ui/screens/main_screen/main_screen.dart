import 'package:evm_test_task/ui/screens/main_screen/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 253, 252, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleWidget(),

              _ToggleButtons(),

              _FeelingListWithIcons()
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox.shrink(),
          Text('Data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color.fromRGBO(188, 188, 191, 1)),),
          Icon(Icons.calendar_month, size: 24, color: Color.fromRGBO(188, 188, 191, 1),),
        ],
      ),
    );
  }
}

class _ToggleButtons extends StatefulWidget {
  @override
  _ToggleButtonsState createState() => _ToggleButtonsState();
}

class _ToggleButtonsState extends State<_ToggleButtons> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 47.0),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: Color.fromRGBO(242, 242, 242, 1),
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
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: selectedIndex == 0 ? Color.fromRGBO(255, 135, 2, 1) : Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/journal.png'),
                        color: selectedIndex == 0 ?  Colors.white : Color.fromRGBO(60, 60, 67, 0.6),
                        size: 12,
                      ),
                      SizedBox(width: 5,),
                      Text('Дневник настроения', style: TextStyle(color: selectedIndex == 0 ? Colors.white : Color.fromRGBO(188, 188, 191, 1), fontSize: 12, fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: selectedIndex == 1 ? Color.fromRGBO(255, 135, 2, 1) : Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/chart.png'),
                        color: selectedIndex == 1 ?  Colors.white : Color.fromRGBO(60, 60, 67, 0.6),
                        size: 12,
                      ),
                      SizedBox(width: 5,),
                      Text('Статистика', style: TextStyle(color: selectedIndex == 1 ? Colors.white : Color.fromRGBO(188, 188, 191, 1), fontSize: 12, fontWeight: FontWeight.w500),)
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


class _FeelingListWithIcons extends StatelessWidget {
  const _FeelingListWithIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Что чувствуешь?', style: TextStyle(color: Color.fromRGBO(76, 76, 105, 1), fontSize: 16, fontWeight: FontWeight.w800),),

          SizedBox(height: 25,),

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
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: model.selectedFeeling == index ? Border.all(color: Color.fromRGBO(255, 135, 2, 1), width: 2) : null,
                        boxShadow: [
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

                          SizedBox(height: 2,),

                          Text(model.feelingWithIconNames[index], style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromRGBO(76, 76, 105, 1)),)
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

