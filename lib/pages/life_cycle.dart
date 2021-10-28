import 'package:flutter/material.dart';

class LifeCyclePage extends StatefulWidget {
  final int initValue;
  const LifeCyclePage({this.initValue = 0, Key? key}) : super(key: key);

  @override
  _LifeCyclePageState createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // 状态初始化
    _counter = widget.initValue;
    print('initState');
  }

  @override
  void didUpdateWidget(LifeCyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Stateful生命周期'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Text('加'),
            ),
            Builder(builder: (context) {
              return TextButton(
                onPressed: () {
                  ScaffoldState? _state = Scaffold.of(context);
                  // print(_state);
                  // 打开抽屉菜单
                  _state.openDrawer();
                },
                child: const Text('打开抽屉'),
              );
            }),
            Builder(builder: (context) {
              return TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 1000),
                      content: Text('我是SnackBar'),
                    ),
                  );
                },
                child: const Text('显示SnackBar'),
              );
            })
          ],
        ),
      ),
    );
  }
}
