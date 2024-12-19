import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskCardWidget extends ConsumerStatefulWidget {
  const TaskCardWidget({super.key, required this.title});

  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends ConsumerState<TaskCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [Text(widget.title)],
      ),
    );
  }
}
