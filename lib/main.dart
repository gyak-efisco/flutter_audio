import 'package:flutter/material.dart';
import 'package:flutter_audio/player/player.dart';
import 'package:flutter_audio/session/SessionForm.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'THI Heal',
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthRoute(),
        '/player': (context) => const PlayerRoute(),
        '/session-form': (context) => const SessionRoute(),
      },
    ),
  );
}

class AuthRoute extends StatelessWidget {
  const AuthRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THI Heal'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign In'),
          onPressed: () {
            Navigator.pushNamed(context, '/player');
          },
        ),
      ),
    );
  }
}


class PlayerRoute extends StatelessWidget {
  const PlayerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player'),
      ),
      body: const Player(),
    );
  }
}

class SessionRoute extends StatelessWidget {
  const SessionRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Healing Session'),
      ),
      body: const SessionForm(),
    );
  }
}
