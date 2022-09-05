import 'package:flutter_audio/common.dart';

seekbar(player, context, snapshot) {
  final positionData = snapshot.data;
  return SeekBar(
    duration: positionData?.duration ?? Duration.zero,
    position: positionData?.position ?? Duration.zero,
    bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
    onChangeEnd: (newPosition) {
      player.seek(newPosition);
    },
  );
}
