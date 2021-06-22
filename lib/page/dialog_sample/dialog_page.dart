import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/page/dialog_sample/dialog_component.dart';
import 'package:flutter_sample/page/dialog_sample/dialog_cubit.dart';
import 'package:flutter_sample/page/dialog_sample/dialog_manager.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dialog Sample'),
        ),
        body: DialogPageView(),
        );
  }
}

// class DialogPageView extends StatefulWidget {
//   @override
//   _DialogPageViewState createState() => _DialogPageViewState();
// }
//
// class _DialogPageViewState extends State<DialogPageView> {
//   final DialogCubit _dialogBloc = DialogCubit();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DialogCubit, DialogState>(
//       bloc: _dialogBloc,
//       builder: (context, state) {
//         if (state is DialogShow) {
//           print('Dialog DialogShow');
//           DialogManager.show(context, state.dialogComponent, _dialogBloc);
//         } else if(state is DialogOnSelectedOption){
//           _dialogBloc.dismissDialog();
//           print('Dialog Select Index : ${state.selectIndex}');
//           SchedulerBinding.instance?.addPostFrameCallback((_) {
//             final snackBar = SnackBar(
//                 duration: const Duration(milliseconds: 300),
//                 content: Text('Dialog Select Index : ${state.selectIndex}')
//             );
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           });
//
//         } else if(state is DialogDismiss) {
//           print('Dialog Dismiss');
//           DialogManager.dismiss(context);
//         }
//         return Container(
//             child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(height: 30),
//                     ElevatedButton(
//                       onPressed: () {
//                         _dialogBloc.showDialog(DialogComponent(
//                             title: 'Title Of Basic Dialog',
//                             description: 'Basic Dialog Description',
//                             options: ['Option 1','Option 2','Option 3'],
//                             type: DialogType.Basic));
//                       },
//                       child: const Text('Basic Dialog'),
//                     ),
//                     const SizedBox(height: 30),
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: const Text('Dialog with simple options'),
//                     ),
//                     const SizedBox(height: 30),
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: const Text('Dialog with multi options'),
//                     )
//                   ],
//                 )));
//
//       });
//   }
//
// }

mixin MixinDialog on StatelessWidget {
  dialogHandler(context, state) {
    if (state is DialogShow) {
      print('Dialog DialogShow');
      DialogManager.show(context, state.dialogComponent);
    } if (state is DialogBottomShow) {
      DialogManager.showBottomSheet(context, state.dialogComponent);
    }else if (state is DialogDismiss) {
      print('Dialog Dismiss');
      DialogManager.dismiss(context);
    }
  }
}

class DialogPageView extends StatelessWidget with MixinDialog {
  const DialogPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DialogCubit, DialogState>(
      listener: (context, state) {
        dialogHandler(context, state);
        if (state is DialogOnSelectedOption) {
          print('Dialog Select Index : ${state.selectIndex}');
          final snackBar = SnackBar(
              duration: const Duration(milliseconds: 300),
              content: Text('Dialog Select Index : ${state.selectIndex}'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Container(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.read<DialogCubit>().showDialog(DialogComponent(
                    title: 'Title Of Basic Dialog',
                    description: 'Basic Dialog Description',
                    options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
                    type: DialogType.Basic));
              },
              child: const Text('Basic Dialog'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.read<DialogCubit>().showBottomDialog(DialogComponent(
                    title: 'Title Of Basic Dialog',
                    description: 'Basic Dialog Description',
                    options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
                    type: DialogType.Bottom));
              },
              child: const Text('Dialog Bottom Sheet'),
            )
          ],
        ))));
  }
}
