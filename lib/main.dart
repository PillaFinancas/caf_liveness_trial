import 'dart:developer';

// import 'package:document_detector/android/android_settings.dart';
// import 'package:document_detector/document_detector.dart';
// import 'package:document_detector/document_detector_step.dart';
// import 'package:document_detector/document_type.dart';
// import 'package:document_detector/result/document_detector_failure.dart';
// import 'package:document_detector/result/document_detector_result.dart';
// import 'package:document_detector/result/document_detector_success.dart';
import 'package:flutter/material.dart';
import 'package:new_face_liveness/passive_face_liveness.dart';
import 'package:new_face_liveness/result/passive_face_liveness_failure.dart';
import 'package:new_face_liveness/result/passive_face_liveness_result.dart';
import 'package:new_face_liveness/result/passive_face_liveness_success.dart';
import 'package:new_face_liveness/camera_filter.dart';
import 'package:new_face_liveness/caf_stage.dart';

void main() {
  runApp(
    const MyApp(),
  );
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

// const token = 'token';
const token = 'token';
const cpf = 'cpf';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _url = '';

  void _openLiveness() async {
    PassiveFaceLiveness passiveFaceLiveness =
        PassiveFaceLiveness(mobileToken: token, peopleId: cpf);
    passiveFaceLiveness.setCameraFilter(CameraFilter.NATURAL);
    passiveFaceLiveness.setEnableScreenshots(true);
    passiveFaceLiveness.setStage(CafStage.BETA);

    PassiveFaceLivenessResult passiveFaceLivenessResult =
        await passiveFaceLiveness.start();

    if (passiveFaceLivenessResult is PassiveFaceLivenessSuccess) {
      ('SDK finished with success, selfie picture registered');
      log('URL: ${passiveFaceLivenessResult.signedResponse}');
      setState(() {
        _url = passiveFaceLivenessResult.signedResponse ?? 'Sem url';
      });
    } else if (passiveFaceLivenessResult is PassiveFaceLivenessFailure) {
      log('SDK finished with failure and selfie picture not registered');
    } else {
      log('User closed the SDK');
    }
  }

  // void _openDocumentoscopy() async {
  //   DocumentDetector documentDetector = DocumentDetector(mobileToken: token);
  //   documentDetector.setDocumentFlow([
  //     DocumentDetectorStep(document: DocumentType.RG_FRONT),
  //     DocumentDetectorStep(document: DocumentType.RG_BACK),
  //   ]);
  //   documentDetector.setStage(CafStage.BETA);

  //   DocumentDetectorAndroidSettings androidSettings =
  //       DocumentDetectorAndroidSettings(
  //     useEmulator: true,
  //     useRoot: true,
  //     useDeveloperMode: true,
  //     useAdb: true,
  //     useDebug: true,
  //   );

  //   documentDetector.setAndroidSettings(androidSettings);

  //   DocumentDetectorResult documentDetectorResult =
  //       await documentDetector.start();

  //   if (documentDetectorResult is DocumentDetectorSuccess) {
  //     ('SDK finished with success, selfie picture registered');
  //     log('URL: ${documentDetectorResult.captures.first.imageUrl}');
  //     setState(() {
  //       _url = documentDetectorResult.captures.first.imageUrl ?? 'Sem url';
  //     });
  //   } else if (documentDetectorResult is DocumentDetectorFailure) {
  //     log('SDK finished with failure and selfie picture not registered');
  //   } else {
  //     log('User closed the SDK');
  //   }
  // }

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
              _url.isNotEmpty?_url.substring(0,100):_url,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        // OutlinedButton(
        //   onPressed: () {
        //     _openDocumentoscopy();
        //   },
        //   child: const Text('Documentoscopia'),
        // ),
        OutlinedButton(
          onPressed: () {
            _openLiveness();
          },
          child: const Text('Face Liveness'),
        ),
      ],
    );
  }
}
