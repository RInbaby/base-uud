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
        backgroundColor: Color(0xFFFF80AB),
        title: Text("Custom TabBar"),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTabController(
              length: 3,
              child: TabBar(
                isScrollable: true,
                indicator: const ShapeDecoration(
                    shape: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 0, style: BorderStyle.solid)),
                    gradient: LinearGradient(colors: [Colors.redAccent, Colors.pinkAccent])),
                onTap: (index) => _buildMain(index),
                padding: EdgeInsets.all(3.0),
                tabs: tabs.map((e) {
                  return Container(
                    width: 80,
                    child: Tab(
                        child: Text(
                      "Tab $e",
                      style: TextStyle(color: Colors.black),
                    )),
                  );
                }).toList(),

              ),
            ),
            // TabBarView(
            //   physics: NeverScrollableScrollPhysics(),
            //   children: [
            //     Container(
            //       color: Colors.green,
            //       height: 100,
            //     ),
            //     Container(color: Colors.red,
            //       height: 100,
            //     ),
            //     Container(color: Colors.yellow,
            //       height: 100,
            //     ),
            //     Container(color: Colors.cyan,
            //       height: 100,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMain(int colorIndex) {
  List<Color> colors = [Colors.redAccent, Colors.deepPurple, Colors.amber];
  return Container(
    height: 1100,
    color: colors[colorIndex],
  );
}
