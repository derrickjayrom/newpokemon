import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = const Color(0xFFF59E0B);
    final inactiveColor = Colors.grey.shade600;

    final items = <BottomNavIvon>[
      BottomNavIvon(icon: Icons.home_outlined),
      BottomNavIvon(icon: Icons.catching_pokemon),
      BottomNavIvon(icon: Icons.groups_outlined),
      BottomNavIvon(icon: Icons.menu),
    ];

    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: BoxBorder.fromLTRB(
          top: BorderSide(color: activeColor),
          left: BorderSide(color: activeColor),
          right: BorderSide(color: activeColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          return InkWell(
            onTap: () => onTap(index),
            radius: 28,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SizedBox(
              width: 54,
              height: 54,
              child: Center(
                child: Icon(
                  items[index].icon,
                  size: 26,
                  color: isSelected ? activeColor : inactiveColor,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class BottomNavIvon {
  final IconData icon;
  const BottomNavIvon({required this.icon});
}
