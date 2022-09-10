part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState(
      {required this.appNotifications, required this.emailNotifications});
  final bool appNotifications;
  final bool emailNotifications;

  @override
  List<Object> get props => [emailNotifications, appNotifications];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial(
      {required bool appNotificationss, required bool emailNotifications})
      : super(
            appNotifications: appNotificationss,
            emailNotifications: emailNotifications);

  SettingsInitial copyWith({
    bool? appNotifications,
    bool? emailNotifications,
  }) {
    return SettingsInitial(
      appNotificationss: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }
}
