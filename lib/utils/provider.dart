import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../schemas/application.dart';
import '../schemas/mark.dart';
import '../schemas/notification.dart';
import '../schemas/paper.dart';
import '../schemas/user.dart';
import '../schemas/school.dart';
import '../schemas/subject.dart';
import '../schemas/combination.dart';
import '../schemas/calendar_event.dart';

class AppState {
  int activeTab;
  AppState({this.activeTab = 0});
}

final _userState = User();
final _markState = <Mark>[];
final _appState = AppState();
final _paperState = <Paper>[];
final _schoolState = <School>[];
final _subjectState = <Subject>[];
final _eventState = <CalendarEvent>[];
final _applicationState = <Application>[];
final _combinationState = <Combination>[];
final _notificationState = <Notifications>[];

final appStateProvider = StateProvider((ref) => _appState);
final userStateProvider = StateProvider((ref) => _userState);
final markStateProvider = StateProvider((ref) => _markState);
final paperStateProvider = StateProvider((ref) => _paperState);
final eventStateProvider = StateProvider((ref) => _eventState);
final schoolStateProvider = StateProvider((ref) => _schoolState);
final subjectStateProvider = StateProvider((ref) => _subjectState);
final applicationStateProvider = StateProvider((ref) => _applicationState);
final combinationStateProvider = StateProvider((ref) => _combinationState);
final notificationStateProvider = StateProvider((ref) => _notificationState);
