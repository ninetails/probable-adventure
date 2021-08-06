import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  NotesPlayer players = new NotesPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonKey(
                color: Colors.red,
                onPressed: () => players.play(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotesPlayer {
  static int MAX_INDEX = 4;
  final indexes =
      List<int>.generate(NotesPlayer.MAX_INDEX, (index) => index + 1);
  late List<AudioPlayer> players;

  NotesPlayer() {
    _initPlayers();
  }

  _initPlayers() async {
    this.players = await Future.wait(indexes.map((num) async {
      final player = AudioPlayer();
      await player.setAsset('assets/note$num.wav');
      await player.load();
      return player;
    }).toList());
  }

  play(num) async {
    if (this.players[num - 1] is AudioPlayer) {
      await this.players[num - 1].play();
    }
  }
}

class ButtonKey extends StatelessWidget {
  final Color color;
  final void Function() onPressed;
  const ButtonKey({Key? key, required this.color, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(this.color),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        )),
      ),
      onPressed: this.onPressed,
      child: Container(),
    );
  }
}
