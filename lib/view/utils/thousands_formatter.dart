import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'dart:math' as math;

class ThousandsFormatter extends NumberInputFormatter {
  //static final NumberFormat _formatter = NumberFormat.decimalPattern();

  final FilteringTextInputFormatter _decimalFormatter;
  final String _decimalSeparator;
  final RegExp _decimalRegex;

  final NumberFormat formatter;
  final bool allowFraction;

  ThousandsFormatter({required this.formatter, this.allowFraction = false})
      : _decimalSeparator = (formatter).symbols.DECIMAL_SEP,
        _decimalRegex =
            RegExp(allowFraction ? '[0-9]+([${(formatter).symbols.DECIMAL_SEP}])?' : r'\d+'),
        _decimalFormatter = FilteringTextInputFormatter.allow(
            RegExp(allowFraction ? '[0-9]+([${(formatter).symbols.DECIMAL_SEP}])?' : r'\d+'));

  @override
  String _formatPattern(String digits) {
    if (digits.isEmpty) return digits;
    num number;
    if (allowFraction) {
      String decimalDigits = digits;
      if (_decimalSeparator != '.') {
        decimalDigits = digits.replaceFirst(RegExp(_decimalSeparator), '.');
      }
      number = double.tryParse(decimalDigits) ?? 0.0;
    } else {
      number = int.tryParse(digits) ?? 0;
    }
    final result = (formatter).format(number);
    if (allowFraction && digits.endsWith(_decimalSeparator)) {
      return '$result$_decimalSeparator';
    }

    // Fix the .0 or .01 or .10 and similar issues
    if (digits.contains('.')) {
      List<String> decimalPlacesValue = digits.split(".");
      String decimalOnly = decimalPlacesValue[1];
      double? digitsOnly = double.tryParse(decimalPlacesValue[0]);
      String result = (formatter).format(digitsOnly);
      result = '$result.$decimalOnly';
      return result;
    }
    return result;
  }

  @override
  TextEditingValue _formatValue(TextEditingValue oldValue, TextEditingValue newValue) {
    return _decimalFormatter.formatEditUpdate(oldValue, newValue);
  }

  @override
  bool _isUserInput(String s) {
    return s == _decimalSeparator || _decimalRegex.firstMatch(s) != null;
  }
}

abstract class NumberInputFormatter extends TextInputFormatter {
  TextEditingValue? _lastNewValue;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    /// nothing changes, nothing to do
    if (newValue.text == _lastNewValue?.text) {
      return newValue;
    }
    _lastNewValue = newValue;

    /// remove all invalid characters
    newValue = _formatValue(oldValue, newValue);

    /// current selection
    int selectionIndex = newValue.selection.end;

    /// format original string, this step would add some separator
    /// characters to original string
    final newText = _formatPattern(newValue.text);

    /// count number of inserted character in new string
    int insertCount = 0;

    /// count number of original input character in new string
    int inputCount = 0;
    for (int i = 0; i < newText.length && inputCount < selectionIndex; i++) {
      final character = newText[i];
      if (_isUserInput(character)) {
        inputCount++;
      } else {
        insertCount++;
      }
    }

    /// adjust selection according to number of inserted characters staying before
    /// selection
    selectionIndex += insertCount;
    selectionIndex = math.min(selectionIndex, newText.length);

    /// if selection is right after an inserted character, it should be moved
    /// backward, this adjustment prevents an issue that user cannot delete
    /// characters when cursor stands right after inserted characters
    if (selectionIndex - 1 >= 0 &&
        selectionIndex - 1 < newText.length &&
        !_isUserInput(newText[selectionIndex - 1])) {
      selectionIndex--;
    }

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: selectionIndex),
        composing: TextRange.empty);
  }

  /// check character from user input or being inserted by pattern formatter
  bool _isUserInput(String s);

  /// format user input with pattern formatter
  String _formatPattern(String digits);

  /// validate user input
  TextEditingValue _formatValue(TextEditingValue oldValue, TextEditingValue newValue);
}
