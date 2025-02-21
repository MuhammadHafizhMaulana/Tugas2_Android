import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  String username="admin"; // Username yang benar
  String password="1234"; // Password yang benar

  void login() {
    if (usernameController.text==username && passwordController.text==password) {
      // Jika login sukses
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=> HomePage()),
      );
    }

    else {
      // Jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Username atau password salah!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Login")),
      body: Padding(padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [ TextField(controller: usernameController,
            decoration: InputDecoration(labelText: "Username"),
          ),
          TextField(controller: passwordController,
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          SizedBox(height: 30),
          ElevatedButton(onPressed: login,
            child: Text("Login"),
          ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  // List menu dengan nama, ikon, dan halaman tujuan
  final List<Map<String, dynamic>> menuItems = [
    {"title": "Dashboard", "icon": Icons.dashboard, "page": DashboardPage()},
    {"title": "Profile", "icon": Icons.person, "page": ProfilePage()},
    {"title": "Settings", "icon": Icons.settings, "page": SettingsPage()},
    {"title": "Help", "icon": Icons.help, "page": HelpPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(menuItems[index]["icon"], color: Colors.blue), // Ikon berbeda
            title: Text(menuItems[index]["title"], style: TextStyle(fontSize: 20)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey), // Panah ke kanan
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => menuItems[index]["page"]),
              );
            },
          );
        },
      ),
    );
  }
}

// Halaman-halaman tujuan
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Center(child: Text("Welcome to Dashboard")),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("Welcome to Profile")),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: Text("Settings Page")),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help")),
      body: Center(child: Text("Help Page")),
    );
  }
}