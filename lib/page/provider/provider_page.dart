import 'package:flutter/material.dart';
import 'package:flutter_sample/page/provider/counter_provider.dart';
import 'package:provider/provider.dart';
class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CounterProvider(),
    child: _ProviderPageView());
  }
}

class _ProviderPageView extends StatelessWidget {
  const _ProviderPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var _count = Provider.of<Counter>(context).getCounter;
    return  Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: Center(
          child:Consumer<CounterProvider>(
            builder: (context, counter, child) => Text(
              'The Count ${counter.getCounter} use Provider',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20, // double
                )
            )
          )
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () => Provider.of<CounterProvider>(context, listen: false).incrementCount(),
                child: Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => Provider.of<CounterProvider>(context, listen: false).decrementCount(),
                child: Icon(Icons.remove),
              ),
            ],
        ),
      );
  }
}
