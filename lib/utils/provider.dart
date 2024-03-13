import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState {
  int activeTab;
  AppState({this.activeTab = 0});
}

class UserState {
  int id;
  String role;
  String name;
  String email;
  UserState({this.id = 0, this.role = '', this.name = '', this.email = ''});
}

final _appState = AppState();
final _userState = UserState();
final appStateProvider = StateProvider((ref) => _appState);
final userStateProvider = StateProvider((ref) => _userState);
