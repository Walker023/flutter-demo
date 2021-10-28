import 'package:flutter/material.dart';

class ContextFindPage extends StatelessWidget {
  const ContextFindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('测试页面'),
      ),
      body: Builder(
        builder: (context) {
          Scaffold? scaffold =
              context.findAncestorWidgetOfExactType<Scaffold>();
          return (scaffold!.appBar as AppBar).title!;
        },
      ),
    );
  }
}
