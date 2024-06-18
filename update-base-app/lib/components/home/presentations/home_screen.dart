import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ["1", "2", "3"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom TabBar"),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          DefaultTabController(
            length: 3,
            child: Center(
              child: TabBar(
                isScrollable: true,
                indicator: const ShapeDecoration(
                    shape: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 0, style: BorderStyle.solid)),
                    gradient: LinearGradient(colors: [Colors.redAccent, Colors.pinkAccent])),
                onTap: (index) async {},
                padding: EdgeInsets.all(3.0),
                tabs: tabs.map((e) {
                  return Tab(
                      child: Text(
                    "Check $e",
                    style: TextStyle(color: Colors.black),
                  ));
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
