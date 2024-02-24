import 'package:flutter/material.dart';

class SearchScreenSearchBar extends StatelessWidget {
  const SearchScreenSearchBar({
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
        borderRadius: BorderRadius.circular(15),
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

class DetailedSearchScreenSearchBar extends StatelessWidget {
  const DetailedSearchScreenSearchBar({
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
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
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

class DetailedSearchBackButton extends StatelessWidget {
  const DetailedSearchBackButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey[400],
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: const Icon(Icons.navigate_before),
      ),
    );
  }
}

class DetailedSearchButton extends StatelessWidget {
  const DetailedSearchButton({super.key, required this.onTap});

  final VoidCallback onTap;

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
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(Icons.tune),
              Text('Detailed Search'),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailedSearchScreenBody extends StatelessWidget {
  const DetailedSearchScreenBody({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _SearchTile(title: 'Category'),
        const _SelectionTile(),
        const _SearchTile(title: 'Brand'),
        const _SelectionTile(),
        const _SearchTile(title: 'Price'),
        const _PriceTile(),
        const _SearchTile(title: 'Sort By'),
        const _SelectionTile(),
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.grey[200],
            ),
            Center(
              child: _SearchButton(
                onTap: onTap,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SearchTile extends StatelessWidget {
  const _SearchTile({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      textColor: Colors.grey[700],
      tileColor: Colors.grey[200],
    );
  }
}

class _SelectionTile extends StatelessWidget {
  const _SelectionTile();

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('All'),
      trailing: Icon(Icons.navigate_next),
    );
  }
}

class _PriceTile extends StatelessWidget {
  const _PriceTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: Colors.grey,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: Text(
                'Min',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const Text('to'),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: Colors.grey,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              child: Text(
                'Max',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        child: const Text(
          'Search',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
