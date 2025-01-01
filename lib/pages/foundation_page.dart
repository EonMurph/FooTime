import "package:foo_time/pages/home_page.dart";
import "package:flutter/material.dart";

class FoundationPage extends StatefulWidget {
  const FoundationPage({super.key});

  @override
  State<FoundationPage> createState() => _FoundationPageState();
}

class _FoundationPageState extends State<FoundationPage> {
  final pages = const [
    Placeholder(),
    HomePage(),
    Placeholder(),
  ] as List<Widget>;
  int currentPage = 1;
  final PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() => currentPage = value);
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize:
            Theme.of(context).textTheme.labelSmall!.fontSize as double,
        unselectedFontSize:
            (Theme.of(context).textTheme.labelSmall!.fontSize as double) - 3,
        onTap: (value) {
          pageController.jumpToPage(value);
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(label: "Goals", icon: Icon(Icons.flag)),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Stats",
            icon: Icon(Icons.timeline),
          ),
        ],
      ),
    );
  }
}
