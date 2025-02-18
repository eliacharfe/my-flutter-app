abstract class HomeEvent {}

class LoadUrl extends HomeEvent {
  final String url;
  LoadUrl(this.url);
}

class RefreshWebView extends HomeEvent {}

class WebViewFailure extends HomeEvent {}
