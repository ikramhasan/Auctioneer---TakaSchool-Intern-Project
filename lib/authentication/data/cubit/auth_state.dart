part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class Unauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  AuthError({
    required this.message,
  });

  final String message;
}

class Authenticated extends AuthState {
  Authenticated(this.user);

  final User user;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Authenticated && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}
