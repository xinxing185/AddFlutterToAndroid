# AddFlutterToAndroid

The directory /android is the Host Android Project

The directory /flutter_module is the Flutter module project

flutter sdk version >= 1.12

BaseFlutterActivity extend the io.flutter.embedding.android.FlutterActivity, privide the CachedFlutterEngine, support NativePlugin using my FlutterNativeBridge, resolve the problem that the initRoute not working when using CachedFlutterEngine.
