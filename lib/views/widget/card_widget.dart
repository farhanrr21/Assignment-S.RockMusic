import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:srock_music/viewmodels/home_viewmodel.dart';
import 'package:srock_music/views/screen/card_detail_screen.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late Future<void> _fetchFuture;

  @override
  void initState() {
    super.initState();
    _fetchFuture = context.read<HomeViewModel>().fetchCards();
  }

  @override
  Widget build(BuildContext context) {
    //Fetch From Firestore
    return FutureBuilder<void>(
      future: _fetchFuture,
      builder: (context, snapshot) {
        //Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        //Error
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        
        final viewModel = context.watch<HomeViewModel>();

        //Error Message from viewmodel
        if (viewModel.errorMessage.isNotEmpty) {
          return Center(child: Text(viewModel.errorMessage));
        }
        //Empty
        if (viewModel.cards.isEmpty) {
          return const Center(child: Text('No cards found.'));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: viewModel.cards.length,
            itemBuilder: (context, index) {
              final card = viewModel.cards[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to the new screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CardDetailScreen(serviceName: card.title),
                    ),
                  );
                },

                //Cards
                child: Container(
                    margin: const EdgeInsets.all(6),
                    height: MediaQuery.of(context).size.height * 0.085,
                    decoration: BoxDecoration(
                      color: const Color(0xFF202126),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Color(0xFF2C2D31)),
                      image: DecorationImage(
                          image: AssetImage(card.background), //Card Background Image
                          fit: BoxFit.cover,
                          opacity: 0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2F2F39),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              //Card Icon
                              child: SvgPicture.asset(
                                card.icon,
                                semanticsLabel: 'Search Icon',
                              )),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Card Title
                                  Text(card.title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Syne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  //Card Description
                                  Text(card.description,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Syne',
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 32,
                          )
                        ],
                      ),
                    )),
              );
            },
          ),
        );
      },
    );
  }
}
