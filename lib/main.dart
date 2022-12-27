import 'package:flutter/material.dart';
import 'package:food_app/DetailPage.dart';

import 'Foods.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Food Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Foods>> comeToFoods() async {
    var foodList = <Foods>[];
    var f1 = Foods(1, "Meatball", "kofte.png", 15.99);
    var f2 = Foods(2, "Baklava", "baklava.png", 11.99);
    var f3 = Foods(3, "Fanta", "fanta.png", 5.99);
    var f4 = Foods(4, "Kadayif", "kadayif.png", 8.99);
    var f5 = Foods(5, "Pasta", "makarna.png", 11.99);
    var f6 = Foods(6, "Ayran", "ayran.png", 5.99);
    foodList.add(f1);
    foodList.add(f2);
    foodList.add(f3);
    foodList.add(f4);
    foodList.add(f5);
    foodList.add(f6);
    return foodList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Foods>>(
        future: comeToFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var foodList = snapshot.data;
            return ListView.builder(
              itemCount: foodList!.length,
              itemBuilder: (context, indeks) {
                var food = foodList[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(food),
                        ));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                            height: 150,
                            width: 150,
                            child:
                                Image.asset(("Images/${food.foodImagesName}"))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.foodName,
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "${food.foodPrize} \u{20BA}",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.blue),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
