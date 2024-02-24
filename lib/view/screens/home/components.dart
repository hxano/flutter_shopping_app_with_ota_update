import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreenLogo extends StatelessWidget {
  const HomeScreenLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterLogo(),
        Text(
          'Flutter Shop',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class HomeScreenSearchBar extends StatelessWidget {
  const HomeScreenSearchBar({
    super.key,
    required this.textController,
    required this.focusNode,
  });

  final TextEditingController textController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: textController,
        focusNode: focusNode,
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class HomeScreenTitleHeader extends StatelessWidget {
  const HomeScreenTitleHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ShowcaseCarouselSlider extends StatelessWidget {
  const ShowcaseCarouselSlider({super.key, required this.items});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 180,
          viewportFraction: 0.85,
        ),
        items: items,
      ),
    );
  }
}

class ShowcaseCard extends StatelessWidget {
  const ShowcaseCard({super.key, required this.image, required this.onTap});

  final ImageProvider image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image(
            image: image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

