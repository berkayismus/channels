import 'package:channels/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// NetworkStreamWidget handles and displays streaming of network events
class NetworkStreamWidget extends StatelessWidget {
  /// Initialize NetworkStreamWidget with [key].
  const NetworkStreamWidget({Key? key}) : super(key: key);

  // bir event channel oluşturalım
  // 'platform_channel_events/connectivity' channel'ın adıdır ve benzersiz olmalıdır
  final _eventChannel =
      const EventChannel('platform_channel_events/connectivity');

  @override
  Widget build(BuildContext context) {
    // bağlantı durumu değiştiğinde, onu bir connection tutan stream'e mapler
    final networkStream = _eventChannel
        .receiveBroadcastStream()
        .distinct()
        .map((dynamic event) => intToConnection(event as int));

    // * networkStream'i dinleyip, bir değişiklik olduğunda ekranda gösterelim
    return StreamBuilder<Connection>(
      stream: networkStream,
      initialData: Connection.disconnected,
      builder: (BuildContext context, AsyncSnapshot<Connection> snapshot) {
        final connection = snapshot.data ?? Connection.unknown;
        final message = getConnectionMessage(connection);
        final color = getConnectionColor(connection);
        return _NetworkStateWidget(message: message, color: color);
      },
    );
  }
}

class _NetworkStateWidget extends StatelessWidget {
  final String message;
  final Color color;

  const _NetworkStateWidget({required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: color,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      duration: kThemeAnimationDuration,
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
