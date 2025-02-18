import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hartman_web_view/screens/home/bloc/web_view_event.dart';
import 'package:hartman_web_view/screens/home/bloc/web_view_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WebViewController controller;

  HomeBloc(this.controller) : super(HomeInitial()) {
    on<LoadUrl>((event, emit) async {
      emit(HomeLoading());
      await controller.loadRequest(Uri.parse(event.url));
      emit(HomeSuccess());
    });

    on<RefreshWebView>((event, emit) async {
      await controller.reload();
      emit(HomeSuccess());
    });

    on<WebViewFailure>((event, emit) async {
      await controller.reload();
      emit(HomeError());
    });
  }
}
