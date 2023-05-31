import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _controllerUpdateAdress = TextEditingController();
  @override
  void dispose() {
    _controllerUpdateAdress.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
              child: RichText(text: TextSpan(
                text: "Hi!   ",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan> [
                  TextSpan(
                    text: "My name",
                    style: TextStyle(
                      color: themeState.getDarkTheme ? Colors.white70 : Colors.black54,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "email@gmail.com",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: themeState.getDarkTheme ? Colors.white70 : Colors.black54,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Divider(),
            _listTiles(
              title: "Adress",
              subtitle: "Campus Universitaire Vontovorona",
              icon: IconlyLight.profile,
              onPressed: () async {
                _showAdressDialog();
              }
            ),
            _listTiles(title: "Orders", icon: IconlyLight.bag, onPressed: (){}),
            _listTiles(title: "Wishlist", icon: IconlyLight.heart, onPressed: (){}),
            _listTiles(title: "Forget Password", icon: IconlyLight.unlock, onPressed: (){}),
            _listTiles(title: "Viewed", icon: IconlyLight.show, onPressed: (){}),
            SwitchListTile(
              title: const Text("Theme", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
              secondary: Icon(themeState.getDarkTheme ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.getDarkTheme,
            ),
            _listTiles(title: "Logout", icon: IconlyLight.logout, onPressed: () async { _showLogoutDialog(); }),
          ],
        ),
      ),
    );
  }





  Future<void> _showLogoutDialog() async {
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Row(
          children: [
            Icon(Icons.logout, color: Colors.blue,),
            Padding(padding: EdgeInsets.only(right: 20.0)),
            Text("Sign out", style: TextStyle(color: Colors.blue),),
          ],
        ),
        content: Text("Are you sure to logout?"),
        actions: [
          TextButton(
            onPressed: (){if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }},
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: (){},
            child: Text("OK", style: TextStyle(color: Colors.red.shade700),)
          ),
        ],
      );
    });
  }





  Future<void> _showAdressDialog() async {
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Row(
          children: [
            Icon(Icons.update, color: Colors.blue,),
            Padding(padding: EdgeInsets.only(right: 20.0)),
            Text("Update", style: TextStyle(color: Colors.blue),),
          ],
        ),
        content: TextField(
          controller: _controllerUpdateAdress,
          minLines: 1,
          maxLines: 3,
          decoration: const InputDecoration(hintText: "Your adress"),
        ),
        actions: [
          TextButton(onPressed: (){}, child: const Text("Update")),
        ],
      );
    });
  }





  Widget _listTiles({required String title, String? subtitle, required IconData icon, required Function onPressed}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
      subtitle: Text(subtitle ?? ""),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
