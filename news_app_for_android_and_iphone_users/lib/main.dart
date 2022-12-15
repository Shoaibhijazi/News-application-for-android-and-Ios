import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void TopNewsUs() async{
   var NewsApiUri = Uri.http("https://newsapi.org/v2/top-headlines?country=us&apiKey=API_KEY");
  
   var response = await http.get(NewsApiUri);
   print(response.body);
   print(response.statusCode);

   return Future( () => response.body);
  
  }

  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();
    TopNewsUs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News 360"),
      ),
    );
  }
}