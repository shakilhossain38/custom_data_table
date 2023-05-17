import 'package:example/data_table_widget.dart';
import 'package:example/table_title_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          _tableTitle(),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 50,
              itemBuilder: (context, index) {
                return _dataTable(index);
              }),
        ],
      ),
    );
  }

  Widget _dataTable(int index) {
    final width = MediaQuery.of(context).size.width - 40;
    return Column(
      children: [
        Row(
          children: [
            DataTableWidget(
              width / 5.6,
              'Value $index',
              shouldColorTop: true,
            ),
            DataTableWidget(width / 5, 'Value 1',
                shouldColorTop: true, shouldColorLeft: true),
            DataTableWidget(width / 5.8, 'Value 2',
                shouldColorTop: true, shouldColorLeft: true),
            DataTableWidget(width / 4.5, 'Value 3',
                shouldColorTop: true, shouldColorLeft: true),
            DataTableWidget(width / 4.5, 'Value 1',
                shouldColorTop: true, shouldColorLeft: true),
          ],
        )
      ],
    );
  }

  Widget _tableTitle() {
    final width = MediaQuery.of(context).size.width - 40;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TableTitle(width / 5.5, 'Title 0', shouldOffRight: false),
            TableTitle(width / 5, 'Title 1'),
            TableTitle(width / 5.8, 'Title 2'),
            TableTitle(width / 4.5, 'Title 3'),
            TableTitle(width / 4.5, 'Title 4'),
          ],
        )
      ],
    );
  }
}
