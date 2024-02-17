import 'package:clean_architect/features/data/models/response/task.dart';
import 'package:flutter/material.dart';

class ItemDailyTask extends StatelessWidget {
  final Task task;
  const ItemDailyTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Stack(
        children: [
          Container(
            height: 80,
          ),
          Positioned(
            top: 6,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.shade300
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 128,
                            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(child: Text('${task.startTime} - ${task.endTime}'))),
                        const SizedBox(height: 6,),
                        Text(task.title,style: const TextStyle(fontSize: 14),)
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 40,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                decoration: BoxDecoration(
                  color: task.color,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Text(task.priority,style: const TextStyle(color: Colors.white),))),
        ],
      ),
    );
  }
}
