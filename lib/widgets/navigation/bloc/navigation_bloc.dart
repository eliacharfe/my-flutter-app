import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eliachar_feig/widgets/navigation/bloc/navigation_event.dart';
import 'package:eliachar_feig/widgets/navigation/bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final Connectivity connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  NavigationBloc({required this.connectivity}) : super(NavigationInitial()) {
    on<HomeButtonPressedEvent>((event, emit) {
      emit(HomeState());
    });

    on<AboutButtonPressedEvent>((event, emit) {
      emit(AboutState());
    });

    on<TermsButtonPressedEvent>((event, emit) {
      emit(TermsState());
    });

    on<ActivitiesButtonPressedEvent>((event, emit) {
      emit(ActivityState());
    });

    on<ContactButtonPressedEvent>((event, emit) {
      emit(ContactState());
    });

    on<SettingsButtonPressedEvent>((event, emit) {
      emit(SettingsState());
    });

    on<ConnectivityChangedEvent>((event, emit) {
      if (event.connectivityResult == ConnectivityResult.none) {
        emit(NoConnectionState());
      } else {
        emit(HomeState());
      }
    });

    _connectivitySubscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      add(ConnectivityChangedEvent(result));
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
