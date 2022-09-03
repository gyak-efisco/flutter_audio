import 'package:flutter/material.dart';
import 'package:flutter_audio/static/audioSource.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_audio/screens/player/player_buttons.dart';
import 'package:flutter_audio/screens/player/playlist.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  PlayerState createState() => PlayerState();
}

class PlayerState extends State<Player> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setAudioSource(concatenatedAudioSources);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Playlist(
                player,
                key: const Key('Playlist'),
              )),
              PlayerButtons(player, key: const Key('PlayerButtons')),
            ],
          ),
        ),
      ),
    );
  }
}
