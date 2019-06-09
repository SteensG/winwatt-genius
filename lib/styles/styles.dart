import 'package:flutter/material.dart';

//Hier worden de stijlen gedefineerd die herbruikt worden in de applicatie.
class Styles {
  static const Color firstColor = Color(0xFFffa400);
  static const Color secondColor = Color(0xFFEC5FA8);

  static const _textSizeH1 = 24.0;
  static const _textSizeH2 = 20.0;
  static const _textSizeH3 = 16.0;
  static const _textSizeParagraph = 14.0;
  static const _textSizeSmall = 10.0;

  static final String _fontNameDefault = 'Muli';

  static final Color _textColorTitle = _hexToColor('67EACA');
  static final Color _textColorSubTitle = _hexToColor('000000');
  static final Color _textColorText = _hexToColor('666666');

  static final Color _tintColor = _hexToColor('67EACA');
  static final Color _backgroundColor = _hexToColor('FCF9EC');

  static final TextStyle h1 = TextStyle(
      fontFamily: _fontNameDefault,
      fontSize: _textSizeH1,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static final TextStyle h2 = TextStyle(
      fontFamily: _fontNameDefault,
      fontSize: _textSizeH2,
      fontWeight: FontWeight.w300,
      color: Colors.white);

  static final TextStyle h3 = TextStyle(
      fontFamily: _fontNameDefault,
      fontSize: _textSizeH3,
      fontWeight: FontWeight.w300,
      color: Colors.white);

  static final TextStyle p = TextStyle(
      fontFamily: _fontNameDefault,
      fontSize: _textSizeParagraph,
      color: _textColorText);

  static final TextStyle small = TextStyle(
      fontFamily: _fontNameDefault,
      fontSize: _textSizeSmall,
      color: _textColorText);

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
