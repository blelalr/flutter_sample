import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/page/state_management/cubit/counter_cubit.dart';

class CubitPage extends StatefulWidget {
  const CubitPage({Key? key}) : super(key: key);

  @override
  _CubitPageState createState() => _CubitPageState();
}

class _CubitPageState extends State<CubitPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => CounterCubit(),
        child: _BlocPageView());
  }
}


class _BlocPageView extends StatelessWidget {
  const _BlocPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit'),
      ),
      body: Center(
        child: CounterText(),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.endDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().incrementCounter(),
            child: Icon(Icons.add),
            heroTag: 'add'
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrementCounter(),
            child: Icon(Icons.remove),
            heroTag: 'minus'
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CounterCubit>().state;
    return Text(
        'The Count $state use Cubit',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20, // double
        )
    );
  }
}
