import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../schemas/user.dart';

class AppState {
  int activeTab;
  AppState({this.activeTab = 0});
}

final _userState = User();
final _appState = AppState();
final appStateProvider = StateProvider((ref) => _appState);
final userStateProvider = StateProvider((ref) => _userState);
