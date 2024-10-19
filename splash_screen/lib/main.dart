import 'package:flutter/material.dart';

// flutter_native_splash kütüphanesini içe aktarıyoruz. Bu kütüphane, uygulamanın başlangıcında bir splash ekranı göstermemizi sağlar.
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {

  // Flutter uygulamasını başlatmak için gerekli olan WidgetsBinding'i oluşturuyoruz.
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Uygulamanın splash ekranını korumak için FlutterNativeSplash kütüphanesini kullanıyoruz.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// Uygulamayı başlatıyoruz.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(), // Burada MyHomePage kullanılıyor
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  void initState(){
    super.initState();
    // Uygulama başlatıldığında initialization fonksiyonunu çağırıyoruz
    initialization();
  }

  void initialization() async {
    // Uygulama açılışında 3 saniye beklemek için bir gecikme ekliyoruz.
    print ("pausing...");
    await Future.delayed(const Duration(seconds: 3));
    print("unpausing...");
    // Gecikme tamamlandıktan sonra splash ekranını kaldırıyoruz.
    FlutterNativeSplash.remove();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Page')),
    );
  }
}
