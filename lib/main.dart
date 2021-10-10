import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Budget App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> categories = <String>[]; // List of budget categories
  TextEditingController itemController = TextEditingController();

  void _addCategory(String input) {
    setState(() {
      categories.add(input);
    });
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
            Text(
              '$categories',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextFormField(
              controller: itemController,
              decoration: const InputDecoration(
                icon: Icon(Icons.library_add),
                hintText: 'Item Name',
                labelText: 'Item Name *',
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          _addCategory(itemController.text)
        },
        tooltip: 'Add List Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
