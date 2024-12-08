import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/constants/data_constants.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: Column(
          children: [
            TextField(controller: taskTitleController),
            TextField(controller: taskDescriptionController),
            TextField(
              onTap: () {
                showDatePicker(
                    context: context,
                    firstDate: currentTime,
                    lastDate: DateTime(3000));
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: const Text('Option 1'),
                  leading: Radio<int>(
                    value: 1,
                    groupValue: selectedOption,
                    activeColor:
                        Colors.red, // Change the active radio button color here
                    fillColor: WidgetStateProperty.all(
                        Colors.red), // Change the fill color when selected
                    splashRadius: 20, // Change the splash radius when clicked
                    onChanged: (int? value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Option 2'),
                  leading: Radio<int>(
                    value: 2,
                    groupValue: selectedOption,
                    activeColor: Colors
                        .blue, // Change the active radio button color here
                    fillColor: WidgetStateProperty.all(
                        Colors.blue), // Change the fill color when selected
                    splashRadius: 25, // Change the splash radius when clicked
                    onChanged: (int? value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ),
                TextField(
                  controller: priorityController,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Add Task"))
              ],
            ),
          ],
        ));
  }
}
