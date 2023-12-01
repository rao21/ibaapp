import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibaapp/bloc/user_bloc.dart/user_event.dart';
import 'package:ibaapp/bloc/user_bloc.dart/user_states.dart';
import 'package:ibaapp/core/repository/user_repo.dart';
import 'package:ibaapp/models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserLoading()) {
    on<FetchUser>((event, emit) async {
      await _getUser(emit);
    });
    on<FetchUserMoc>((event, emit) async {
      await _getUserMoc(emit);
    });
  }

  Future<void> _getUser(Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final List<User> user = await userRepository.getuser();
      emit(UserLoaded(user: user));
    } catch (e) {
      emit(UserError(errorMsg: e.toString()));
    }
  }

  Future<void> _getUserMoc(Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final List<User> user = await userRepository.getUserMoc();
      emit(UserLoaded(user: user));
    } catch (e) {
      emit(UserError(errorMsg: e.toString()));
    }
  }
}
