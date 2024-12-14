import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';
import 'main_page.dart'; // 必要に応じてmain_page.dartの内容を適切に修正

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentIndex = 0;
  List<int> _order = [];
  bool isPlaying = false;

  final Random _random = Random();

  final List<String> _images = [
   'assets/images/読み札あ.jpg',
   'assets/images/読み札い.jpg',
   'assets/images/読み札う.jpg',
   'assets/images/読み札え.jpg',
   'assets/images/読み札お.jpg',
   'assets/images/読み札か.jpg',
   'assets/images/読み札き.jpg',
   'assets/images/読み札く.jpg',
   'assets/images/読み札け.jpg',
   'assets/images/読み札こ.jpg',
   'assets/images/読み札さ.jpg',
   'assets/images/読み札し.jpg',
   'assets/images/読み札す.jpg',
   'assets/images/読み札せ.jpg',
   'assets/images/読み札そ.jpg',
   'assets/images/読み札た.jpg',
   'assets/images/読み札ち.jpg',
   'assets/images/読み札つ.jpg',
   'assets/images/読み札て.jpg',
   'assets/images/読み札と.jpg',
   'assets/images/読み札な.jpg',
   'assets/images/読み札に.jpg',
   'assets/images/読み札ぬ.jpg',
   'assets/images/読み札ね.jpg',
   'assets/images/読み札の.jpg',
   'assets/images/読み札は.jpg',
   'assets/images/読み札ひ.jpg',
   'assets/images/読み札ふ.jpg',
   'assets/images/読み札へ.jpg',
   'assets/images/読み札ほ.jpg',
   'assets/images/読み札ま.jpg',
   'assets/images/読み札み.jpg',
   'assets/images/読み札む.jpg',
   'assets/images/読み札め.jpg',
   'assets/images/読み札も.jpg',
   'assets/images/読み札や.jpg',
   'assets/images/読み札ゆ.jpg',
   'assets/images/読み札よ.jpg',
   'assets/images/読み札ら.jpg',
   'assets/images/読み札り.jpg',
   'assets/images/読み札る.jpg',
   'assets/images/読み札れ.jpg',
   'assets/images/読み札ろ.jpg',
   'assets/images/読み札わ.jpg',
   'assets/images/読み札を.jpg',
   'assets/images/読み札ん.jpg'
 ];


 final List<String> _audios = [
   'assets/audio/01 トラック01.mp3',
   'assets/audio/02 トラック02.mp3',
   'assets/audio/03 トラック03.mp3',
   'assets/audio/04 トラック04.mp3',
   'assets/audio/05 トラック05.mp3',
   'assets/audio/06 トラック06.mp3',
   'assets/audio/07 トラック07.mp3',
   'assets/audio/08 トラック08.mp3',
   'assets/audio/09 トラック09.mp3',
   'assets/audio/10 トラック10.mp3',
   'assets/audio/11 トラック11.mp3',
   'assets/audio/12 トラック12.mp3',
   'assets/audio/13 トラック13.mp3',
   'assets/audio/14 トラック14.mp3',
   'assets/audio/15 トラック15.mp3',
   'assets/audio/16 トラック16.mp3',
   'assets/audio/17 トラック17.mp3',
   'assets/audio/18 トラック18.mp3',
   'assets/audio/19 トラック19.mp3',
   'assets/audio/20 トラック20.mp3',
   'assets/audio/21 トラック21.mp3',
   'assets/audio/22 トラック22.mp3',
   'assets/audio/23 トラック23.mp3',
   'assets/audio/24 トラック24.mp3',
   'assets/audio/25 トラック25.mp3',
   'assets/audio/26 トラック26.mp3',
   'assets/audio/27 トラック27.mp3',
   'assets/audio/28 トラック28.mp3',
   'assets/audio/29 トラック29.mp3',
   'assets/audio/30 トラック30.mp3',
   'assets/audio/31 トラック31.mp3',
   'assets/audio/32 トラック32.mp3',
   'assets/audio/33 トラック33.mp3',
   'assets/audio/34 トラック34.mp3',
   'assets/audio/35 トラック35.mp3',
   'assets/audio/36 トラック36.mp3',
   'assets/audio/37 トラック37.mp3',
   'assets/audio/38 トラック38.mp3',
   'assets/audio/39 トラック39.mp3',
   'assets/audio/40 トラック40.mp3',
   'assets/audio/41 トラック41.mp3',
   'assets/audio/42 トラック42.mp3',
   'assets/audio/43 トラック43.mp3',
   'assets/audio/44 トラック44.mp3',
   'assets/audio/45 トラック45.mp3',
   'assets/audio/46 トラック46.mp3'
 ];


  @override
  void initState() {
    super.initState();
    _generateRandomOrder();
    _playAudio();

    // 再生完了時の処理を設定
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        if (_currentIndex == _images.length - 1) {
          _showEndDialog(context);
        } else {
          _nextAudio();
        }
      }
    });
  }

  void _generateRandomOrder() {
    _order = List<int>.generate(_images.length, (index) => index);
    _order.shuffle(_random);
  }

  Future<void> _playAudio() async {
    if (_currentIndex < _audios.length) {
      await _audioPlayer.setAsset(_audios[_order[_currentIndex]]);
      _audioPlayer.play();
      setState(() {
        isPlaying = true;
      });
    }
  }

  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  Future<void> _nextAudio() async {
    await _stopAudio();
    if (_currentIndex < _audios.length - 1) {
      setState(() {
        _currentIndex++;
      });
      await _playAudio();
    }
  }

  Future<void> _previousAudio() async {
    await _stopAudio();
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      await _playAudio();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _showEndDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('もう一度遊びますか？'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentIndex = 0; // 最初のカルタに戻る
                  _playAudio(); // 最初の音声を再生
                });
              },
              child: const Text('はい'),
            ),
            TextButton(
              onPressed: () {
                _stopAudio(); // 音声を停止
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MainPage(afterTerms: true),
                  ),
                );
              },
              child: const Text('いいえ'),
            ),
          ],
        );
      },
    );
  }

  void _showCloseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ゲームを終了しますか？'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('いいえ'),
            ),
            TextButton(
              onPressed: () {
                _stopAudio(); // 音声を停止
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MainPage(afterTerms: true),
                  ),
                );
              },
              child: const Text('はい'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size * 0.9;

    final double smallImageWidth = screenSize.width * 0.30;
    final double smallImageHeight = screenSize.height * 0.45;
    final double mainImageWidth = screenSize.width * 0.45;
    final double mainImageHeight = screenSize.height * 0.55;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hougen-background-update2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_currentIndex > 1)
                  Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: Image.asset(
                      _images[_order[_currentIndex - 2]],
                      width: smallImageWidth,
                      height: smallImageHeight,
                    ),
                  ),
                if (_currentIndex > 0)
                  Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: Image.asset(
                      _images[_order[_currentIndex - 1]],
                      width: smallImageWidth,
                      height: smallImageHeight,
                    ),
                  ),
                Column(
                  children: [
                    Text(
                      '${_currentIndex + 1}/${_images.length}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      _images[_order[_currentIndex]],
                      width: mainImageWidth,
                      height: mainImageHeight,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous, size: 40, color: Colors.white),
                    onPressed: _previousAudio,
                  ),
                  IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        _stopAudio();
                      } else {
                        _playAudio();
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next, size: 40, color: Colors.white),
                    onPressed: _nextAudio,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                _showCloseDialog(context);
              },
              child: Image.asset(
                'assets/images/closebutton.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
