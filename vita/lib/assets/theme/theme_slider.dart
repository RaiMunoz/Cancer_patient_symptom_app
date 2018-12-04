import 'package:flutter/material.dart';
import 'theme.dart';

class ThemeSlider extends StatelessWidget {
  final Slider slider;
  ThemeSlider(this.slider);

  static Color activeColor = ThemeColors.lightGreen;
  static Color inactiveColor = ThemeColors.white;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        child: slider,
        data: Theme.of(context).sliderTheme.copyWith(
          activeTrackColor: ThemeSlider.activeColor,
          inactiveTrackColor: ThemeSlider.inactiveColor,
          activeTickMarkColor: ThemeSlider.activeColor,
          inactiveTickMarkColor: ThemeSlider.inactiveColor,
          valueIndicatorColor: ThemeColors.white,
          valueIndicatorTextStyle: TextStyle(fontWeight: FontWeight.bold),
          showValueIndicator: ShowValueIndicator.always,
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        )
    );
  }
}