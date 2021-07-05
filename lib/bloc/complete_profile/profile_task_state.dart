part of 'profile_task_cubit.dart';

@immutable
abstract class ProfileTaskState {}

class ProfileTaskInitial extends ProfileTaskState {}

class ProfileTaskUpdate extends ProfileTaskState {
  final List<ProfileTaskModel> profileTasks;
  ProfileTaskUpdate({required this.profileTasks});
}
