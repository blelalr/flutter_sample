import 'package:bloc/bloc.dart';
import 'package:flutter_sample/model/dialog_component.dart';
import 'package:meta/meta.dart';

part 'dialog_state.dart';

class DialogCubit extends Cubit<DialogState> {
  DialogCubit() : super(DialogInitial());

  void showDialog(DialogComponent dialogComponent) {
    emit(DialogShow(dialogComponent: dialogComponent));
  }

  void dismissDialog() {
    emit(DialogDismiss());
  }

  void showBottomDialog(DialogComponent dialogComponent) {
    emit(DialogBottomShow(dialogComponent: dialogComponent));
  }

  void selectOnOption(int selectIndex) {
    emit(DialogDismiss());
    emit(DialogOnSelectedOption(selectIndex: selectIndex));
  }
}
