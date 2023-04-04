import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import '../common/tools.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  late VoidCallback _removeListener;

  @override
  void initState() {
    super.initState();

    ///添加事件响应者,监听native发往flutter端的事件
    _removeListener =
        BoostChannel.instance.addEventListener("native_to_flutter_event", (key, arguments) async {
          print('flutter接收 key:${key}');
          print('flutter接收 arguments:${arguments}');
          // return null;
        });
  }

  @override
  void dispose() {
    super.dispose();
    _removeListener.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: const Text('打开原生界面'),
              onPressed: () {
                BoostNavigator.instance
                    .push('go_to_SecondActivity') // Native页面路由
                    .then((value) => showToast('from native retval:$value'));
              },
            ),
            ElevatedButton(
              child: const Text('退出当前页面，返回参数给上一个Native页面'),
              onPressed: () {
                BoostNavigator.instance.pop({'retval': 'I am from dart'});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
