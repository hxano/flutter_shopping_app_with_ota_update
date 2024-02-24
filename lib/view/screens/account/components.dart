import 'package:flutter/material.dart';

class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const _AppBar(),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SignInButton(
                  onTap: () {},
                ),
                SignUpButton(
                  onTap: () {},
                ),
              ],
            ),
          ),
          const _Sheet(),

        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.only(
        top: 30,
        left: 30,
      ),
      child: const Text(
        'Guest User',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.purpleAccent,
      ),
      child: const Text('Sign Up',
        style: TextStyle(
            fontSize: 20,
          ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text('Sign In',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}

class _Sheet extends StatelessWidget {
  const _Sheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Column(
        children: _tiles(),
      ),
    );
  }
}

List<Widget> _tiles() {
  return [
    _Tile(
      title: 'Help & Support',
      onTap: () {},
    ),
    _Tile(
      title: 'Notifications',
      onTap: () {},
    ),
    _Tile(
      title: 'Terms & Conditions',
      onTap: () {},
    ),
    _Tile(
      title: 'Privacy Policy',
      onTap: () {},
    ),
  ];
}

class _Tile extends StatelessWidget {
  const _Tile({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
      ),
      child: ListTile(
        title: Text(title),
        tileColor: Colors.white,
        trailing: const Icon(Icons.navigate_next),
        onTap: onTap,
      ),
    );
  }
}
