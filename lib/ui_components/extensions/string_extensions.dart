import 'package:intl/intl.dart';
import '../../l10n/l10n.dart';
import '../../packages/default_packages.dart';

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

extension StringTranslation on String {
  String translate(BuildContext context, {bool isCaseInsensitive = true}) {
    String normalizedKey = this;
    if (isCaseInsensitive) {
      normalizedKey = normalizedKey.toLowerCase();
    }
    switch (normalizedKey) {
      case 'english':
        return S.of(context).english;
      case 'french':
        return S.of(context).french;
      case 'hebrew':
        return S.of(context).hebrew;
      case 'spanish':
        return S.of(context).spanish;
      case 'settings':
        return S.of(context).settings;
      case 'quick_transactions':
        return S.of(context).quick_transactions;
      case 'quick_transactions_desc':
        return S.of(context).quick_transactions_desc;
      case 'secure_payments':
        return S.of(context).secure_payments;
      case 'secure_payments_desc':
        return S.of(context).secure_payments_desc;
      case 'appointments':
        return S.of(context).appointments;
      case 'schedule_appointments':
        return S.of(context).schedule_appointments;
      case 'schedule_appointments_desc':
        return S.of(context).schedule_appointments_desc;
      case 'reminders':
        return S.of(context).reminders;
      case 'reminders_desc':
        return S.of(context).reminders_desc;
      case 'real_time_alerts':
        return S.of(context).real_time_alerts;
      case 'real_time_alerts_desc':
        return S.of(context).real_time_alerts_desc;
      case 'custom_notifications':
        return S.of(context).custom_notifications;
      case 'custom_notifications_desc':
        return S.of(context).custom_notifications_desc;
      case 'user_guide':
        return S.of(context).user_guide;
      case 'step_by_step_tutorials':
        return S.of(context).step_by_step_tutorials;
      case 'step_by_step_tutorials_desc':
        return S.of(context).step_by_step_tutorials_desc;
      case 'faq':
        return S.of(context).faq;
      case 'faq_desc':
        return S.of(context).faq_desc;
      case 'dark_mode':
        return S.of(context).dark_mode;
      case 'light_mode':
        return S.of(context).light_mode;
      case 'account':
        return S.of(context).account;
      case 'manage_account':
        return S.of(context).manage_account;
      case 'notifications':
        return S.of(context).notifications;
      case 'notification_preferences':
        return S.of(context).notification_preferences;
      case 'privacy':
        return S.of(context).privacy;
      case 'privacy_settings':
        return S.of(context).privacy_settings;
      case 'language':
        return S.of(context).language;
      case 'selectedLanguage':
        return S.of(context).selectedLanguage;
      case 'help_support':
        return S.of(context).help_support;
      case 'help_support_text':
        return S.of(context).help_support_text;
      case 'about':
        return S.of(context).about;
      case 'app_info':
        return S.of(context).app_info;
      case 'app_info_title':
        return S.of(context).app_info_title;
      case 'version':
        return S.of(context).version;
      case 'build_number':
        return S.of(context).build_number;
      case 'package_name':
        return S.of(context).package_name;
      case 'app_name':
        return S.of(context).app_name;
      case 'tapped_on':
        return S.of(context).tapped_on;
      case 'about_me':
        return S.of(context).about_me;
      case 'about_me_description':
        return S.of(context).about_me_description;
      case 'technical_skills':
        return S.of(context).technical_skills;
      case 'software_skills':
        return S.of(context).software_skills;
      case 'web_skills':
        return S.of(context).web_skills;
      case 'soft_skills':
        return S.of(context).soft_skills;
      case 'characteristics':
        return S.of(context).characteristics;
      case 'languages':
        return S.of(context).languages;
      case 'software_developer':
        return S.of(context).software_developer;
      case 'education':
        return S.of(context).education;
      case 'bachelor_computer_science':
        return S.of(context).bachelor_computer_science;
      case 'loading':
        return S.of(context).loading;
      case 'flutter_and_dart':
        return S.of(context).flutter_and_dart;
      case 'object_oriented_programming':
        return S.of(context).object_oriented_programming;
      case 'design_patterns_and_solid':
        return S.of(context).design_patterns_and_solid;
      case 'databases_and_data_structures':
        return S.of(context).databases_and_data_structures;
      case 'parallel_programming':
        return S.of(context).parallel_programming;
      case 'macos_windows_linux_environments':
        return S.of(context).macos_windows_linux_environments;
      case 'flutter_js_java_sql':
        return S.of(context).flutter_js_java_sql;
      case 'html_css_bootstrap':
        return S.of(context).html_css_bootstrap;
      case 'node_express_react_springboot':
        return S.of(context).node_express_react_springboot;
      case 'backend_frontend_web_dev':
        return S.of(context).backend_frontend_web_dev;
      case 'ux_ui_design_sense':
        return S.of(context).ux_ui_design_sense;
      case 'autodidact':
        return S.of(context).autodidact;
      case 'hard_working':
        return S.of(context).hard_working;
      case 'creative':
        return S.of(context).creative;
      case 'cooperative':
        return S.of(context).cooperative;
      case 'problem_solver':
        return S.of(context).problem_solver;
      case 'stress_management':
        return S.of(context).stress_management;
      case 'hebrew_native':
        return S.of(context).hebrew_native;
      case 'french_native':
        return S.of(context).french_native;
      case 'english_fluent':
        return S.of(context).english_fluent;
      case "contact_me":
        return S.of(context).contact_me;
      case "phone":
        return S.of(context).phone;
      case "email":
        return S.of(context).email;
      case "whatsapp":
        return S.of(context).whatsapp;
      case "website":
        return S.of(context).website;
      case "address":
        return S.of(context).address;
      case "bsc_computer_science":
        return S.of(context).bsc_computer_science;
      case 'app_version':
        return S.of(context).app_version;
      case 'software':
        return S.of(context).software;
      case 'characteristic':
        return S.of(context).characteristic;
      case 'web':
        return S.of(context).web;
      case 'home_tab':
        return S.of(context).home_tab;
      case 'about_tab':
        return S.of(context).about_tab;
      case 'tasks_tab':
        return S.of(context).tasks_tab;
      case 'contact_tab':
        return S.of(context).contact_tab;
      case 'settings_tab':
        return S.of(context).settings_tab;
      case 'terms':
        return S.of(context).terms;
      case 'manual':
        return S.of(context).manual;
      case 'Activities':
        return S.of(context).activities;
      case 'Show':
        return S.of(context).show;
      case 'Hide':
        return S.of(context).hide;
      case 'home_title':
        return S.of(context).home_title;
      case "notes_title":
        return S.of(context).notes_title;
      case 'home_no_notes':
        return S.of(context).home_no_notes;
      case 'home_no_todos':
        return S.of(context).home_no_todos;
      case 'show_all_todos':
        return S.of(context).show_all_todos;
      case 'achievement_title':
        return S.of(context).achievement_title;
      case 'unable_to_load':
        return S.of(context).unable_to_load;
      case 'no_data_available':
        return S.of(context).no_data_available;
      case 'upcoming_events':
        return S.of(context).upcoming_events;
      case 'event_description':
        return S.of(context).event_description;
      case 'delete_item_confirmation':
        return S.of(context).delete_item_confirmation;
      case 'delete_item_success':
        return S.of(context).delete_item_success;
      case 'note_added':
        return S.of(context).note_added;
      case 'note_edited':
        return S.of(context).note_edited;
      case 'todo_marked_completed':
        return S.of(context).todo_marked_completed;
      case 'todo_marked_incomplete':
        return S.of(context).todo_marked_incomplete;
      case 'item_deleted_successfully':
        return S.of(context).item_deleted_successfully;
      case 'add_note_title':
        return S.of(context).add_note_title;
      case 'edit_note_title':
        return S.of(context).edit_note_title;
      case 'save':
        return S.of(context).save;
      case 'add':
        return S.of(context).add;
      case 'close':
        return S.of(context).close;
      case 'yes_delete':
        return S.of(context).yes_delete;
      case 'delete_button_title':
        return S.of(context).delete_button_title;
      case 'note_deleted':
        return S.of(context).note_deleted;
      case 'todos_title':
        return S.of(context).todos_title;
      case 'achievement':
        return S.of(context).achievement;
      case 'achievement_dialog_description':
        return S.of(context).achievement_dialog_description;
      case 'progress':
        return S.of(context).progress;
      case 'empty_section_title':
        return S.of(context).empty_section_title;
      case 'unable_to_load_title':
        return S.of(context).unable_to_load_title;
      case 'customized_no_data':
        return S.of(context).customized_no_data;
      case 'projects':
        return S.of(context).projects;
      case 'dialog_modal_title':
        return S.of(context).dialog_modal_title;
      case 'dialog_modal_content':
        return S.of(context).dialog_modal_content;
      case 'cancel':
        return S.of(context).cancel;
      case 'add_todo_title':
        return S.of(context).add_todo_title;
      case 'empty_section':
        return S.of(context).empty_section;
      case 'all_tasks_title':
        return S.of(context).all_tasks_title;
      case 'add_new_todo':
        return S.of(context).add_new_todo;
      case 'todo_completed':
        return S.of(context).todo_completed;
      case 'delete_todo':
        return S.of(context).delete_todo;
      case 'view_on_github':
        return S.of(context).view_on_github;
      case 'all':
        return S.of(context).all;
      case 'transactions':
        return S.of(context).transactions;
      case 'events':
        return S.of(context).events;
      case 'outreaches':
        return S.of(context).outreaches;
      case 'home_drawer':
        return S.of(context).home_drawer;
      case 'contact_drawer':
        return S.of(context).contact_drawer;
      case 'form':
        return S.of(context).form;

      default:
        return this;
    }
  }
}
