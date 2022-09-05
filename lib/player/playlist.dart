import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

playlist(audioSources, state, AudioPlayer player) {
  final sequence = state?.sequence ?? [];

  return ReorderableListView(
    onReorder: (int oldIndex, int newIndex) {
      if (oldIndex < newIndex) newIndex--;
      audioSources.move(oldIndex, newIndex);
    },
    children: [
      for (var i = 0; i < sequence.length; i++)
        Dismissible(
          key: ValueKey(sequence[i]),
          background: Container(
            color: Colors.redAccent,
            alignment: Alignment.centerRight,
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
          onDismissed: (dismissDirection) {
            audioSources.removeAt(i);
          },
          child: Material(
            color: i == state!.currentIndex ? Colors.grey.shade300 : null,
            child: ListTile(
              title: Text(sequence[i].tag.title as String),
              onTap: () {
                player.seek(Duration.zero, index: i);
              },
            ),
          ),
        ),
    ],
  );
}
