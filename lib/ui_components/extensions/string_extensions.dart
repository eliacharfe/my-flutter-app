import 'package:intl/intl.dart';

extension StringExtensions on String {
  bool get isAlphanumeric => RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(this);

  bool get isAlphaOnly => RegExp(r'^[a-zA-Z\s]+$').hasMatch(this);

  bool get isPhoneNumberPattern => RegExp(r'^\d{10}$').hasMatch(this);

  bool get isEmailPattern => RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);

  bool get isAtLeastTwoWords => RegExp(r'\b\w+\b.*\b\w+\b').hasMatch(this);

  bool get isLoyaltyIdPattern => RegExp(r'^L\d{12}$').hasMatch(this);

  bool get isNumeric => RegExp(r'^\d+$').hasMatch(this);

  bool get isContainNumeric => RegExp(r'\d').hasMatch(this);

  String capitalizeWords() {
    if (isEmpty) return '';
    return split(' ').map((word) => (word).capitalizeFirstLetter()).join(' ');
  }

  String capitalizeFirstLetter() {
    if (isEmpty) return ''; // Handling empty strings
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String removeNonNumeric() {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  // input: DateFormatType output: DateFormatType
  String formatDate({
    DateFormatType inputFormat = DateFormatType.sfDate,
    DateFormatType outputFormat = DateFormatType.displayDate,
    bool toLocal = false,
  }) {
    if (trim().isEmpty) {
      return "";
    }

    DateTime dateTime;
    if (toLocal) {
      dateTime = DateTime.parse(this).toLocal();
    } else {
      dateTime = DateFormat(inputFormat.format).parse(this, true);
    }

    // Format the date as DateFormatType (outputFormat)
    return DateFormat(outputFormat.format).format(dateTime);
  }
}

//-------------

extension StringOptionalExtensions on String? {
  String? validateIsEmpty(String errorText) => (this == null || this!.isEmpty) ? errorText : null;

  bool get isAlphanumeric => (this ?? '').isAlphanumeric;

  bool get isAlphaOnly => (this ?? '').isAlphaOnly;

  bool get isPhoneNumberPattern => (this ?? '').isPhoneNumberPattern;

  bool get isEmailPattern => (this ?? '').isEmailPattern;

  bool get isAtLeastTwoWords => (this ?? '').isAtLeastTwoWords;

  bool get isLoyaltyIdPattern => (this ?? '').isLoyaltyIdPattern;

  bool get isNumeric => (this ?? '').isNumeric;

  bool get isContainNumeric => (this ?? '').isContainNumeric;

  bool get isStringValid => this != null && this!.isNotEmpty;

  bool get isEmpty => (this ?? '').isEmpty;

  bool get isNotEmpty => !isEmpty;

  String capitalizeWords() {
    if (this == null || this!.isEmpty) return '';
    return this!.split(' ').map((word) => (word).capitalizeFirstLetter()).join(' ');
  }

  String capitalizeFirstLetter() {
    if (this == null || this!.isEmpty) return '';
    return this![0].toUpperCase() + this!.substring(1).toLowerCase();
  }

  String removeNonNumeric() {
    if (this == null) return '';
    return this!.replaceAll(RegExp(r'[^0-9]'), '');
  }

  String toLowerCase() {
    return (this ?? '').toLowerCase();
  }

  String toUpperCase() {
    return (this ?? '').toUpperCase();
  }

  // input: DateFormatType output: DateFormatType
  String formatDate({
    DateFormatType inputFormat = DateFormatType.sfDate,
    DateFormatType outputFormat = DateFormatType.displayDate,
    bool toLocal = false,
  }) {
    final dateString = this?.trim();
    if (dateString == null || dateString.isEmpty) {
      return '';
    }

    DateTime dateTime;
    if (toLocal) {
      dateTime = DateTime.parse(dateString).toLocal();
    } else {
      dateTime = DateFormat(inputFormat.format).parse(dateString, true);
    }

    // Format the date as DateFormatType (outputFormat)
    return DateFormat(outputFormat.format).format(dateTime);
  }
}

enum DateFormatType {
  fullDateTime,
  sfDate,
  displayDate,
  hourMinuteAmPm,
  iso8601; // for exp iso8601: '2025-12-31T15:45:00Z' or '2025-01-02T20:37:00.000Z'

  String get format {
    switch (this) {
      case DateFormatType.fullDateTime:
        return "yyyy-MM-dd HH:mm:ss 'UTC'Z";
      case DateFormatType.sfDate:
        return 'yyyy-MM-dd';
      case DateFormatType.displayDate:
        return 'MM/dd/yyyy';
      case DateFormatType.hourMinuteAmPm:
        return 'h:mm a';
      case DateFormatType.iso8601:
        return 'yyyy-MM-ddTHH:mm:ss.sssZ';
    }
  }
}
