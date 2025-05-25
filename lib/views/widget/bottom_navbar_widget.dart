import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:srock_music/viewmodels/navbar_viewmodel.dart';

class BottomNavBar extends StatelessWidget {
  final List<NavItem> items;

  const BottomNavBar({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<BottomNavViewModel>().currentIndex;

    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Color(0xFF18171C),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(6),
        ),
        border: Border(top: BorderSide(color: Color(0xFF2C2D31))),
        boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          final item = items[index];

          return GestureDetector(
            onTap: () {
              context.read<BottomNavViewModel>().setIndex(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(bottom: 8),
                      width: isSelected ? 8 : 0,
                      height: isSelected ? 4 : 0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)))),
                  Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Image.asset(item.icon,fit: BoxFit.contain,),
                  ),
                  Text(item.label,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Syne',
                          fontSize: 10)),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class NavItem {
  final String icon;
  final String label;

  NavItem({required this.icon, required this.label});
}
