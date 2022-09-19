import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Navigation.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => Forums();
}

class Forums extends State<MyStatefulWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.greenAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1000),
                bottomRight: Radius.circular(2000))),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: SizedBox(),
        ),
      ),
      drawer: NavigationDrawer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("courses").snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot course = snapshot.data.documents[index];
              return ListTile(
                leading: Image.network(course['img']),
                title: Text(course['name']),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.greenAccent,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.greenAccent,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, color: Colors.greenAccent),
            label: "Forums",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.greenAccent),
            label: "Courses",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.greenAccent),
              label: "Guide"),
        ],
      ),
    );

// // ignore: dead_code
// Stream<List<User>> readUsers() => FirebaseFirestore.instance
// .collection('forum')
// .snapshots()
// .map(((snapshot) =>
//   snapshot.docs.map((doc) => User.fromJson(doc.data()))).toList());
  }
}
