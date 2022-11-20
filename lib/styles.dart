import 'package:flutter/material.dart';

const onPrimary = Colors.black54;
const primary = Colors.greenAccent;
const primaryContainer = Colors.green;
const onSecondary = Colors.white70;
const secondary = Colors.lightBlueAccent;
const secondaryContainer = Colors.lightBlue;
const error = Colors.red;
const onError = Colors.white;
const brightness = Brightness.light;
const background = Colors.yellow;
const onBackground = Colors.green;
const surface = Colors.green;
const onSurface = Colors.white70;

ColorScheme calcColorScheme = const ColorScheme(
    onPrimary: onPrimary,
    primary: primary,
    primaryContainer: primaryContainer,
    onSecondary: onSecondary,
    secondary: secondary,
    secondaryContainer: secondaryContainer,
    error: error,
    onError: onError,
    brightness: brightness,
    background: background,
    onBackground: onBackground,
    surface: surface,
    onSurface: onSurface);

TextStyle resultTextStyle = const TextStyle(
    color: onPrimary,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    fontFamily: 'Open Sans',
    fontSize: 40);

TextStyle buttonTextStyle = const TextStyle(
    color: onPrimary,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.normal,
    fontFamily: 'Open Sans',
    fontSize: 40);
