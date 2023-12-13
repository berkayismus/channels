import 'package:channels/constants.dart';
import 'package:flutter/material.dart';

/// Ağ durumları için [Connection] enum
enum Connection {
  /// bağlantı durumu [Constants.wifi] olduğunda
  wifi,

  /// bağlantı durumu [Constants.cellular] olduğunda
  cellular,

  /// bağlantı durumu [Constants.disconnected] olduğunda
  disconnected,

  /// bağlantı durumu [Constants.unknown] olduğunda
  unknown
}

Connection intToConnection(int connectionInt) {
  var connection = Connection.unknown;
  switch (connectionInt) {
    case Constants.wifi:
      connection = Connection.wifi;
      break;
    case Constants.cellular:
      connection = Connection.cellular;
      break;
    case Constants.disconnected:
      connection = Connection.disconnected;
      break;
    case Constants.unknown:
      connection = Connection.unknown;
      break;
  }
  return connection;
}

/// network olaylarını renk ile göstermek için kullanılır
Color getConnectionColor(Connection connection) {
  var color = Colors.red[900];
  switch (connection) {
    case Connection.wifi:
      color = Colors.green[800];
      break;
    case Connection.cellular:
      color = Colors.blue[900];
      break;
    case Connection.disconnected:
      color = Colors.red[900];
      break;
    case Connection.unknown:
      color = Colors.red[900];
      break;
  }
  return color!;
}

/// network olaylarını kullanıcıya bir metin ile bildirmek için kullanılır
String getConnectionMessage(Connection connection) {
  var msg = 'Unknown connection';
  switch (connection) {
    case Connection.wifi:
      msg = 'Connected to Wifi';
      break;
    case Connection.cellular:
      msg = 'Connected to mobile data';
      break;
    case Connection.disconnected:
      msg = 'Offline';
      break;
    case Connection.unknown:
      msg = 'Unknown connection';
      break;
  }
  return msg;
}
