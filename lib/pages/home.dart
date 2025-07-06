import 'package:drinks_app/models/model.dart';
import 'package:drinks_app/pages/drink_details.dart';
import 'package:drinks_app/widgets/Drink.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          
          centerTitle: true,
          title: Text(
            "menu",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: DrinkModel.drinks.length,
                itemBuilder: (context, index) {
                  final drink = DrinkModel.drinks[index];
                  return AnimatedBuilder(
                    animation: _scrollController,
                    builder: (context, child) {
                      double offset = 0;
                      if (_scrollController.hasClients) {
                        offset = _scrollController.offset / 100 - index;
                      }
                      offset = offset.clamp(0, 1);
                      return Transform.scale(
                        scale: 1 - (offset * 0.2),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DrinkDetails(
                                        index: index.toDouble(),
                                      )),
                            );
                          },
                          child: Drink(
                              image: drink.image,
                              name: drink.name,
                              title: drink.title),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
