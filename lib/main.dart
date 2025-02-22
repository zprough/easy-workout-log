import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const MyHomePage(title: 'Easy Workout Log'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 4;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget> [
              Tab(icon: const Icon(Icons.home), text: "Home"),
              Tab(icon: const Icon(Icons.fitness_center), text: "Exercise"),
              Tab(icon: const Icon(Icons.list), text: "Routine"),
              Tab(icon: const Icon(Icons.build), text: "Tools"),
            ],
          ),
        ),

// Drawer Tiles: ['Summary', 'Exercise', 'Routine', 'Tools', 'Profile', 'Settings', 'Analytics', 'About']


        drawer: Drawer(
          child: Builder(
            builder: (BuildContext context) {
              return ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      'Navigation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      DefaultTabController.of(context)?.animateTo(0);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text('Exercise'),
                    onTap: () {
                      Navigator.pop(context);
                      DefaultTabController.of(context)?.animateTo(1);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text('Routine'),
                    onTap: () {
                      Navigator.pop(context);
                      DefaultTabController.of(context)?.animateTo(2);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.build),
                    title: Text('Tools'),
                    onTap: () {
                      Navigator.pop(context);
                      DefaultTabController.of(context)?.animateTo(3);
                    },
                  ),
                ],
              );
            },
          ),
        ),

        body: TabBarView(
          children: const [
            Center(child: Text('Summary Page')),
            Center(child: Text('Exercise Page')),
            Center(child: Text('Routine Page')),
            Center(child: Text('Profile Page')),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
