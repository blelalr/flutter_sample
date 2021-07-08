import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/page/dialog/dialog_component.dart';
import 'package:flutter_sample/bloc/dialog/dialog_cubit.dart';
import 'package:flutter_sample/page/dialog/dialog_page.dart';
import 'package:flutter_sample/page/state_management/bloc/counter_bloc.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterBloc(),
        child: _BlocPageView());
  }
// Widget build(BuildContext context) {
//   return MultiBlocProvider(
//       providers: [BlocProvider(create: (BuildContext context) => CounterBloc())],
//       child: _BlocPageView());
// }
}

class _BlocPageView extends StatelessWidget with MixinDialog {
  const _BlocPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DialogCubit, DialogState>(
        listener: (context, state) {
          dialogHandler(context, state);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text('Bloc'),
            ),
            body: Container(
              child: Center(
                child: BlocBuilder<CounterBloc, int>(
                  builder: (context, state) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('The Count $state use Bloc',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20, // double
                              )),
                          SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () => context
                                  .read<DialogCubit>()
                                  .showBottomDialog(DialogComponent(
                                      title:
                                          'DialogTitle jfj ewfijw ifoew fowegewge wg wegwergr egtewgt ewhtehtwhtwr',
                                      options: [
                                        'First Button',
                                        'Second Button',
                                        'Third Button'
                                      ],
                                      type: DialogType.Bottom)),
                              child: Text('Show Dialog'))
                        ]);
                  },
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                    onPressed: () =>
                        context.read<CounterBloc>().add(IncrementEvent()),
                    child: Icon(Icons.add),
                    heroTag: 'add'),
                const SizedBox(height: 10),
                FloatingActionButton(
                    onPressed: () =>
                        context.read<CounterBloc>().add(DecrementEvent()),
                    child: Icon(Icons.remove),
                    heroTag: 'minus'),
              ],
            )));
  }
}
