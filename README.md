# caf_liveness_trial

Demo liveness failure on Android:

## Flutter Doctor:
```bash
[✓] Flutter (Channel stable, 3.10.5, on macOS 12.5 21G72 darwin-arm64, locale
    en-BR)
    • Flutter version 3.10.5 on channel stable at
      /Users/douglas/fvm/versions/3.10.5
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision 796c8ef792 (3 months ago), 2023-06-13 15:51:02 -0700
    • Engine revision 45f6e00911
    • Dart version 3.0.5
    • DevTools version 2.23.1

[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.1)
    • Android SDK at /Users/douglas/Library/Android/sdk
    • Platform android-33, build-tools 33.0.1
    • ANDROID_HOME = /Users/douglas/Library/Android/sdk
    • Java binary at: /Applications/Android
      Studio.app/Contents/jbr/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build
      17.0.6+0-17.0.6b829.9-10027231)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 14.1)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 14B47b
    • CocoaPods version 1.12.1

[✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] Android Studio (version 2022.3)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build
      17.0.6+0-17.0.6b829.9-10027231)

[✓] IntelliJ IDEA Community Edition (version 2023.2)
    • IntelliJ at /Applications/IntelliJ IDEA CE.app
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart

[✓] VS Code (version 1.81.1)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.72.0

[✓] Connected device (4 available)
    • SM A125M (mobile)         • RQ8T301CWNW   • android-arm64  • Android 12
      (API 31)
    • sdk gphone arm64 (mobile) • emulator-5554 • android-arm64  • Android 11
      (API 30) (emulator)
    • macOS (desktop)           • macos         • darwin-arm64   • macOS 12.5
      21G72 darwin-arm64
    • Chrome (web)              • chrome        • web-javascript • Google Chrome
      116.0.5845.187

[✓] Network resources
    • All expected network resources are available.
```

# Dependencies:
```yaml
new_face_liveness: ^1.2.2
document_detector:
    git:
        url: https://github.com/combateafraude/Flutter.git
        ref: document-detector-v6.1.0
```


## Steps to reproduce
Replace the `token` and `cpf` variables on `lib/main.dart`
Run the project on ANDROID in profile mode.

Click on any of the buttons on the bottom of the screen.

CRASH

### Liveness
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

### Document Detector
StackTrace:

```bash
I/RootBeer( 8436): LOOKING FOR BINARY: /vendor/bin/su Absent :(
I/RootBeer( 8436): LOOKING FOR BINARY: /vendor/xbin/su Absent :(
D/AndroidRuntime( 8436): Shutting down VM
E/AndroidRuntime( 8436): FATAL EXCEPTION: main
E/AndroidRuntime( 8436): Process: com.example.caf_liveness_trial, PID: 8436
E/AndroidRuntime( 8436): java.lang.NoClassDefFoundError: Failed resolution of: Landroidx/databinding/DataBinderMapperImpl;
E/AndroidRuntime( 8436): 	at androidx.databinding.DataBindingUtil.<clinit>(DataBindingUtil.java:32)
E/AndroidRuntime( 8436): 	at androidx.databinding.DataBindingUtil.setContentView(DataBindingUtil.java:284)
E/AndroidRuntime( 8436): 	at com.combateafraude.documentdetector.DocumentDetectorActivity.setCaptureMode(DocumentDetectorActivity.java:3)
E/AndroidRuntime( 8436): 	at com.combateafraude.documentdetector.DocumentDetectorActivity.e(DocumentDetectorActivity.java:12)
E/AndroidRuntime( 8436): 	at com.combateafraude.documentdetector.DocumentDetectorActivity.onCreate(DocumentDetectorActivity.java:24)
E/AndroidRuntime( 8436): 	at android.app.Activity.performCreate(Activity.java:8290)
E/AndroidRuntime( 8436): 	at android.app.Activity.performCreate(Activity.java:8270)
E/AndroidRuntime( 8436): 	at android.app.Instrumentation.callActivityOnCreate(Instrumentation.java:1329)
E/AndroidRuntime( 8436): 	at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:4009)
E/AndroidRuntime( 8436): 	at android.app.ActivityThread.handleLaunchActivity(ActivityThread.java:4201)
E/AndroidRuntime( 8436): 	at android.app.servertransaction.LaunchActivityItem.execute(LaunchActivityItem.java:103)
E/AndroidRuntime( 8436): 	at android.app.servertransaction.TransactionExecutor.executeCallbacks(TransactionExecutor.java:135)
E/AndroidRuntime( 8436): 	at android.app.servertransaction.TransactionExecutor.execute(TransactionExecutor.java:95)
E/AndroidRuntime( 8436): 	at android.app.ActivityThread$H.handleMessage(ActivityThread.java:2438)
E/AndroidRuntime( 8436): 	at android.os.Handler.dispatchMessage(Handler.java:106)
E/AndroidRuntime( 8436): 	at android.os.Looper.loopOnce(Looper.java:226)
E/AndroidRuntime( 8436): 	at android.os.Looper.loop(Looper.java:313)
E/AndroidRuntime( 8436): 	at android.app.ActivityThread.main(ActivityThread.java:8663)
E/AndroidRuntime( 8436): 	at java.lang.reflect.Method.invoke(Native Method)
E/AndroidRuntime( 8436): 	at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:571)
E/AndroidRuntime( 8436): 	at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:1135)
E/AndroidRuntime( 8436): Caused by: java.lang.ClassNotFoundException: Didn't find class "androidx.databinding.DataBinderMapperImpl" on path: DexPathList[[zip file "/data/app/~~kDNY3mDczMbeYFqYhEm-VA==/com.example.caf_liveness_trial--wj6KKKf39aKascJUiQYTA==/base.apk"],nativeLibraryDirectories=[/data/app/~~kDNY3mDczMbeYFqYhEm-VA==/com.example.caf_liveness_trial--wj6KKKf39aKascJUiQYTA==/lib/arm64, /data/app/~~kDNY3mDczMbeYFqYhEm-VA==/com.example.caf_liveness_trial--wj6KKKf39aKascJUiQYTA==/base.apk!/lib/arm64-v8a, /system/lib64, /system/system_ext/lib64]]
E/AndroidRuntime( 8436): 	at dalvik.system.BaseDexClassLoader.findClass(BaseDexClassLoader.java:259)
E/AndroidRuntime( 8436): 	at java.lang.ClassLoader.loadClass(ClassLoader.java:379)
E/AndroidRuntime( 8436): 	at java.lang.ClassLoader.loadClass(ClassLoader.java:312)
E/AndroidRuntime( 8436): 	... 21 more
I/Sentry  ( 8436): Not possible to read external files directory
I/Process ( 8436): Sending signal. PID: 8436 SIG: 9
```


## Falha no iOS:
```bash
dyld[89475]: Symbol not found: _$s10Starscream12PinningStateO6failedyACSo10CFErrorRefaSgcACmFWC
  Referenced from: <D768E1E7-AF46-3347-8802-64BCEE770069> /Users/douglas/Library/Developer/CoreSimulator/Devices/78E659F8-CD53-4E8F-9BD4-7B9F5E2CD13C/data/Containers/Bundle/Application/4B0207A1-38F5-4A38-900A-11AAFA38A354/Runner.app/Frameworks/iProov.framework/iProov
  Expected in:     <DED6362D-0622-3276-9EFF-E330DB14A23A> /Users/douglas/Library/Developer/CoreSimulator/Devices/78E659F8-CD53-4E8F-9BD4-7B9F5E2CD13C/data/Containers/Bundle/Application/4B0207A1-38F5-4A38-900A-11AAFA38A354/Runner.app/Frameworks/Starscream.framework/Starscream
Symbol not found: _$s10Starscream12PinningStateO6failedyACSo10CFErrorRefaSgcACmFWC
  Referenced from: <D768E1E7-AF46-3347-8802-64BCEE770069> /Users/douglas/Library/Developer/CoreSimulator/Devices/78E659F8-CD53-4E8F-9BD4-7B9F5E2CD13C/data/Containers/Bundle/Application/4B0207A1-38F5-4A38-900A-11AAFA38A354/Runner.app/Frameworks/iProov.framework/iProov
  Expected in:     <DED6362D-0622-3276-9EFF-E330DB14A23A> /Users/douglas/Library/Developer/CoreSimulator/Devices/78E659F8-CD53-4E8F-9BD4-7B9F5E2CD13C/data/Containers/Bundle/Application/4B0207A1-38F5-4A38-900A-11AAFA38A354/Runner.app/Frameworks/Starscream.framework/Starscream
dyld config: DYLD_SHARED_CACHE_DIR=/Users/douglas/Library/Developer/CoreSimulator/Caches/dyld/21G72/com.apple.CoreSimulator.SimRuntime.iOS-16-1.20B72 DYLD_ROOT_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot DYLD_LIBRARY_PATH=/Users/douglas/Library/Developer/Xcode/DerivedData/Runner-fvwsyyzqodzwqigonhvgdhpvkpwu/Build/Products/Debug-iphonesimulator:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/system/introspection DYLD_INSERT_LIBRARIES=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/libBacktraceRecording.dylib:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/libMainThreadChecker.dylib:/usr/lib/libRPAC.dylib:/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/Developer/Library/PrivateFrameworks/DTDDISupport.framework/libViewDebuggerSupport.dylib DYLD_FRAMEWORK_PATH=/Users/douglas/Library/Developer/Xcode/DerivedData/Runner-fvwsyyzqodzwqigonhvgdhpvkpwu/Build/Products/Debug-iphonesimulator DYLD_FALLBACK_FRAMEWORK_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/Frameworks DYLD_FALLBACK_LIBRARY_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib
(lldb) 
```