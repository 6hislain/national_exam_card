import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../schemas/user.dart';
import '../schemas/school.dart';
import '../schemas/subject.dart';
import '../schemas/combination.dart';

class AppState {
  int activeTab;
  AppState({this.activeTab = 0});
}

final _userState = User();
final _appState = AppState();
final _schoolState = <School>[];
final _subjectState = <Subject>[];
final _combinationState = <Combination>[];

final appStateProvider = StateProvider((ref) => _appState);
final userStateProvider = StateProvider((ref) => _userState);
final schoolStateProvider = StateProvider((ref) => _schoolState);
final subjectStateProvider = StateProvider((ref) => _subjectState);
final combinationStateProvider = StateProvider((ref) => _combinationState);
