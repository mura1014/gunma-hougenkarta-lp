import 'package:flutter/material.dart';
import '../widgets/terms_container.dart';
import '../widgets/settings_dialog.dart';
import 'second_page.dart';

class MainPage extends StatefulWidget {
  final bool afterTerms;

  const MainPage({super.key, this.afterTerms = false});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late bool _showTerms;

  @override
  void initState() {
    super.initState();
    _showTerms = !widget.afterTerms; // 初期値はafterTermsの状態によって決定
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Image.asset(
          'assets/images/logo.png',
          width: 140,
          height: 140,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => showSettingsDialog(context, _showTermsCallback),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.green,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(key: UniqueKey()),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/startbutton.png', // ここに正しい画像パスを指定
                      width: 400,
                      height: 300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_showTerms)
            Center(
              child: TermsContainer(
                onClose: () {
                  setState(() {
                    _showTerms = false;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }

  void _showTermsCallback(bool value) {
    setState(() {
      _showTerms = value;
    });
  }
}
