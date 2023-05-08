import 'package:flutter/material.dart';
import '../component/appbar.dart';
import 'package:Dubeogi/save/save.dart';

class FindScreen extends StatefulWidget {
  const FindScreen({Key? key}) : super(key: key);

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  final Controller = TextEditingController();
  String result = '';
  dynamic getdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '동국대학교',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 200.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: '검색하거나 아래 목록을 터치하세요',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: Controller,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      result = Controller.text;
                      getdata = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BuildingInfo(
                            title: result,
                          ),
                        ),
                      );
                      setState(() {
                        Navigator.pop(context, getdata);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apartment_rounded,
                        ),
                        Text(
                          '건물 검색',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  final name = names[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Controller.text = name;
                      });
                    },
                    child: ListTile(
                      title: Text(name),
                      //subtitle: Text('$name'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}

//--------------------------------------------------------------

class BuildingInfo extends StatefulWidget {
  final String title;

  const BuildingInfo({Key? key, required this.title}) : super(key: key);

  @override
  State<BuildingInfo> createState() => _BuildingInfoState();
}

class _BuildingInfoState extends State<BuildingInfo> {
  dynamic getdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "동국대학교",
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/photo/test.png',
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15.0, width: 20.0),
          // 2개의 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () async {
                  getdata = await Navigator.pushNamed(
                    context,
                    '/search',
                    arguments: {'start': widget.title, 'end': ''},
                  );
                  setState(() {
                    Navigator.pop(context, getdata);
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: Size(100, 0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.directions_walk, color: Colors.blue),
                    SizedBox(width: 4),
                    Text('출발', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(width: 25),
              OutlinedButton(
                onPressed: ()  async {
                  getdata = await Navigator.pushNamed(
                    context,
                    '/search',
                    arguments: {'start': '', 'end': widget.title},
                  );
                  setState(() {
                    Navigator.pop(context, getdata);
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: Size(100, 0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.directions_walk, color: Colors.white),
                    SizedBox(width: 4),
                    Text('도착', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 60.0,
            child: ListTile(
              leading: Icon(Icons.access_time), // 아이콘
              title: Text('이용시간'),
              subtitle: Text('09:00 ~ 18:00'),
            ),
          ),
          Container(
            height: 60.0,
            child: ListTile(
              leading: Icon(Icons.phone), // 아이콘
              title: Text('전화번호'),
              subtitle: Text('02-123-4567'),
            ),
          ),
          Container(
            height: 60.0,
            child: ListTile(
              leading: Icon(Icons.shower), // 아이콘
              title: Text('샤워실'),
              subtitle: Text('4층'),
            ),
          ),
          Container(
            height: 60.0,
            child: ListTile(
              leading: Icon(Icons.local_drink), // 아이콘
              title: Text('자판기'),
              subtitle: Text('3층'),
            ),
          ),
          Container(
            height: 60.0,
            child: ListTile(
              leading: Icon(Icons.local_drink), // 아이콘
              title: Text('자판기'),
              subtitle: Text('4층'),
            ),
          ),
          Container(
            height: 60.0,
            child: ListTile(
              leading: Icon(Icons.local_drink), // 아이콘
              title: Text('자판기'),
              subtitle: Text('5층'),
            ),
          ),
        ],
      ),
    );
  }
}
