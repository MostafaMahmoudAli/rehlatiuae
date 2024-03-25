import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';
import 'package:rehlatyuae/features/profile/domain/repositories/profile_repo.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(const ProfileState.initial());

  Future<void> getProfile() async {
    emit(const ProfileState.loading());
    final results = await profileRepo.getProfile();
    results.fold(
      (error) => emit(ProfileState.error(error)),
      (client) => emit(ProfileState.loaded(client)),
    );
  }

  Future<void> deleteAccount() async {
    _update(const ProfileState.loading());
    final results = await profileRepo.deleteAccount();
    results.fold(
      (error) => _update(ProfileState.error(error)),
      (client) => _update(const ProfileState.deleteSuccess()),
    );
  }

  void _update(ProfileState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
