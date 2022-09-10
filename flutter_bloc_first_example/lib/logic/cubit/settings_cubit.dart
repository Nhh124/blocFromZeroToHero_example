import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsInitial> {
  SettingsCubit()
      : super(const SettingsInitial(
            appNotificationss: false, emailNotifications: false));
  void toggleAppNotifications(bool newValue) {
    emit(state.copyWith(appNotifications: newValue));
  }

  void toggleEmailNotifications(bool newValue) =>
      emit(state.copyWith(emailNotifications: newValue));
}
