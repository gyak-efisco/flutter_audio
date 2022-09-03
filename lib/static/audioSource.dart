import 'package:just_audio/just_audio.dart';
import '../domain/audio_metadata.dart';

var audioSources = [
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/fairytales_01_andersen_64kb.mp3'),
    tag: AudioMetadata(
      title: "Andersen's Fairy Tales: The Emperor's new clothes",
      artwork:
      "https://upload.wikimedia.org/wikipedia/commons/e/eb/Christmascarol1843_--_184.jpg",
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/fairytales_03_andersen_64kb.mp3'),
    tag: AudioMetadata(
      title: "Andersen's Fairy Tales: The Real Princess",
      artwork:
      "https://upload.wikimedia.org/wikipedia/commons/e/eb/Christmascarol1843_--_184.jpg",
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/fairytales_07_andersen_64kb.mp3'),
    tag: AudioMetadata(
      title: "Andersen's Fairy Tales: The Leap Frog",
      artwork:
      "https://upload.wikimedia.org/wikipedia/commons/e/eb/Christmascarol1843_--_184.jpg",
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/fairytales_15_andersen_64kb.mp3'),
    tag: AudioMetadata(
      title: "Andersen's Fairy Tales: The Little Match Girl",
      artwork:
      "https://upload.wikimedia.org/wikipedia/commons/e/eb/Christmascarol1843_--_184.jpg",
    ),
  ),
];

final concatenatedAudioSources = ConcatenatingAudioSource(
    useLazyPreparation: true,
    shuffleOrder: DefaultShuffleOrder(),
    children: audioSources
);
