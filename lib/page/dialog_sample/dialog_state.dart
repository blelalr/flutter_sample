part of 'dialog_cubit.dart';

@immutable
abstract class DialogState {}

class DialogInitial extends DialogState {}

class DialogShow extends DialogState {
  final DialogComponent dialogComponent;
  DialogShow({required this.dialogComponent});
}

class DialogBottomShow extends DialogState {
  final DialogComponent dialogComponent;
  DialogBottomShow({required this.dialogComponent});
}

class DialogOnSelectedOption extends DialogState {
  final int selectIndex;
  DialogOnSelectedOption({required this.selectIndex});
}

class DialogDismiss extends DialogState {}
