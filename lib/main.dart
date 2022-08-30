import 'package:flutter/material.dart';
import 'package:numbers_trivia/models/model.dart';
import 'package:numbers_trivia/services/numbers_api.dart';

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
  TextEditingController textFieldController = TextEditingController();
  int number = 0;
  String text = '';
  @override
  void initState() {
    callForData();
    super.initState();
  }

  final NumbersApi _numbersApi = NumbersApi();
  void callForData() async {
    final response = await _numbersApi.getRandomNumbersFact();
    setState(() {
      number = NumberModel.fromMap(response).number!.toInt();
      text = NumberModel.fromMap(response).text.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: const Text('Numbers Trivia'),
        ),
        body: Column(
          children: <Widget>[
            // Container for the Trivia Text
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                    child: Text(
                  ' $text',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
                child: Column(
                  children: [
                    TextField(
                      controller: textFieldController,
                      decoration: InputDecoration(
                          label: const Text('Input a Number'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color?>(
                                        Colors.green[900]),
                              ),
                              onPressed: () async {
                                final response =
                                    await _numbersApi.getSpecificNumberFact(
                                        textFieldController.text.toString());
                                setState(() {
                                  number = NumberModel.fromMap(response)
                                      .number!
                                      .toInt();
                                  text = NumberModel.fromMap(response)
                                      .text
                                      .toString();
                                });
                              },
                              child: const Text('Search'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                          const TextStyle(color: Colors.black)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color?>(
                                          Colors.grey[600]),
                                ),
                                onPressed: () async {
                                  final response =
                                      await _numbersApi.getRandomNumbersFact();
                                  setState(() {
                                    number = NumberModel.fromMap(response)
                                        .number!
                                        .toInt();
                                    text = NumberModel.fromMap(response)
                                        .text
                                        .toString();
                                  });

                                  // print(response);
                                },
                                child: const Text('Get Random Trivia')),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )

            // Container for the textfield and button
          ],
        ));
  }
}
