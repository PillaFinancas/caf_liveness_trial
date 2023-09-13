import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_face_liveness/passive_face_liveness.dart';
import 'package:new_face_liveness/result/passive_face_liveness_failure.dart';
import 'package:new_face_liveness/result/passive_face_liveness_result.dart';
import 'package:new_face_liveness/result/passive_face_liveness_success.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  String _url = '';

  void _openLiveness() async{
    const token = 'token';
    const cpf = 'cpf';
   PassiveFaceLiveness passiveFaceLiveness = PassiveFaceLiveness(mobileToken: token, peopleId: cpf);


PassiveFaceLivenessResult passiveFaceLivenessResult = await passiveFaceLiveness.start();

if (passiveFaceLivenessResult is PassiveFaceLivenessSuccess) {
('SDK finished with success, selfie picture registered');
  log('URL: ${passiveFaceLivenessResult.signedResponse}');
  setState(() {
    _url = passiveFaceLivenessResult.signedResponse??'Sem url';
  });
} else if (passiveFaceLivenessResult is PassiveFaceLivenessFailure) {
  log('SDK finished with failure and selfie picture not registered');
} else {
  log('User closed the SDK');
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'url:',
            ),
            Text(
              _url,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openLiveness,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
