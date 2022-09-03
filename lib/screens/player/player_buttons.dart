import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons(this._audioPlayer, {required Key key}) : super(key: key);

  final AudioPlayer _audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Shuffle
        StreamBuilder<bool>(
          stream: _audioPlayer.shuffleModeEnabledStream,
          builder: (context, snapshot) {
            return shuffleButton(context, snapshot.data ?? false);
          },
        ),
        // Previous
        StreamBuilder<SequenceState?>(
          stream: _audioPlayer.sequenceStateStream,
          builder: (_, __) {
            return previousButton();
          },
        ),
        // Play/pause/restart
        StreamBuilder<PlayerState>(
          stream: _audioPlayer.playerStateStream,
          builder: (_, snapshot) {
            final playerState = snapshot.data;
            return playPauseButton(playerState!);
          },
        ),
        // Next
        StreamBuilder<SequenceState?>(
          stream: _audioPlayer.sequenceStateStream,
          builder: (_, __) {
            return nextButton();
          },
        ),
        // Repeat
        StreamBuilder<LoopMode>(
          stream: _audioPlayer.loopModeStream,
          builder: (context, snapshot) {
            return repeatButton(context, snapshot.data ?? LoopMode.off);
          },
        ),
      ],
    );
  }


  Widget playPauseButton(PlayerState playerState) {
    final processingState = playerState.processingState;
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        width: 64.0,
        height: 64.0,
        child: const CircularProgressIndicator(),
      );
    } else if (_audioPlayer.playing != true) {
      return IconButton(
        icon: const Icon(Icons.play_arrow),
        iconSize: 64.0,
        onPressed: _audioPlayer.play,
      );
    } else if (processingState != ProcessingState.completed) {
      return IconButton(
        icon: const Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: _audioPlayer.pause,
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.replay),
        iconSize: 64.0,
        onPressed: () => _audioPlayer.seek(Duration.zero,
            index: _audioPlayer.effectiveIndices?.first),
      );
    }
  }

  Widget shuffleButton(BuildContext context, bool isEnabled) {

    return IconButton(
      icon: isEnabled
          ? Icon(Icons.shuffle, color: Theme.of(context).colorScheme.secondary)
          : const Icon(Icons.shuffle),
      onPressed: () async {
        final enable = !isEnabled;
        if (enable) {
          await _audioPlayer.shuffle();
        }
        await _audioPlayer.setShuffleModeEnabled(enable);
      },
    );
  }

  Widget previousButton() {
    return IconButton(
      icon: const Icon(Icons.skip_previous),
      onPressed: _audioPlayer.hasPrevious ? _audioPlayer.seekToPrevious : null,
    );
  }

  Widget nextButton() {
    return IconButton(
      icon: const Icon(Icons.skip_next),
      onPressed: _audioPlayer.hasNext ? _audioPlayer.seekToNext : null,
    );
  }

  Widget repeatButton(BuildContext context, LoopMode loopMode) {
    final icons = [
      const Icon(Icons.repeat),
      Icon(Icons.repeat, color: Theme.of(context).colorScheme.secondary),
      Icon(Icons.repeat_one, color: Theme.of(context).colorScheme.secondary),
    ];
    const cycleModes = [
      LoopMode.off,
      LoopMode.all,
      LoopMode.one,
    ];
    final index = cycleModes.indexOf(loopMode);
    return IconButton(
      icon: icons[index],
      onPressed: () {
        _audioPlayer.setLoopMode(
            cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
      },
    );
  }
}