import 'package:bloc/bloc.dart';
import 'package:flutter_sample/model/profile_task_model.dart';
import 'package:meta/meta.dart';

part 'complete_profile_state.dart';

class ProfileTaskCubit extends Cubit<ProfileTaskState> {
  ProfileTaskCubit() : super(ProfileTaskInitial());

  void fetchProfileTask() {
    List<ProfileTaskModel> profileTasks = getFakeData();

    emit(ProfileTaskUpdate(profileTasks: profileTasks));
  }

  void deleteCompleteTask(ProfileTaskModel profileTaskModel) {
    if (state is ProfileTaskUpdate) {
      (state as ProfileTaskUpdate).profileTasks.remove(profileTaskModel);
      emit(ProfileTaskUpdate(
          profileTasks: (state as ProfileTaskUpdate).profileTasks));
    }
  }

  List<ProfileTaskModel> getFakeData() => [
        ProfileTaskModel(
            '0',
            'assets/icon/icon_profile.svg',
            'This is First Task.',
            'This is First Task Content.',
            'buttonText',
            false),
        ProfileTaskModel(
            '1',
            'assets/icon/icon_profile.svg',
            'This is Second Task.',
            'This is Second Task Content.',
            'buttonText',
            false),
        ProfileTaskModel(
            '2',
            'assets/icon/icon_profile.svg',
            'This is Third Task.',
            'This is Third content This is Third content \nThis is Third content This is Third content',
            'buttonText',
            false),
        ProfileTaskModel(
            '3',
            'assets/icon/icon_profile.svg',
            'This is fourth Task.',
            'This is fourth content',
            'buttonText',
            false)
      ];
}
