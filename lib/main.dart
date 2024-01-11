import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource('1.flac'));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0? Image.asset('images/introduction.jpg',width:40,height:40): Image.asset('images/introduction.jpg',width:20,height:20), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.flac'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.flac'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.flac'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.flac'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='我對於我自己的了解是自己有興趣的事物會認真去研究，個性有點內向，但會在需要的時候挺身而出。一開始會選擇這個科系的原因是，國中時會考已經考完，有一位電腦老師就在課堂上發下了他自己的教材，標題上面寫著二進制與十六進制，一開始完全不懂，但經過老師的解釋之後，我開始有了興趣......。'
                  '在高一時還不熟悉學校，在校成績並不是很理想，但經過了老師的指導和同學的陪伴，成績漸漸好轉，也對電路相關擁有更多的知識。高二，在電晶體和二極體的部分十分上手。實習的部分我學到了像是python , c++ , c , VB等等，也學習到電路實作，在回家時會到論壇上觀看其他人製作電路的想法。'
                  '在高二暑假時，我到了補習班去上專業知識的課程，發現比學校教的還要深入許多，且還穿插一些大學的課程，一開始我學得很吃力，但因為是暑假，我擁有很多的時間可以做複習，就利用這段時間把自己沒打好的基礎一一補足。'
                  '高三，由於補習班都將課程排在假日，雖然非常辛苦但非常值得，在補習班也認識了不同學校的朋友，有問題時大家就一起討論，或是一起去詢問老師。在經過了這三年的學習，在實作的部分我非常的投入，也想在大學四年延續自己的熱誠，所以選擇這個科系。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.blueAccent,
            child:Image.asset('images/IMG_6001.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/IMG_5100.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/IMG_5426.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {

  final String s2='在大學一年級的時候，上課期間比較多的部分都在加強語言能力，像是英文。課業的部分也沒有很重，所以大多數時間都在學習如何使用python。'
                  '大學二年級時，開始遇到了工程數學，這個科目直到目前對我來說都還是非常棘手，在程式語言的方面學校是在教C，在學指標跟vector。'
                  '大學三年級到目前學習到了C，python,quatus,matlab還有目前正在使用的flutter。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('學習歷程', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s2, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/learn.jpg'),
            height: 200,
            width: 300,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/IMG_5488.JPG'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/IMG_5733.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 300,
              child: ListView(
                children: [
                  Text('1. 享受大學生活'),
                  Text('2. 人際關係'),
                  Text('3. 不遲到'),
                ],
              ),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 300,
              child: ListView(
                children: [
                  Text('1. 享受大學生活'),
                  Text('2. 人際關係'),
                  Text('3. 考取英文證照'),
                  Text('4. 思考專題方向'),
                ],
              ),
            ),
          ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 300,
              child: ListView(
                children: [
                  Text('1. 享受大學生活'),
                  Text('2. 人際關係'),
                  Text('3. 專題製作'),
                  Text('4. 修滿通識課'),
                ],
              ),
            ),
          ],
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大四時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 300,
              child: ListView(
                children: [
                  Text('1. 享受大學生活'),
                  Text('2. 人際關係'),
                  Text('3. 研究所準備'),
                  Text('4. 培養程式能力'),
                ],
              ),
            ),
          ],
        ),
        Row(),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('就業或展業連結'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 300,
              child: ListView(
                children: [
                  Text('1. 軟體工程師'),
                  Text('2. 網路工程師'),
                  Text('3. 韌體工程師'),
                  Text('4. 資訊應用發展工程師'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        //放一張照片
        Container(
          color: Colors.blueGrey,
          child:Image.asset('images/f2.jpg'),
          height: 200,
          width: 150,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 300,
              child: ListView(
                children: [
                  Text(''),
                  Text(''),
                  Text(''),
                  Text('或是選擇讀研究所，直升或是考試'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        //放一張照片
        Container(
          color: Colors.lightBlueAccent,
          child:Image.asset('images/way.png'),
          height: 150,
          width: 200,
        ),
      ],),
    );
  }
}
