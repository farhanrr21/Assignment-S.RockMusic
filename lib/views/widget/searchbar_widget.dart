import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchHomeBar extends StatefulWidget {
  const SearchHomeBar({super.key});

  @override
  State<SearchHomeBar> createState() => _SearchHomeBarState();
}

class _SearchHomeBarState extends State<SearchHomeBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFF2F2F39),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: SvgPicture.asset(
                        'assets/search.svg',
                        semanticsLabel: 'Search Icon',
                      )),
                  const Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Syne',
                              fontSize: 14),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 4),
                            border: InputBorder.none,
                            
                            focusColor: Colors.white,
                            hintText: 'Search "Punjabi Lyrics"',
                            hintStyle: TextStyle(
                                color: Color(0xFF61616B),
                                fontFamily: 'Syne',
                                fontSize: 14),
                          ),
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const VerticalDivider(
                      color: Color(0xFF45454F),
                      thickness: 1,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/mic.svg',
                        semanticsLabel: 'Mic Icon',
                      ),
                      padding: EdgeInsets.only(right: 12, left: 1),)


                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_avatar.png'),
            ),
          )
        ],
      ),
    );
  }
}
