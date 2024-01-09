import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: HexColor('FFFFEC'), //Background için
    primary: HexColor('BF3131'), //primary
    secondary: HexColor('FFFFFF'), //secondary için
    tertiary: HexColor('BD1616'), //buton rengi
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: HexColor('252525'), //Background için
    primary: HexColor('414141'), //primary
    secondary: HexColor('414141'), //secondary için
    tertiary: HexColor('E62C33'),
  ),
);
