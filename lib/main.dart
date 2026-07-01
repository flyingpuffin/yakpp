import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = "Yakpp";
    const primaryColor = Color(0XFFFFB6C1);
    const secondaryColor = Color(0XFFCCFF00);
    const imageList = [
      "https://upload.wikimedia.org/wikipedia/commons/7/76/Sarlyk_Yak2.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_fp0XeMsJnlMPnwx9Piity8YlhrxQ8sfjQScdiogiC2sKqJSchf3Rr-Q&s=10",
      "https://cdn.britannica.com/46/5246-004-38FFD2B7/Yak.jpg",
      "https://www.coniferousforest.com/wp-content/uploads/2019/02/Wild-Yak.jpg",
      "https://media.conservationjobs.co.uk/2013/06/wiki-Bos_grunniens_at_Letdar_on_Annapurna_Circuit.jpg",
      "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/MSNBC/Components/Photo/_new/130116-YaksPhoto-hmed-0545p_files.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1lmS9aaNzpC6qIuaB5CSs2yjSjRv8miKXxaQrTyZZroJWtG4SbgNIKlxk&s=10",
    ];
    return MaterialApp(
      title: 'Yakpp',
      home: const MyHomePage(
        title: title,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        imageList: imageList,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
    required this.imageList,
  });

  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final List<String> imageList;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayedImage = "";

  void _incrementCounter() {
    var randomImage = (widget.imageList.toList()..shuffle()).first;
    setState(() {
      displayedImage = randomImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.primaryColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to Yakpp!'),
            TextButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Container(
                padding: EdgeInsetsGeometry.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: widget.secondaryColor,
                ),
                child: Text("Click to generate a yak"),
              ),
            ),
            Container(
              height: 300,
              width: 400,
              child: (displayedImage != "")
                  ? Image.network(displayedImage, fit: BoxFit.cover)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
