import 'package:flutter/material.dart';
import 'package:flutter_sample/page/dialog/dialog_component.dart';
import 'package:flutter_sample/bloc/dialog/dialog_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogManager {
  static void show(BuildContext context, DialogComponent component) {
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (component.title != null) Text('${component.title}'),
                    if (component.description != null)
                      Text('${component.description}'),
                    ListView(
                      shrinkWrap: true,
                      children:
                          List.generate(component.options.length, (index) {
                        return optionsItem(context, component, index);
                      }),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static void showBottomSheet(BuildContext context, DialogComponent component) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20), bottom: Radius.zero)),
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (component.title != null) Text('${component.title}'),
                  if (component.description != null)
                    Text('${component.description}'),
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(component.options.length, (index) {
                      return optionsItem(context, component, index);
                    }),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}

Widget optionsItem(BuildContext context, DialogComponent component, int index) {
  return ElevatedButton(
    onPressed: () {
      context.read<DialogCubit>().selectOnOption(index);
    },
    child: Text(
      '${component.options[index]}',
      style: TextStyle(color: Colors.white),
    ),
  );
}
