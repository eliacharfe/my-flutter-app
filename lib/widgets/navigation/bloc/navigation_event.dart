import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NavigationEvent {}

class HomeButtonPressedEvent extends NavigationEvent {}

class AboutButtonPressedEvent extends NavigationEvent {}

class TermsButtonPressedEvent extends NavigationEvent {}

class ContactButtonPressedEvent extends NavigationEvent {}

class SettingsButtonPressedEvent extends NavigationEvent {}

class ConnectivityChangedEvent extends NavigationEvent {
  final ConnectivityResult connectivityResult;
  ConnectivityChangedEvent(this.connectivityResult);
}
