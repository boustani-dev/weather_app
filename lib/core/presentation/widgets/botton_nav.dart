import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key, required this.controller});

  final PageController controller;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: primaryColor,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
                onPressed: () {
                  controller.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Easing.linear);
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            TextButton.icon(
                onPressed: () {
                  controller.animateToPage(1,
                      duration: const Duration(milliseconds: 300),
                      curve: Easing.linear);
                },
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
                label: const Text(
                  'Saved',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
