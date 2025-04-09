import 'package:flutter/material.dart';
import 'notes_model.dart';

class AddNoteScreen extends StatefulWidget {
  final NotesModel? model;

  const AddNoteScreen({super.key, this.model});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiseValues();
  }

  void initialiseValues() {
    if (widget.model != null) {
      titleController.text = widget.model!.title!;
      descriptionController.text = widget.model!.description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notes"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          customTextField("Title", titleController),
          customTextField("Description", descriptionController),
          ElevatedButton(
            onPressed: () {
              if (widget.model == null) {
                final map = {
                  "title": titleController.text,
                  "description": descriptionController.text,
                  "time": DateTime.now().millisecondsSinceEpoch,
                };

                final notesModel = NotesModel.fromJson(map);

                Navigator.pop(context, notesModel);
              } else {
                final map = {
                  "title": titleController.text,
                  "description": descriptionController.text,
                  "time": widget.model!.time!,
                };

                final notesModel = NotesModel.fromJson(map);

                Navigator.pop(context, notesModel);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget customTextField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}