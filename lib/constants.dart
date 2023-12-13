class Constants {
  /// ağ durumu, wifi'ya geçtiğinde bunu kullanacağız
  static const wifi = 0xFF;

  /// ağ durumu, mobil veriye geçtiğinde bunu kullanacağız
  static const cellular = 0xEE;

  /// ağ durumu, kapalı olduğunda bunu kullanacağız
  static const disconnected = 0xDD;

  /// ağ durumu desteklenmeyen bir duruma geçtiğinde, örn; VPN, veya androidde ethernet
  /// bunu kullanacağız
  static const unknown = 0xCC;
}
