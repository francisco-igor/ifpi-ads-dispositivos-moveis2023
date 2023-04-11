import 'package:flutter/material.dart';
import 'package:flutter_new/view/imc.dart';
import 'package:flutter_new/view/profile.dart';
import 'package:flutter_new/view/station.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Navigator'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(
            child: Icon(Icons.sunny),
          ),
          Tab(
            child: Icon(Icons.cloud),
          ),
          Tab(
            child: Icon(Icons.dark_mode),
          ),
        ]),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(
            child: Station(),
          ),
          Center(
            child: Profile(),
          ),
          Center(
            child: Calculator(),
          )
        ],
      ),
    );
  }
}
