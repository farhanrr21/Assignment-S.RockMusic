import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srock_music/views/widget/card_widget.dart';
import 'package:srock_music/views/widget/searchbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF18171c),
        child: Column(children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFFa90140),
                  Color(0xFF550120),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.075),
                child: Stack(
                  children: [
                    //Hero Image
                    const Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRect(
                            child: Align(
                              alignment: Alignment.centerRight,
                              widthFactor: 0.75,
                              child: Image(
                                image: AssetImage('assets/disc.png'),
                                fit: BoxFit.cover,
                                height: 130,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          ClipRect(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.7,
                              child: Image(
                                image: AssetImage('assets/piano.png'),
                                fit: BoxFit.cover,
                                height: 130,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Column(
                      children: [
                        //SearchBar
                        SearchHomeBar(),

                        //Hero Text
                        const Text('Claim your',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Syne',
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        const Text('Free Demo',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lobster',
                                fontSize: 50)),
                        const Text('for custom Music Production',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Syne',
                                fontSize: 18)),

                        //Book now Button
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Text('Book now',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Syne',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),

          //Card Services Section
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: 24),
            child: const Column(
              children: [
                Text('Hire hand-picked Pros for popular music services',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Syne', fontSize: 14)),
                
                //Cards from the Firebase Firestore
                Expanded(child: CardWidget())
              ],
            ),
          )),
        ]),
      );
  }
}
