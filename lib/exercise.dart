import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage>
    with SingleTickerProviderStateMixin {
  final List<String> exercises = <String>[
    'Bench Press',
    'Back Squat',
    'Leg Press',
    'Deadlift',
    'Pull-up',
    'Push-up',
    'Sit-up',
    'Plank',
    'Bicep Curl',
    'Tricep Extension',
    'Shoulder Press',
    'Lat Pulldown',
    'Leg Curl',
    'Leg Extension',
    'Calf Raise',
    'Dumbbell Row',
    'Dumbbell Fly',
    'Dumbbell Curl',
    'Dumbbell Extension',
    'Dumbbell Press',
    'Dumbbell Pullover',
    'Running',
    'Cycling',
    'Swimming',
    'Rowing',
    'Jump Rope',
  ];

  final List<String> categories = <String>[
    'Chest',
    'Back',
    'Legs',
    'Arms',
    'Shoulders',
    'Abs',
    'Cardio',
  ];

  final List<Map<String, String>> exercisesCategories = <Map<String, String>>[
    {'category': 'Chest', 'exercise': 'Bench Press'},
    {'category': 'Legs', 'exercise': 'Back Squat'},
    {'category': 'Legs', 'exercise': 'Leg Press'},
    {'category': 'Back', 'exercise': 'Deadlift'},
    {'category': 'Back', 'exercise': 'Pull-up'},
    {'category': 'Chest', 'exercise': 'Push-up'},
    {'category': 'Abs', 'exercise': 'Sit-up'},
    {'category': 'Abs', 'exercise': 'Plank'},
    {'category': 'Arms', 'exercise': 'Bicep Curl'},
    {'category': 'Arms', 'exercise': 'Tricep Extension'},
    {'category': 'Shoulders', 'exercise': 'Shoulder Press'},
    {'category': 'Back', 'exercise': 'Lat Pulldown'},
    {'category': 'Legs', 'exercise': 'Leg Curl'},
    {'category': 'Legs', 'exercise': 'Leg Extension'},
    {'category': 'Legs', 'exercise': 'Calf Raise'},
    {'category': 'Back', 'exercise': 'Dumbbell Row'},
    {'category': 'Chest', 'exercise': 'Dumbbell Fly'},
    {'category': 'Arms', 'exercise': 'Dumbbell Curl'},
    {'category': 'Arms', 'exercise': 'Dumbbell Extension'},
    {'category': 'Chest', 'exercise': 'Dumbbell Press'},
    {'category': 'Chest', 'exercise': 'Dumbbell Pullover'},
    {'category': 'Cardio', 'exercise': 'Running'},
    {'category': 'Cardio', 'exercise': 'Cycling'},
    {'category': 'Cardio', 'exercise': 'Swimming'},
    {'category': 'Cardio', 'exercise': 'Rowing'},
    {'category': 'Cardio', 'exercise': 'Jump Rope'},
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _addExercise(String exercise) {
    setState(() {
      exercises.add(exercise);
      exercises.sort();
    });
  }

  void _openAddExerciseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newExercise = '';
        return AlertDialog(
          title: const Text('Add Exercise'),
          content: TextField(
            onChanged: (value) {
              newExercise = value;
            },
            decoration: const InputDecoration(hintText: "Enter exercise name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (newExercise.isNotEmpty) {
                  _addExercise(newExercise);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: TabBar(
          controller: _tabController,
          tabs: const <Widget>[Tab(text: "List"), Tab(text: "Categories")],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: exercises.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                height: 25,
                child: Text(exercises[index]),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) => const Divider(),
          ),
          ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                height: 25,
                child: Text(categories[index]),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) => const Divider(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExerciseDialog,
        tooltip: 'Add Exercise',
        child: const Icon(Icons.add),
      ),
    );
  }
}
