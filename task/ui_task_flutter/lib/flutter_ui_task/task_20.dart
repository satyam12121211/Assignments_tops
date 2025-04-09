import 'package:flutter/material.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add({'title': _taskController.text, 'done': false});
        _taskController.clear();
      });
    }
  }

  void _toggleDone(int index, bool? value) {
    setState(() => _tasks[index]['done'] = value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _taskController,
                  decoration: const InputDecoration(labelText: 'New Task'),
                ),
              ),
              IconButton(onPressed: _addTask, icon: const Icon(Icons.add))
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (_, index) {
              return CheckboxListTile(
                title: Text(_tasks[index]['title']),
                value: _tasks[index]['done'],
                onChanged: (val) => _toggleDone(index, val),
              );
            },
          ),
        )
      ],
    );
  }
}

class TaskManagerScreen extends StatelessWidget {
  const TaskManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: TaskManager()));
  }
}
