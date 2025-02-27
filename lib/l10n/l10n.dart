// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode 🌙`
  String get dark_mode {
    return Intl.message(
      'Dark Mode 🌙',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode ☀️`
  String get light_mode {
    return Intl.message(
      'Light Mode ☀️',
      name: 'light_mode',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Manage your account settings`
  String get manage_account {
    return Intl.message(
      'Manage your account settings',
      name: 'manage_account',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Notification Preferences`
  String get notification_preferences {
    return Intl.message(
      'Notification Preferences',
      name: 'notification_preferences',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Settings`
  String get privacy_settings {
    return Intl.message(
      'Privacy Settings',
      name: 'privacy_settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get selectedLanguage {
    return Intl.message(
      'English',
      name: 'selectedLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change your app language`
  String get change_language {
    return Intl.message(
      'Change your app language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get help_support {
    return Intl.message(
      'Help & Support',
      name: 'help_support',
      desc: '',
      args: [],
    );
  }

  /// `Get assistance with the app`
  String get help_support_text {
    return Intl.message(
      'Get assistance with the app',
      name: 'help_support_text',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `App Information`
  String get app_info {
    return Intl.message(
      'App Information',
      name: 'app_info',
      desc: '',
      args: [],
    );
  }

  /// `Application Information`
  String get app_info_title {
    return Intl.message(
      'Application Information',
      name: 'app_info_title',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Build Number`
  String get build_number {
    return Intl.message(
      'Build Number',
      name: 'build_number',
      desc: '',
      args: [],
    );
  }

  /// `Package Name`
  String get package_name {
    return Intl.message(
      'Package Name',
      name: 'package_name',
      desc: '',
      args: [],
    );
  }

  /// `App Name`
  String get app_name {
    return Intl.message(
      'App Name',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `You tapped on`
  String get tapped_on {
    return Intl.message(
      'You tapped on',
      name: 'tapped_on',
      desc: '',
      args: [],
    );
  }

  /// `Contact Me`
  String get contact_me {
    return Intl.message(
      'Contact Me',
      name: 'contact_me',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get about_me {
    return Intl.message(
      'About Me',
      name: 'about_me',
      desc: '',
      args: [],
    );
  }

  /// `I’m a passionate software developer dedicated to building high-quality apps, web apps, and websites for iOS, Android, and the Web. I specialize in crafting modern, scalable, and user-friendly solutions using the latest technologies and frameworks. Whether it's a sleek mobile app, a dynamic web platform, or a full-stack system, I thrive on turning ideas into reality with clean code and intuitive designs. Always eager to stay ahead of industry trends, I ensure that every project I work on is optimized for performance, security, and user experience.\nLet’s build something amazing together! 🔥`
  String get about_me_description {
    return Intl.message(
      'I’m a passionate software developer dedicated to building high-quality apps, web apps, and websites for iOS, Android, and the Web. I specialize in crafting modern, scalable, and user-friendly solutions using the latest technologies and frameworks. Whether it\'s a sleek mobile app, a dynamic web platform, or a full-stack system, I thrive on turning ideas into reality with clean code and intuitive designs. Always eager to stay ahead of industry trends, I ensure that every project I work on is optimized for performance, security, and user experience.\nLet’s build something amazing together! 🔥',
      name: 'about_me_description',
      desc: '',
      args: [],
    );
  }

  /// `Technical Skills`
  String get technical_skills {
    return Intl.message(
      'Technical Skills',
      name: 'technical_skills',
      desc: '',
      args: [],
    );
  }

  /// `Software`
  String get software_skills {
    return Intl.message(
      'Software',
      name: 'software_skills',
      desc: '',
      args: [],
    );
  }

  /// `Web`
  String get web_skills {
    return Intl.message(
      'Web',
      name: 'web_skills',
      desc: '',
      args: [],
    );
  }

  /// `Soft Skills`
  String get soft_skills {
    return Intl.message(
      'Soft Skills',
      name: 'soft_skills',
      desc: '',
      args: [],
    );
  }

  /// `Characteristic`
  String get characteristics {
    return Intl.message(
      'Characteristic',
      name: 'characteristics',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Software Developer`
  String get software_developer {
    return Intl.message(
      'Software Developer',
      name: 'software_developer',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `B.Sc Computer Science`
  String get bachelor_computer_science {
    return Intl.message(
      'B.Sc Computer Science',
      name: 'bachelor_computer_science',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get app_version {
    return Intl.message(
      'App Version',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `B.Sc Computer Science`
  String get bsc_computer_science {
    return Intl.message(
      'B.Sc Computer Science',
      name: 'bsc_computer_science',
      desc: '',
      args: [],
    );
  }

  /// `Software`
  String get software {
    return Intl.message(
      'Software',
      name: 'software',
      desc: '',
      args: [],
    );
  }

  /// `Web`
  String get web {
    return Intl.message(
      'Web',
      name: 'web',
      desc: '',
      args: [],
    );
  }

  /// `Characteristic`
  String get characteristic {
    return Intl.message(
      'Characteristic',
      name: 'characteristic',
      desc: '',
      args: [],
    );
  }

  /// `Autodidact`
  String get autodidact {
    return Intl.message(
      'Autodidact',
      name: 'autodidact',
      desc: '',
      args: [],
    );
  }

  /// `Hard Working`
  String get hard_working {
    return Intl.message(
      'Hard Working',
      name: 'hard_working',
      desc: '',
      args: [],
    );
  }

  /// `Creative`
  String get creative {
    return Intl.message(
      'Creative',
      name: 'creative',
      desc: '',
      args: [],
    );
  }

  /// `Cooperative`
  String get cooperative {
    return Intl.message(
      'Cooperative',
      name: 'cooperative',
      desc: '',
      args: [],
    );
  }

  /// `Problem Solver`
  String get problem_solver {
    return Intl.message(
      'Problem Solver',
      name: 'problem_solver',
      desc: '',
      args: [],
    );
  }

  /// `Stress Management`
  String get stress_management {
    return Intl.message(
      'Stress Management',
      name: 'stress_management',
      desc: '',
      args: [],
    );
  }

  /// `Hebrew - Native`
  String get hebrew_native {
    return Intl.message(
      'Hebrew - Native',
      name: 'hebrew_native',
      desc: '',
      args: [],
    );
  }

  /// `French - Native`
  String get french_native {
    return Intl.message(
      'French - Native',
      name: 'french_native',
      desc: '',
      args: [],
    );
  }

  /// `English - Fluent`
  String get english_fluent {
    return Intl.message(
      'English - Fluent',
      name: 'english_fluent',
      desc: '',
      args: [],
    );
  }

  /// `Flutter & Dart, Swift/SwiftUI, C/C++, Python, Java, C#, Javascript + React.js`
  String get flutter_and_dart {
    return Intl.message(
      'Flutter & Dart, Swift/SwiftUI, C/C++, Python, Java, C#, Javascript + React.js',
      name: 'flutter_and_dart',
      desc: '',
      args: [],
    );
  }

  /// `Object-Oriented Programming & Design`
  String get object_oriented_programming {
    return Intl.message(
      'Object-Oriented Programming & Design',
      name: 'object_oriented_programming',
      desc: '',
      args: [],
    );
  }

  /// `Design Patterns and SOLID Principles`
  String get design_patterns_and_solid {
    return Intl.message(
      'Design Patterns and SOLID Principles',
      name: 'design_patterns_and_solid',
      desc: '',
      args: [],
    );
  }

  /// `Databases & Data Structures`
  String get databases_and_data_structures {
    return Intl.message(
      'Databases & Data Structures',
      name: 'databases_and_data_structures',
      desc: '',
      args: [],
    );
  }

  /// `Parallel Programming (C/C++)`
  String get parallel_programming {
    return Intl.message(
      'Parallel Programming (C/C++)',
      name: 'parallel_programming',
      desc: '',
      args: [],
    );
  }

  /// `macOS, Windows, Linux Environments`
  String get macos_windows_linux_environments {
    return Intl.message(
      'macOS, Windows, Linux Environments',
      name: 'macos_windows_linux_environments',
      desc: '',
      args: [],
    );
  }

  /// `Flutter, JavaScript, Java, SQL`
  String get flutter_js_java_sql {
    return Intl.message(
      'Flutter, JavaScript, Java, SQL',
      name: 'flutter_js_java_sql',
      desc: '',
      args: [],
    );
  }

  /// `HTML, CSS, Bootstrap`
  String get html_css_bootstrap {
    return Intl.message(
      'HTML, CSS, Bootstrap',
      name: 'html_css_bootstrap',
      desc: '',
      args: [],
    );
  }

  /// `Node.js, Express, React JS, Spring Boot`
  String get node_express_react_springboot {
    return Intl.message(
      'Node.js, Express, React JS, Spring Boot',
      name: 'node_express_react_springboot',
      desc: '',
      args: [],
    );
  }

  /// `Backend + Frontend Web Development`
  String get backend_frontend_web_dev {
    return Intl.message(
      'Backend + Frontend Web Development',
      name: 'backend_frontend_web_dev',
      desc: '',
      args: [],
    );
  }

  /// `UX/UI design sense`
  String get ux_ui_design_sense {
    return Intl.message(
      'UX/UI design sense',
      name: 'ux_ui_design_sense',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_tab {
    return Intl.message(
      'Home',
      name: 'home_tab',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about_tab {
    return Intl.message(
      'About',
      name: 'about_tab',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks_tab {
    return Intl.message(
      'Tasks',
      name: 'tasks_tab',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact_tab {
    return Intl.message(
      'Contact',
      name: 'contact_tab',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_tab {
    return Intl.message(
      'Settings',
      name: 'settings_tab',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms {
    return Intl.message(
      'Terms',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get manual {
    return Intl.message(
      'Manual',
      name: 'manual',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_drawer {
    return Intl.message(
      'Home',
      name: 'home_drawer',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact_drawer {
    return Intl.message(
      'Contact',
      name: 'contact_drawer',
      desc: '',
      args: [],
    );
  }

  /// `Activities`
  String get activities {
    return Intl.message(
      'Activities',
      name: 'activities',
      desc: '',
      args: [],
    );
  }

  /// `Hide`
  String get hide {
    return Intl.message(
      'Hide',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_title {
    return Intl.message(
      'Home',
      name: 'home_title',
      desc: '',
      args: [],
    );
  }

  /// `Notes Section`
  String get notes_title {
    return Intl.message(
      'Notes Section',
      name: 'notes_title',
      desc: '',
      args: [],
    );
  }

  /// `There is no to notes to display`
  String get home_no_notes {
    return Intl.message(
      'There is no to notes to display',
      name: 'home_no_notes',
      desc: '',
      args: [],
    );
  }

  /// `There is no to dos to display`
  String get home_no_todos {
    return Intl.message(
      'There is no to dos to display',
      name: 'home_no_todos',
      desc: '',
      args: [],
    );
  }

  /// `Achievements`
  String get achievement_title {
    return Intl.message(
      'Achievements',
      name: 'achievement_title',
      desc: '',
      args: [],
    );
  }

  /// `Note deleted successfully`
  String get note_deleted {
    return Intl.message(
      'Note deleted successfully',
      name: 'note_deleted',
      desc: '',
      args: [],
    );
  }

  /// `To-Do List`
  String get todos_title {
    return Intl.message(
      'To-Do List',
      name: 'todos_title',
      desc: '',
      args: [],
    );
  }

  /// `Achievement`
  String get achievement {
    return Intl.message(
      'Achievement',
      name: 'achievement',
      desc: '',
      args: [],
    );
  }

  /// `This is a dialog modal in the center for Achievement 🚀.`
  String get achievement_dialog_description {
    return Intl.message(
      'This is a dialog modal in the center for Achievement 🚀.',
      name: 'achievement_dialog_description',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get progress {
    return Intl.message(
      'Progress',
      name: 'progress',
      desc: '',
      args: [],
    );
  }

  /// `Empty Section`
  String get empty_section_title {
    return Intl.message(
      'Empty Section',
      name: 'empty_section_title',
      desc: '',
      args: [],
    );
  }

  /// `There is no data to display.`
  String get empty_section {
    return Intl.message(
      'There is no data to display.',
      name: 'empty_section',
      desc: '',
      args: [],
    );
  }

  /// `Unable To Load`
  String get unable_to_load_title {
    return Intl.message(
      'Unable To Load',
      name: 'unable_to_load_title',
      desc: '',
      args: [],
    );
  }

  /// `Unable to load data, please try again`
  String get unable_to_load {
    return Intl.message(
      'Unable to load data, please try again',
      name: 'unable_to_load',
      desc: '',
      args: [],
    );
  }

  /// `Customized No Data`
  String get customized_no_data {
    return Intl.message(
      'Customized No Data',
      name: 'customized_no_data',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get projects {
    return Intl.message(
      'Projects',
      name: 'projects',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Events`
  String get upcoming_events {
    return Intl.message(
      'Upcoming Events',
      name: 'upcoming_events',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get no_data_available {
    return Intl.message(
      'No data available',
      name: 'no_data_available',
      desc: '',
      args: [],
    );
  }

  /// `Dialog Modal`
  String get dialog_modal_title {
    return Intl.message(
      'Dialog Modal',
      name: 'dialog_modal_title',
      desc: '',
      args: [],
    );
  }

  /// `This is a dialog modal in the center.`
  String get dialog_modal_content {
    return Intl.message(
      'This is a dialog modal in the center.',
      name: 'dialog_modal_content',
      desc: '',
      args: [],
    );
  }

  /// `Delete Todo`
  String get delete_button_title {
    return Intl.message(
      'Delete Todo',
      name: 'delete_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Delete`
  String get yes_delete {
    return Intl.message(
      'Yes, Delete',
      name: 'yes_delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this item?`
  String get delete_item_confirmation {
    return Intl.message(
      'Are you sure you want to delete this item?',
      name: 'delete_item_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Show all to-dos`
  String get show_all_todos {
    return Intl.message(
      'Show all to-dos',
      name: 'show_all_todos',
      desc: '',
      args: [],
    );
  }

  /// `Item deleted successfully`
  String get item_deleted_successfully {
    return Intl.message(
      'Item deleted successfully',
      name: 'item_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit Note`
  String get edit_note_title {
    return Intl.message(
      'Edit Note',
      name: 'edit_note_title',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get add_note_title {
    return Intl.message(
      'Add Note',
      name: 'add_note_title',
      desc: '',
      args: [],
    );
  }

  /// `Add To-Do`
  String get add_todo_title {
    return Intl.message(
      'Add To-Do',
      name: 'add_todo_title',
      desc: '',
      args: [],
    );
  }

  /// `All To-Dos`
  String get all_tasks_title {
    return Intl.message(
      'All To-Dos',
      name: 'all_tasks_title',
      desc: '',
      args: [],
    );
  }

  /// `Add New To-Do`
  String get add_new_todo {
    return Intl.message(
      'Add New To-Do',
      name: 'add_new_todo',
      desc: '',
      args: [],
    );
  }

  /// `To-Do Completed`
  String get todo_completed {
    return Intl.message(
      'To-Do Completed',
      name: 'todo_completed',
      desc: '',
      args: [],
    );
  }

  /// `Delete To-Do`
  String get delete_todo {
    return Intl.message(
      'Delete To-Do',
      name: 'delete_todo',
      desc: '',
      args: [],
    );
  }

  /// `View on GitHub`
  String get view_on_github {
    return Intl.message(
      'View on GitHub',
      name: 'view_on_github',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Outreaches`
  String get outreaches {
    return Intl.message(
      'Outreaches',
      name: 'outreaches',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `Hebrew`
  String get hebrew {
    return Intl.message(
      'Hebrew',
      name: 'hebrew',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get spanish {
    return Intl.message(
      'Spanish',
      name: 'spanish',
      desc: '',
      args: [],
    );
  }

  /// `Quick Transactions`
  String get quick_transactions {
    return Intl.message(
      'Quick Transactions',
      name: 'quick_transactions',
      desc: '',
      args: [],
    );
  }

  /// `Easily manage your transactions.`
  String get quick_transactions_desc {
    return Intl.message(
      'Easily manage your transactions.',
      name: 'quick_transactions_desc',
      desc: '',
      args: [],
    );
  }

  /// `Secure Payments`
  String get secure_payments {
    return Intl.message(
      'Secure Payments',
      name: 'secure_payments',
      desc: '',
      args: [],
    );
  }

  /// `Encrypted transactions for safety.`
  String get secure_payments_desc {
    return Intl.message(
      'Encrypted transactions for safety.',
      name: 'secure_payments_desc',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `Schedule Appointments`
  String get schedule_appointments {
    return Intl.message(
      'Schedule Appointments',
      name: 'schedule_appointments',
      desc: '',
      args: [],
    );
  }

  /// `Book and manage appointments.`
  String get schedule_appointments_desc {
    return Intl.message(
      'Book and manage appointments.',
      name: 'schedule_appointments_desc',
      desc: '',
      args: [],
    );
  }

  /// `Reminders`
  String get reminders {
    return Intl.message(
      'Reminders',
      name: 'reminders',
      desc: '',
      args: [],
    );
  }

  /// `Get notified about upcoming events.`
  String get reminders_desc {
    return Intl.message(
      'Get notified about upcoming events.',
      name: 'reminders_desc',
      desc: '',
      args: [],
    );
  }

  /// `Real-time Alerts`
  String get real_time_alerts {
    return Intl.message(
      'Real-time Alerts',
      name: 'real_time_alerts',
      desc: '',
      args: [],
    );
  }

  /// `Stay updated instantly.`
  String get real_time_alerts_desc {
    return Intl.message(
      'Stay updated instantly.',
      name: 'real_time_alerts_desc',
      desc: '',
      args: [],
    );
  }

  /// `Custom Notifications`
  String get custom_notifications {
    return Intl.message(
      'Custom Notifications',
      name: 'custom_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Set preferences for alerts.`
  String get custom_notifications_desc {
    return Intl.message(
      'Set preferences for alerts.',
      name: 'custom_notifications_desc',
      desc: '',
      args: [],
    );
  }

  /// `User Guide`
  String get user_guide {
    return Intl.message(
      'User Guide',
      name: 'user_guide',
      desc: '',
      args: [],
    );
  }

  /// `Step-by-Step Tutorials`
  String get step_by_step_tutorials {
    return Intl.message(
      'Step-by-Step Tutorials',
      name: 'step_by_step_tutorials',
      desc: '',
      args: [],
    );
  }

  /// `Learn how to use all features.`
  String get step_by_step_tutorials_desc {
    return Intl.message(
      'Learn how to use all features.',
      name: 'step_by_step_tutorials_desc',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Find answers to common questions.`
  String get faq_desc {
    return Intl.message(
      'Find answers to common questions.',
      name: 'faq_desc',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get form {
    return Intl.message(
      'Form',
      name: 'form',
      desc: '',
      args: [],
    );
  }

  /// `Event Description`
  String get event_description {
    return Intl.message(
      'Event Description',
      name: 'event_description',
      desc: '',
      args: [],
    );
  }

  /// `Item deleted successfully`
  String get delete_item_success {
    return Intl.message(
      'Item deleted successfully',
      name: 'delete_item_success',
      desc: '',
      args: [],
    );
  }

  /// `Note added`
  String get note_added {
    return Intl.message(
      'Note added',
      name: 'note_added',
      desc: '',
      args: [],
    );
  }

  /// `Note edited`
  String get note_edited {
    return Intl.message(
      'Note edited',
      name: 'note_edited',
      desc: '',
      args: [],
    );
  }

  /// `Todo marked as completed`
  String get todo_marked_completed {
    return Intl.message(
      'Todo marked as completed',
      name: 'todo_marked_completed',
      desc: '',
      args: [],
    );
  }

  /// `Todo marked as incomplete`
  String get todo_marked_incomplete {
    return Intl.message(
      'Todo marked as incomplete',
      name: 'todo_marked_incomplete',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'he'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
