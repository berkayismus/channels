import 'package:channels/constants.dart';

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
