import 'package:flutter/material.dart';
import 'network_stream_widget.dart';

// * FLUTTER'DA PLATFORM CHANNELS
// * dart'tan native platform apilerinin cagrılmasını kolaylastıran bir dizi api'dir
// * bunlar; MessageChannel, MethodChannel, EventChannel
// * Bu API'ler, metodları çağırmak ve Java/Kotlin veya Objective-C/Swift ve Dart'ta yazılan kodlar arasında veri aktarmak için bir arayüz sağlar.

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Channels Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const _MyHomePage(title: 'Events Channel Demo'),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  final String title;

  const _MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          const NetworkStreamWidget(),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
