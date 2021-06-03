import 'package:auctioneer/authentication/data/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(
          authRepository.isSignedIn()
              ? Authenticated(authRepository.user!)
              : Unauthenticated(),
        );

  final AuthRepository _authRepository;

  Future loginWithGoogle() async {
    emit(AuthLoading());

    try {
      User user = await _authRepository.loginWithGoogle();
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(message: 'Error signing in!'));
    }
  }
}
