import 'package:demo/Classes/Models/qariModel.dart';
import 'package:demo/Classes/Models/surah.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen(
      {Key? key, required this.index, required this.list, required this.qari})
      : super(key: key);
  final Qari qari;
  final int index;
  final List<Surah> list;

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final _player = AudioPlayer();
  bool isLoopingCurrentItem = false;
  Duration defaultDuration = Duration(microseconds: 1);
  String? ind;
  int currentIndex = 0;
  int dataIndex = 0;

  @override
  void initState() {
    setState(() {
      currentIndex = widget.index - 1;
      dataIndex = widget.index - 1;
    });

    if (widget.index < 10) {
      ind = "00" + (widget.index.toString());
    } else if (widget.index < 100) {
      ind = "0" + (widget.index.toString());
    } else if (widget.index > 100) {
      ind = (widget.index.toString());
    }
    // _initAudioPlayer(int!.widget.qari);
    super.initState();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
