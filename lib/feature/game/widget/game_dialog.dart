import 'package:flutter/material.dart';

class GameDialog extends StatelessWidget {
  const GameDialog({
    super.key,
    this.title,
    required this.content,
    this.hasCancel = false,
  });

  final String? title;
  final String content;
  final bool hasCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: Text(content, textAlign: TextAlign.center),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('확인'),
        ),
        if (hasCancel)
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('취소'),
          ),
      ],
    );
  }
}
