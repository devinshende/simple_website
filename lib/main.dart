import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyNav extends StatefulWidget {
  const MyNav({super.key});

  @override
  State<MyNav> createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> {
  int index = 0;

  void onTap(int i) {
    setState(() {
      index = i;
    });
  }

  Widget getContent(int index) {
    final st = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 69, 66, 66),
    );
    switch (index) {
      case 0:
        return Center(child: Text("Events", style: st));
      case 1:
        return Center(child: Text("Observatories", style: st));
      case 2:
        return Center(child: Text("Join Us", style: st));
      case 3:
        return Center(child: LoginPage());
      case 4:
        return Center(child: Text("About", style: st));
      default:
        return Center(child: Text("Home", style: st));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () => onTap(0),
                  child: NavItem(title: 'Events', selected: index == 0)),
              GestureDetector(
                onTap: () => onTap(1),
                child: NavItem(title: 'Observatories', selected: index == 1),
              ),
              GestureDetector(
                onTap: () => onTap(2),
                child: NavItem(title: 'Join Us', selected: index == 2),
              ),
              GestureDetector(
                onTap: () => onTap(3),
                child: NavItem(title: 'Log In', selected: index == 3),
              ),
              GestureDetector(
                onTap: () => onTap(4),
                child: NavItem(title: 'About', selected: index == 4),
              ),
            ],
          ),
          Expanded(child: getContent(index))
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.title,
    required this.selected,
  });
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInSine,
      decoration: BoxDecoration(
        color: selected ? Colors.grey[400] : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checked = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(30),
      width: 300,
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email), // Example: A search icon
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock), // Example: A search icon
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                  activeColor: const Color.fromARGB(255, 31, 144, 237),
                  value: checked,
                  onChanged: (bool? value) {
                    setState(() {
                      checked = !checked;
                    });
                  }),
              Text(
                "Remember me",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                int a = 0;
              },
              child: Text(
                "Log In",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 10),
          const Divider(
            color: Colors.grey,
            height: 20,
          ),
          SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              icon: Icon(Icons.g_mobiledata, color: Colors.black),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.grey!,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              label: const Text(
                "Continue with Google",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          // controller: _controller,)
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: MyNav(),
    ),
  ));
}
