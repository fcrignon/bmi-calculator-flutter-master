import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/result_page.dart';

final routes = {
  '/input_page': (BuildContext context) => new InputPage(),
  '/result_page': (BuildContext context) => new ResultPage(bmi: null, interpretationResult: null, result: null,),
};