// * FLUTTER'DA PLATFORM CHANNELS
// * dart'tan native platform apilerinin cagrılmasını kolaylastıran bir dizi api'dir
// * bunlar; MessageChannel, MethodChannel, EventChannel
// * Bu API'ler, metodları çağırmak ve Java/Kotlin veya Objective-C/Swift ve Dart'ta yazılan kodlar arasında veri aktarmak için bir arayüz sağlar.

// * BinaryMessaging
/*
en düşük seviyeli Platform kanalı API'sidir. 
Dart ile platform kodu arasında yer alan 
ve bayt arabelleklerinin bir kanal üzerinden geçişini kolaylaştıran,
çift yönlü ve senkronize bir API'dir. 
Dart ile iOS ve Android gibi platformlar arasında bayt dizileri göndermek için kullanılır.
 */

/*
Platform kanalı API'lerinin geri kalanı İkili Mesajlaşma üzerine kurulmuştur . Dizeler, haritalar ve listeler gibi üst düzey veri yapıları için destek eklerler. Daha önce de belirtildiği gibi platform kanalı, MessageChannel , MethodChannel ve EventChannel'dan oluşur .

MessageChannel, ham verileri bayt arabellekleri biçiminde sunar. Baytları görüntü gibi yüksek düzeyli bir veri yapısına yorumlamak için bir codec bileşeni iletebilirsiniz. Dart bazı hazır codec'ler sağlarken, siz de kendi özel codec'lerinizi yazabilirsiniz.

MethodChannel, Dart ile yerel kod arasında bağımsız değişkenlerle veya bağımsız değişkenlerle adlandırılmış yöntemleri çağırır. Bir defaya mahsus gönder ve yanıtla mesajı göndermek için bunu kullanabilirsiniz. Sürekli veri akışını desteklemez.

EventChannel, platformdaki verileri akış olarak Dart'a sunar. Dart tarafında bir etkinlik kanalına abone olduğunuzda, iOS veya Android'den sürekli bir veri akışı alırsınız.

Özetlemek gerekirse, Platform Kanalları, bir kanal üzerinden platformlara veri göndermenize ve platformlardan veri almanıza olanak tanır. Bu durumda kanal, mesajın ve hedefinin tanımlayıcısı olan bir dizedir.
 */
