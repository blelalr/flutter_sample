import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/profile_task/profile_task_cubit.dart';
import 'package:flutter_sample/bloc/theme/theme_cubit.dart';
import 'package:flutter_sample/model/profile_task.dart';
import 'package:flutter_sample/res/app_colors.dart';
import 'package:flutter_sample/res/app_fonts.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTaskFrame extends StatelessWidget {
  const ProfileTaskFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileTaskCubit>(
        create: (context) => ProfileTaskCubit()..fetchProfileTask(),
        child: BuildProfileTaskView());
  }
}

class ProfileTaskItem extends StatelessWidget {
  final ProfileTask profileTaskModel;
  const ProfileTaskItem(this.profileTaskModel, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            constraints: BoxConstraints(minHeight: 136),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: context.watch<ThemeCubit>().isDarkMode
                  ? AppColors.BackgroundElevatedDark1st
                  : AppColors.BackgroundElevatedLight1st,
              border: Border.all(
                color: context.watch<ThemeCubit>().isDarkMode
                    ? AppColors.innerBorderDark
                    : AppColors.innerBorderLight,
                width: 1,
              ),
            ),
            width: 220,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 15, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('${profileTaskModel.iconPath}',
                          width: 20,
                          height: 20,
                          color: Theme.of(context).iconTheme.color),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            '${profileTaskModel.title}',
                            style: AppFonts.button(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 12),
                      width: double.infinity,
                      height: double.infinity,
                      child: Text(
                        '${profileTaskModel.content}',
                        style: AppFonts.caption(
                            textColor: Theme.of(context).hintColor),
                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 0.5,
                      color: AppColors.line83),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    width: double.infinity,
                    child: Text(
                      '${profileTaskModel.buttonText}',
                      textAlign: TextAlign.center,
                      style: AppFonts.button(
                          textColor: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              ),
            )),
        Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => {
                context
                    .read<ProfileTaskCubit>()
                    .deleteProfileTask(profileTaskModel)
              },
              child: SvgPicture.asset('assets/icon/icon_close.svg',
                  color: Theme.of(context).hintColor, width: 20, height: 20),
            ))
      ],
    );
  }
}

class BuildProfileTaskView extends StatelessWidget {
  // final List<Widget> widgets;
  const BuildProfileTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: BlocBuilder<ProfileTaskCubit, ProfileTaskState>(
            builder: (context, state) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                    updateProfileTask(state).length,
                    (index) =>
                        ProfileTaskItem(updateProfileTask(state)[index])),
              );
            },
          ),
        ));
  }

  List<ProfileTask> updateProfileTask(ProfileTaskState state) {
    if (state is ProfileTaskUpdate) {
      return state.profileTasks;
    } else {
      return [];
    }
  }
}
