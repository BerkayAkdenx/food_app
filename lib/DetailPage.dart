import 'package:flutter/material.dart';

import 'Foods.dart';

class DetailPage extends StatefulWidget {
  Foods food;

  DetailPage(this.food);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.foodName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("Images/${widget.food.foodImagesName}"),
            Text(
              "${widget.food.foodPrize} \u{20BA}",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    print("ordered : ${widget.food.foodName}");
                  },
                  child: Text("ORDER")),
            )
          ],
        ),
      ),
    );
  }
}
