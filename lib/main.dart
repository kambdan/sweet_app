import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const SweetApp());
}

class SweetApp extends StatelessWidget {
  const SweetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List titlesCakes = [
    'Cupcake',
    'Tortas',
    'Donas',
    'Brownie',
    'Carrot',
  ];
  List pathAssets = [
    'assets/pastel.png',
    'assets/cakes.png',
    'assets/donuts.png',
    'assets/brownie.png',
  ];

  List pathBodyAssets = [
    'assets/fudge.png',
    'assets/hot.png',
    'assets/fudge.png',
    'assets/hot.png',
  ];
  List titleBodyAssets = [
    'Fudge Cake Rs. 750',
    'Hot Brownie Rs. 250',
    'Fudge Cake Rs. 750',
    'Hot Brownie Rs. 250',
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(children: [
      Scaffold(
        backgroundColor: Color(0xfff1daae),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(127.0),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 26, right: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Buen día, jcCoder',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/notification.svg'),
                      SvgPicture.asset('assets/menu.svg'),
                    ],
                  )
                ],
              ),
            ),
            backgroundColor: Color(0xffa27146),
            elevation: 0,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 73),
                    child: Container(
                      width: 376,
                      height: 67,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffa27146)),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Image.asset(
                      'assets/pastel.png',
                      width: 115,
                      height: 140,
                    ),
                  ),
                  const Positioned(
                    width: 170,
                    top: 83,
                    left: 130,
                    child: Text(
                      '15% de descuento en Cupcakes',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Categoria',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(131, 77, 30, 10)),
                ),
              ),
              Categorias(pathAssets: pathAssets, titlesCakes: titlesCakes),
              const Padding(
                padding: EdgeInsets.only(top: 29),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Recomendaciones',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(131, 77, 30, 10),
                      ),
                    ),
                    Text(
                      'Ver todo',
                      style: TextStyle(color: Color.fromRGBO(131, 77, 30, 10)),
                    )
                  ],
                ),
              ),
              Recmendacion(
                  pathBodyAssets: pathBodyAssets,
                  titleBodyAssets: titleBodyAssets)
            ],
          ),
        ),
      ),
      Positioned(
          top: kToolbarHeight + 108.5,
          left: 20,
          right: 20,
          child: Material(
            color: Color(0xfff1daae),
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Buscar por Cupcakes, Tortas,...',
                hintStyle: const TextStyle(
                    fontSize: 12, color: Color.fromRGBO(108, 117, 125, 1)),
                contentPadding: EdgeInsets.all(12),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          )),
    ]);
  }
}

class Categorias extends StatelessWidget {
  const Categorias({
    super.key,
    required this.pathAssets,
    required this.titlesCakes,
  });

  final List pathAssets;
  final List titlesCakes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.only(left: 18),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 30),
              width: 122,
              height: 91,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x00693712), Color(0xff693712)],
                        )),
                  ),
                  Positioned(
                    top: -50,
                    child: Image.asset(
                      pathAssets[index],
                      width: 110,
                      height: 110,
                    ),
                  ),
                  Positioned(
                      top: 40,
                      left: 35,
                      child: Text(
                        titlesCakes[index],
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            );
          }),
    );
  }
}

class Recmendacion extends StatelessWidget {
  const Recmendacion({
    super.key,
    required this.pathBodyAssets,
    required this.titleBodyAssets,
  });

  final List pathBodyAssets;
  final List titleBodyAssets;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 17),
      width: 375,
      height: 300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                // Contenedor para la imagen
                Container(
                  decoration: BoxDecoration(
                    border: const Border(bottom: BorderSide.none),
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                      image: AssetImage(pathBodyAssets[index]),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                // Contenedor para el gradiente
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color.fromRGBO(105, 55, 18, 1), // Tu color final
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                // Título
                Positioned(
                  bottom: 10,
                  left: 29,
                  child: Text(
                    titleBodyAssets[index],
                    style: const TextStyle(
                        color: Color.fromRGBO(248, 227, 182, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
