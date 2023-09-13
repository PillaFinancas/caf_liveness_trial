# caf_liveness_trial

Demo liveness failure.

## Steps to reproduce
Replace the `token` and `cpf` variables on `lib/main.dart`
Run the project in profile mode.

Click on the FloatingButton.

CRASH


StackTrace:
```bash
W/_liveness_tria(29637): Accessing hidden method Ljava/lang/invoke/MethodHandles$Lookup;-><init>(Ljava/lang/Class;I)V (unsupported, reflection, allowed)
E/AndroidRuntime(29637): FATAL EXCEPTION: Thread-6
E/AndroidRuntime(29637): Process: com.example.caf_liveness_trial, PID: 29637
E/AndroidRuntime(29637): java.lang.NullPointerException: Attempt to invoke virtual method 'java.lang.String com.caf.facelivenessiproov.server.models.response.TokenLivenessResponse.getToken()' on a null object reference
E/AndroidRuntime(29637): 	at com.caf.facelivenessiproov.viewmodel.FaceLivenessController.lambda$launchIProov$0$com-caf-facelivenessiproov-viewmodel-FaceLivenessController(FaceLivenessController.java:63)
E/AndroidRuntime(29637): 	at com.caf.facelivenessiproov.viewmodel.FaceLivenessController$$ExternalSyntheticLambda1.run(Unknown Source:2)
E/AndroidRuntime(29637): 	at java.lang.Thread.run(Thread.java:1012)
I/Process (29637): Sending signal. PID: 29637 SIG: 9
```