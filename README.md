# Bağlantı Durumu Kontrolü Uygulaması

Bu Flutter uygulaması, cihazın bağlantı durumunu (Wi-Fi, mobil veri vb.) kontrol etmek için Event Channel kullanmaktadır.

## Kurulum

Uygulamayı çalıştırmak için aşağıdaki adımları izleyin:

1. **Flutter'ı Yükleyin:** Eğer Flutter yüklü değilse, [Flutter Resmi Websitesi](https://flutter.dev/docs/get-started/install) üzerinden Flutter'ı yükleyin.

2. **Dependecies'leri Yükleyin:** Terminal veya Komut İstemi'ni kullanarak proje dizininde aşağıdaki komutu çalıştırın:

    ```bash
    flutter pub get
    ```

3. **Uygulamayı Çalıştırın:** Aşağıdaki komutla uygulamayı çalıştırabilirsiniz:

    ```bash
    flutter run
    ```

## Kullanım

Uygulama başladığında, cihazın mevcut bağlantı durumunu gösteren bir ekran görüntüsü ile karşılanacaksınız. Ayrıca, bağlantı durumu değiştikçe uygulama ekranı otomatik olarak güncellenecektir.

## Event Channel Kullanımı

Uygulama, Dart tarafında kullanıcıya cihazın bağlantı durumunu sağlamak için Android ve iOS platformlarındaki native kodları birbirine bağlamak için Event Channel kullanmaktadır. İlgili kodlar `lib/` ve `android/` (veya `ios/`) dizinlerinde bulunmaktadır.

## Katkıda Bulunma

Eğer bu projeye katkıda bulunmak istiyorsanız, lütfen bir konu açın veya bir çekme isteği gönderin. Her türlü katkıya açığız!

## Lisans

Bu proje [MIT Lisansı](LICENSE) altında lisanslanmıştır. Daha fazla bilgi için lisans dosyasını kontrol edin.