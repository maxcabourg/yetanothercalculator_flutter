import 'dart:io';

import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String _label;
  final Color _bgColor;
  final Color _textColor;
  final VoidCallback _onTap;

  const CalcButton(this._label, this._bgColor, this._textColor, this._onTap);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _onTap,
      child: Text(
        _label,
        style: const TextStyle(
          fontSize: 24
        ),
      ),
      style: OutlinedButton.styleFrom(
        primary: _textColor,
        backgroundColor: _bgColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10)
      ),
    );
  }
}