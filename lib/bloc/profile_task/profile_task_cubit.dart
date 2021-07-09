import 'package:bloc/bloc.dart';
import 'package:flutter_sample/model/profile_task.dart';
import 'package:meta/meta.dart';

part 'profile_task_state.dart';

class ProfileTaskCubit extends Cubit<ProfileTaskState> {
  ProfileTaskCubit() : super(ProfileTaskInitial());

  void fetchProfileTask() {
    emit(ProfileTaskUpdate(profileTasks: getFakeData()));
  }

  void deleteProfileTask(ProfileTask profileTaskModel) {
    if (state is ProfileTaskUpdate) {
      (state as ProfileTaskUpdate).profileTasks.remove(profileTaskModel);
      emit(ProfileTaskUpdate(
          profileTasks: (state as ProfileTaskUpdate).profileTasks));
    }
  }

  List<ProfileTask> getFakeData() => [
        ProfileTask('0', 'assets/icon/icon_profile.svg', 'This is First Task.',
            'This is First Task Content.', 'buttonText', false),
        ProfileTask('1', 'assets/icon/icon_profile.svg', 'This is Second Task.',
            'This is Second Task Content.', 'buttonText', false),
        ProfileTask(
            '2',
            'assets/icon/icon_profile.svg',
            'This is Third Task.',
            'This is Third content This is Third content \nThis is Third content This is Third content',
            'buttonText',
            false),
        ProfileTask('3', 'assets/icon/icon_profile.svg', 'This is fourth Task.',
            'This is fourth content', 'buttonText', false)
      ];
}
