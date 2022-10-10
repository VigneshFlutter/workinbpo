import 'package:flutter/material.dart';
import 'login_page.dart';
void main() {
runApp(MyApp());
}
class MyApp extends StatelessWidget {
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Create a Checkbox',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: MyHomePage());

}
}
class MyHomePage extends StatefulWidget {


@override
_MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
bool _checkbox = false;

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Create a Checkbox'),
),
body: Center(
child: Column(
children: [
Row(
children: [
Checkbox(
value: _checkbox,
onChanged: (value) {
setState(() {
_checkbox = !_checkbox;
});
},
),
Text('I am true now'),
],
),

],
),
),
);
}
}