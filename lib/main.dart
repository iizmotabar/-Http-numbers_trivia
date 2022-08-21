import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: const Text('Numbers Trivia'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container for the Trivia Text
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                // textAlign:  TextAlign.center,
                'This is the placeholder for the trivia interesting fact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            // Container for the textfield and button
            Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                      label: const Text('Input a Number'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color?>(
                            Colors.green[900]),
                      ),
                      onPressed: () {},
                      child: const Text('Search'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              const TextStyle(color: Colors.blue)),
                          backgroundColor: MaterialStateProperty.all<Color?>(
                              Colors.grey[300]),
                        ),
                        onPressed: () {},
                        child: const Text('Get Random Trivia')),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
