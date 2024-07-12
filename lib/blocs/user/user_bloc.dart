import 'package:binh_thuan/repo/user/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:binh_thuan/models/models.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const Initial()) {
    on<UserStarted>((event, emit) async {
      final result = await _userRepository.getUsers();
      emit(Loaded(result.data ?? []));
    });
  }
}
