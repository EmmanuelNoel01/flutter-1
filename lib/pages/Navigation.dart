// ignore: file_names
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container();
  }

  buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
        leading: const Icon(
          Icons.home_outlined,
          color: Colors.greenAccent,
          ),
        title: const Text("Home"),
        onTap: (){},
        ),
        ListTile(
        leading: const Icon(
          Icons.school_outlined,
          color: Colors.greenAccent,
          ),
        title: const Text("Courses"),
        onTap: (){},
        ),
         ListTile(
        leading: const Icon(
          Icons.group,
          color: Colors.greenAccent,
          ),
        title: const Text("Forums"),
        onTap: (){},
        ),
        ListTile(
        leading: const Icon(
          Icons.person,
          color: Colors.greenAccent,
          ),
        title: const Text("Guide"),
        onTap: (){},
        ),       
      ],

    );
  }
}
