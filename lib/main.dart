import 'package:flutter/material.dart';
import 'package:listingfromapi/api_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  late Future<List<Users>> users;

  @override
  void initState() {
    super.initState();
    users = getUsers();
    //  print("****************************************************************");
    // print("****************************************************************");
    // print("****************************************************************");
    // print(users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("deneme"),
      ),
      body: Center(
          child: FutureBuilder<List<Users>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].email),
                    trailing: Text(snapshot.data![index].username),
                  );
                });
          else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
