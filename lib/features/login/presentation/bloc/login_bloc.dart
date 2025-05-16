import 'package:clean_architecture_practice/features/login/domain/usecases/get_profile.dart';
import 'package:clean_architecture_practice/features/login/domain/usecases/login.dart';
import 'package:clean_architecture_practice/features/login/presentation/bloc/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final GetProfileUseCase getProfileUseCase;

  LoginBloc({required this.loginUseCase, required this.getProfileUseCase})
      : super(LoginInitial()) {
    on<OnLogin>(_onLogin);
    on<OnGetProfile>(_onGetProfile);
  }

  Future<void> _onLogin(OnLogin event, Emitter emit) async {
    emit(LoginLoading());
    final loginParams = event.loginParams;
    final result = await loginUseCase.call(loginParams);

    result.fold((failure) => emit(LoginError(message: failure.errorMessage)),
        (success) => emit(LoginSuccess(token: success)));
  }

  Future<void> _onGetProfile(OnGetProfile event, Emitter emit) async {
    emit(LoginLoading());
    final token = event.token;
    final result = await getProfileUseCase.call(token);
    result.fold((failure) => emit(LoginError(message: failure.errorMessage)),
        (user) => emit(GetProfile(userEntity: user)));
  }
}
