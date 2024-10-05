import 'package:diary/data/model/user.dart';
import 'package:equatable/equatable.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

final class AppState extends Equatable {
  const AppState({User user = User.empty})
      : this._(
          status: user == User.empty
              ? AppStatus.unauthenticated
              : AppStatus.authenticated,
          user: user,
        );

  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  final AppStatus status;
  final User user;

  @override
  List<Object?> get props => [status, user];
}
