import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_screen_view_model.dart';

class SliderWidget extends StatefulWidget {
  final String type;
  final String leftText;
  final String rightText;


  SliderWidget({required this.type, required this.leftText, required this.rightText});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _currentValue = 0.5;
  bool _touched = false;

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return Container(
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
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    child: Stack(
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 6.0,
                            thumbShape: _CustomThumbShape(),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
                          ),
                          child: Slider(
                            value: _currentValue,
                            onChanged: (value) {
                              _touched = true;
                              switch(widget.type){
                                case 'stress':
                                  model.stressLevel = value;
                                  break;

                                case 'self_rating':
                                  model.selfRating = value;
                                  break;
                              }
                              setState(() {
                                _currentValue = value;
                              });
                            },
                            activeColor: _touched ? const Color.fromRGBO(255, 135, 2, 1) : const Color.fromRGBO(225, 221, 216, 1),
                            inactiveColor: const Color.fromRGBO(225, 221, 216, 1),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: FractionallySizedBox(
                              widthFactor: 1.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(6, (index) {
                                    return Container(
                                      width: 2,
                                      height: 8,
                                      color: const Color.fromRGBO(225, 221, 216, 1),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),

                  const SizedBox(height: 2,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.leftText, style: const TextStyle(color: Color.fromRGBO(188, 188, 191, 1))),
                        Text(widget.rightText, style: const TextStyle(color: Color.fromRGBO(188, 188, 191, 1))),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _CustomThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(18.0);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 12.0, paint);

    final innerPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;


    canvas.drawCircle(center, 6.0, innerPaint);
  }
}