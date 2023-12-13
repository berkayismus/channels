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
