
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChange;
  Function(BuildContext)? deleteFunction;
  final VoidCallback onEdit;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.deleteFunction,
    required this.onEdit,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(16),
          ),
        ]),
        
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(16),
          ),
          
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChange,
                activeColor: Colors.blue,
                shape: const CircleBorder(),
              ),
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
