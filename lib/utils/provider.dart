import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState {
  int activeTab;

  AppState({required this.activeTab});
}

class UserState {
  int id;
  String role;
  String name;
  String email;

  UserState({
    required this.id,
    required this.role,
    required this.name,
    required this.email,
  });
}

final _appState = AppState(activeTab: 0);
final _userState = UserState(id: 0, role: '', name: '', email: '');
final appStateProvider = StateProvider((ref) => _appState);
final userStateProvider = StateProvider((ref) => _userState);
