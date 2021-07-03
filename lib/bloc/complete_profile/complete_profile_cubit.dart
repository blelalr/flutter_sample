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
        ProfileTaskModel('0', 'assets/icon/icon_profile.svg', 'This is title.',
            'content', 'buttonText', false),
        ProfileTaskModel('1', 'assets/icon/icon_profile.svg', 'This is title.',
            'content', 'buttonText', false),
        ProfileTaskModel(
            '2',
            'assets/icon/icon_profile.svg',
            'This is title.',
            'this is content this is content\nthis is content this is content\nthis is content this is content',
            'buttonText',
            false),
        ProfileTaskModel('3', 'assets/icon/icon_profile.svg', 'This is title.',
            'content', 'buttonText', false)
      ];
}
