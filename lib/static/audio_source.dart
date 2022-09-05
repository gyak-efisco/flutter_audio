import 'dart:ffi';

import 'package:just_audio/just_audio.dart';

class AudioMetadata {
  final String title;
  final String artwork;
  final String category;
  final List<AudioMark> marks;

  AudioMetadata(
      {required this.category,
      required this.title,
      required this.artwork,
      required this.marks});
}

class AudioMark {
  final String title;
  final int position;

  AudioMark({required this.title, required this.position});
}

final audioSources = [
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/fairytales_01_andersen_64kb.mp3'),
    tag: AudioMetadata(
      category: "Category a",
      title: "The Emperor's new clothes",
      marks: [
        AudioMark(title: 'first', position: 30),
        AudioMark(title: 'second', position: 47),
      ],
      artwork:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Vilhelm_Pedersen%2C_Kejserens_nye_kl%C3%A6der%2C_ubt.jpeg/458px-Vilhelm_Pedersen%2C_Kejserens_nye_kl%C3%A6der%2C_ubt.jpeg",
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/fairytales_03_andersen_64kb.mp3'),
    tag: AudioMetadata(
      category: "Category a",
      title: "The Real Princess",
      marks: [
        AudioMark(title: 'first', position: 30),
        AudioMark(title: 'second', position: 47),
      ],
      artwork:
          "https://upload.wikimedia.org/wikipedia/commons/e/e8/Page_190_illustration_a_in_fairy_tales_of_Andersen_%28Stratton%29.png",
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/fairytales_07_andersen_64kb.mp3'),
    tag: AudioMetadata(
      category: "Category a",
      title: "The Leap Frog",
      marks: [
        AudioMark(title: 'first', position: 30),
        AudioMark(title: 'second', position: 47),
      ],
      artwork:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/The_Frog_Prince-1875-03.jpg/1280px-The_Frog_Prince-1875-03.jpg",
    ),
  ),
  AudioSource.uri(
    Uri.parse('asset:///assets/audio/fairytales_15_andersen_64kb.mp3'),
    tag: AudioMetadata(
      category: "Category a",
      title: "The Little Match Girl",
      marks: [
        AudioMark(title: 'first', position: 30),
        AudioMark(title: 'second', position: 47),
      ],
      artwork:
          "https://upload.wikimedia.org/wikipedia/commons/e/eb/Christmascarol1843_--_184.jpg",
    ),
  ),
];

final concatenatedAudioSources = ConcatenatingAudioSource(
    useLazyPreparation: true,
    shuffleOrder: DefaultShuffleOrder(),
    children: audioSources);
