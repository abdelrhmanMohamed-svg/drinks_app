import 'package:drinks_app/models/model.dart';
import 'package:drinks_app/widgets/Drink.dart';
import 'package:drinks_app/widgets/chooseQuantitiy.dart';
import 'package:drinks_app/widgets/toggleIced.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({
    super.key,
    required this.index,
  });
  final double index;
  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  late final PageController _pageController;
  double _cuurentIndex = 0;
  int isSlectedIndex = 0;
  @override
  void initState() {
    _cuurentIndex = widget.index;
    _pageController = PageController(
      viewportFraction: 0.50,
      initialPage: widget.index.round(),
    );
    _pageController.addListener(
      () {
        setState(() {
          _cuurentIndex = _pageController.page ?? widget.index;
        });
      },
    );

    super.initState();
  }

  final drinks = DrinkModel.drinks;
  final List sizeOfDrink = ["Small", "Medium", "Large", "Xlarge"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drinks[_cuurentIndex.round()].name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(drinks[_cuurentIndex.round()].title),
                    ],
                  ),
                  Text("\$${drinks[_cuurentIndex.round()].price}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              )),
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              final drink = drinks[index];
              final scale = 1 - (_cuurentIndex - index).abs() * 1;

              final transformY = (_cuurentIndex - index).abs() * 1;

              return Transform.translate(
                offset: Offset(transformY, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            drink.image,
                            fit: BoxFit.contain,
                            height: 700,
                          ),
                          Positioned(
                              bottom: 135,
                              left: 0,
                              right: 0,
                              child: Image.asset("assets/drinks/shadow.png")),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 25,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        sizeOfDrink.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSlectedIndex = index;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: isSlectedIndex == index
                                              ? Colors.orange
                                              : Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black87)),
                                      child: SvgPicture.asset(
                                        "assets/Vector.svg",
                                        width: 25,
                                        color: isSlectedIndex == index
                                            ? Colors.white
                                            : Colors.black54,
                                      )),
                                  Text(
                                    sizeOfDrink[index],
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Add this for vertical alignment
                      children: [
                        Expanded(
                          child: CustomContainer(),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Choosequantitiy(),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
