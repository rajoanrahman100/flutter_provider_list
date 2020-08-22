import 'package:flutter/material.dart';
import 'package:flutterproviderlist/dataclass.dart';
import 'package:flutterproviderlist/providerclass.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataProvider())
    ],
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  hitAPI()async{
    DataClass dataClass=await Provider.of<DataProvider>(context).hitAPi();
    Provider.of<DataProvider>(context).setData(dataClass);
  }

  @override
  Widget build(BuildContext context) {

    hitAPI();

    print(Provider.of<DataProvider>(context).getData().title
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Provider List"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (_, index) {
              return ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text("OK"),
              );
            }),
      ),
    );
  }
}
