import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/constants/data_constants.dart';
import 'package:task_management_app/features/Add%20Task/providers/task_provider.dart';
import 'package:task_management_app/model/task/task.dart';

final selectedDateProvider = StateProvider<DateTime>(
  (ref) => DateTime.now(),
);

final selectedOptionProvider = StateProvider<Priority?>(
  (ref) => Priority.low,
);

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);
    final selectedOption = ref.watch(selectedOptionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskTitleController,
              decoration: const InputDecoration(
                hintText: "Enter Task Title",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: taskDescriptionController,
              decoration: const InputDecoration(
                hintText: "Enter Task Description",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Select Date: ${selectedDate.toLocal()}",
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: currentTime,
                  lastDate: DateTime(3000),
                ).then((date) {
                  if (date != null) {
                    ref.read(selectedDateProvider.notifier).state = date;
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text('High'),
                  leading: Radio<Priority>(
                    value: Priority.high,
                    groupValue: selectedOption,
                    activeColor: Colors.red,
                    onChanged: (Priority? value) {
                      ref.read(selectedOptionProvider.notifier).state = value;
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Medium'),
                  leading: Radio<Priority>(
                    value: Priority.medium,
                    groupValue: selectedOption,
                    activeColor: Colors.blue,
                    onChanged: (Priority? value) {
                      ref.read(selectedOptionProvider.notifier).state = value;
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Low'),
                  leading: Radio<Priority>(
                    value: Priority.low,
                    groupValue: selectedOption,
                    activeColor: Colors.green,
                    onChanged: (Priority? value) {
                      ref.read(selectedOptionProvider.notifier).state = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(taskProvider.notifier).addTask(
                      taskTitleController.text,
                      taskDescriptionController.text,
                      selectedDate,
                      selectedOption ?? Priority.low,
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Task added successfully!")),
                );
              },
              child: const Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}
