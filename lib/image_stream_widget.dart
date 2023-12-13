import 'dart:async';

import 'package:channels/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ImageStreamWidget handles and displays streaming of image bytes
class ImageStreamWidget extends StatefulWidget {
  /// Initialize ImageStreamWidget with [key].
  const ImageStreamWidget({Key? key}) : super(key: key);

  @override
  _ImageStreamWidgetState createState() => _ImageStreamWidgetState();
}

class _ImageStreamWidgetState extends State<ImageStreamWidget> {
  final imageBytes = <int>[];
  int? imageSize;
  StreamSubscription<dynamic>? imageSubscription;
  bool streamComplete = false;

  final eventChannel = const EventChannel('platform_channel_events/image');

  @override
  Widget build(BuildContext context) {
    final imageStreamUnbegun = imageSize == null && !streamComplete;
    final imageStreamInProgress = imageSize != null && !streamComplete;
    final imageStreamEnded = imageSize != null && streamComplete;

    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      alignment: Alignment.center,
      child: Builder(builder: (c) {
        if (imageStreamUnbegun) {
          return ElevatedButton(
            onPressed: startImageStream,
            child: const Text('Stream Image'),
          );
        }

        if (imageStreamInProgress) {
          double progress;
          if (imageBytes.isEmpty || imageSize == 0) {
            progress = 0.0;
          } else {
            progress = (imageBytes.length / imageSize!);
          }

          return SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 3,
            ),
          );
        }

        if (imageStreamEnded) {
          return Image.memory(Uint8List.fromList(imageBytes));
        }

        return const SizedBox();
      }),
    );
  }

  @override
  void dispose() {
    imageSubscription?.cancel();
    super.dispose();
  }

  // oluşturduğumuz event channel'dan bize verilen stream'i dinle
  // her bir data akışında onReceiveImageByte metodunu tetikle
  void startImageStream() {
    imageSubscription = eventChannel.receiveBroadcastStream(
        {'quality': 0.9, 'chunkSize': 100}).listen(onReceiveImageByte);
  }

  void onReceiveImageByte(dynamic event) {
    // ilk event olup/olmadığı kontrol ediliyor.
    // ilk event: dosyanın boyutu
    if (imageSize == null && event is int && event != Constants.eof) {
      setState(() => imageSize = event);
      return;
    }

    // event bitti mi diye kontrol et
    // stream'i sonlandır
    if (event == Constants.eof) {
      imageSubscription?.cancel();
      setState(() => streamComplete = true);
      return;
    }

    // image byte'larını al ve birleştir
    final byteArray = (event as List<dynamic>).cast<int>();
    setState(() => imageBytes.addAll(byteArray));
  }
}
