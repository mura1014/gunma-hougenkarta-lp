import 'package:flutter/material.dart';

class TermsContainer extends StatelessWidget {
  final VoidCallback onClose;

  const TermsContainer({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.amber[100],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '利用規約',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'この規約は、利用者が共愛学園前橋国際大学(ぐんま方言かるたDX化プロジェクト)が提供する'
                  '「ぐんま方言かるたII読み上げアプリ」(以下「本アプリ」)をご利用頂く際の取り扱いにつき定めるものです。'
                  '本規約に同意した上で本アプリをご利用ください。\n\n'
                  '第一条(本規約への同意)\n'
                  '1.利用者は本利用規約に同意頂いた上で本アプリを利用できるものとします。\n\n'
                  '第二条(アプリ内のコンテンツの権利の帰属と禁止行為)\n'
                  '1.ぐんま方言かるたII読み上げアプリの著作権は共愛学園前橋国際大学に属しています。\n'
                  '2.アプリの利用に際し、公序良俗に反する行為を禁止します。\n'
                  '3.インターネット等で広く本アプリをご紹介いただく場合、スクリーンショットや画面収録等による読み札・絵札の写真及び'
                  '読み上げ音声の公開はご遠慮ください。タイトルについては、問題ありません。\n\n'
                  '第三条(免責)\n'
                  '1.共愛学園前橋国際大学は、本アプリの利用に関して発生したトラブル、損害について一切の責任を負いません。\n\n'
                  '2022年12月15日 施行',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onClose,
              child: const Text('閉じる'),
            ),
          ],
        ),
      ),
    );
  }
}
