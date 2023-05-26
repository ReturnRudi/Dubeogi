import 'package:Dubeogi/algorithm/astar.dart';

String vendingPath = 'assets/images/facility/vending.png';
String showerPath = 'assets/images/facility/showerbooth.png';
String storePath = 'assets/images/facility/store.png';
String atmPath = 'assets/images/facility/atm.png';
String loungePath = 'assets/images/facility/lounge.png';
String printerPath = 'assets/images/facility/printer.png';

Map<String, String> OriginalData = {
  '과학관':'assets/images/과학관(1102,2973).png',
  '다향관':'assets/images/다향관(1337,2379).png',
  '대운동장':'assets/images/대운동장(1308,3206).png',
  '법학관_만해관':'assets/images/법학관_만해관(1528,2563).png',
  '만해광장':'assets/images/만해광장(972,1880).png',
  '명진관':'assets/images/명진관(1129,2805).png',
  '문화관':'assets/images/문화관(2297,2582).png',
  '본관':'assets/images/본관(1017,2394).png',
  '사회과학관_경영관':'assets/images/사회과학관_경영관(2145,2775).png',
  '상록원':'assets/images/상록원(1067,3118).png',
  '신공학관':'assets/images/신공학관(482,2525).png',
  '원흥관':'assets/images/원흥관(694,2084).png',
  '정각원':'assets/images/정각원(1673,2941).png',
  '정보문화관p':'assets/images/정p(769,1920).png',
  '정보문화관q':'assets/images/정q(634,1866).png',
  '중앙도서관':'assets/images/중앙도서관(897,2663).png',
  '체육관':'assets/images/체육관(1321,1843).png',
  '학림관':'assets/images/학림관(1078,1636).png',
  '학생회관':'assets/images/학생회관(670,1773).png',
  '학술관':'assets/images/학술관(2527,2567).png',
  '혜화관':'assets/images/혜화관(1804,2964).png'
};

Map<String, String> LookData = {
  '과학관':'assets/images/과학관(1102,2973).png',
  '다향관':'assets/images/다향관(1337,2379).png',
  '대운동장':'assets/images/대운동장(1308,3206).png',
  '법학관_만해관':'assets/images/법학관_만해관(1528,2563).png',
  '만해광장':'assets/images/만해광장(972,1880).png',
  '명진관':'assets/images/명진관(1129,2805).png',
  '문화관':'assets/images/문화관(2297,2582).png',
  '본관':'assets/images/본관(1017,2394).png',
  '사회과학관_경영관':'assets/images/사회과학관_경영관(2145,2775).png',
  '상록원':'assets/images/상록원(1067,3118).png',
  '신공학관':'assets/images/신공학관(482,2525).png',
  '원흥관':'assets/images/원흥관(694,2084).png',
  '정각원':'assets/images/정각원(1673,2941).png',
  '정보문화관p':'assets/images/정p(769,1920).png',
  '정보문화관q':'assets/images/정q(634,1866).png',
  '중앙도서관':'assets/images/중앙도서관(897,2663).png',
  '체육관':'assets/images/체육관(1321,1843).png',
  '학림관':'assets/images/학림관(1078,1636).png',
  '학생회관':'assets/images/학생회관(670,1773).png',
  '학술관':'assets/images/학술관(2527,2567).png',
  '혜화관':'assets/images/혜화관(1804,2964).png'
};

List<String> allFileNames = [
  '과학관1.png',
  '문화관B1.png',
  '문화관1.png',
  '문화관4.png',
  '법학관_만해관_1F.png',
  '본관3.png',
  '사회과학관_경영관_2F.png',
  '사회과학관_경영관_3F.png',
  '신공학관1.png',
  '신공학관3.png',
  '신공학관7.png',
  '신공학관9.png',
  '원흥관1.png',
  '원흥관2.png',
  '원흥관3.png',
  '원흥관4.png',
  '정보문화관p_3F.png',
  '정보문화관q_3F.png',
  '정보문화관p_2F.png',
  '학림관_1F.png',
  '학술관1.png',
  '학술관2.png',
  '학술관3.png',
  '혜화관1.png',
  '혜화관4.png',
];

final List<String> buildings = [
  '과학관',
  '다향관',
  '대운동장',
  '만해광장',
  '명진관',
  '문화관',
  '법학관_만해관',
  '본관',
  '사회과학관_경영관',
  '상록원',
  '신공학관',
  '원흥관',
  '정각원',
  '정보문화관p',
  '정보문화관q',
  '중앙도서관',
  '체육관',
  '학림관',
  '학생회관',
  '학술관',
  '혜화관'
];

final List<String> selectFromMap = [
  '지도에서 선택한 출발지',
  '지도에서 선택한 도착지'
];

List<Node> pathguide = [];
List<String> directions = [];

void initGraph() {
/*    graph.addEdge("Node1 이름", "Node2 이름", 거리, "평지" or "계단위" or "계단아래" or "오르막" or "내리막", "도보" or "차도",
        node1X: Node1 x 픽셀값,
        node1Y: Node1 y 픽셀값,
        isInside1: 야외면 0, 실내면 층 수,
        building1: "실외" or "건물 이름",
        showRoute1: 안내해야하는 엣지면 true, 아니라면 false,
        node2X: Node2 x 픽셀값,
        node2Y: Node2 y 픽셀값,
        isInside2: 야외면 0, 실내면 층 수,
        building2: "실외" or "건물 이름",
        showRoute2: 안내해야하는 엣지면 true, 아니라면 false);*/
//1
  graph.addEdge("신공 9층 입구", "신공 9층 입구 앞", 21, "평지", "도보",
      node1X: 900,
      node1Y: 2635,
      isInside1: 0,
      building1: "실외",
      showRoute1: true,
      node2X: 920,
      node2Y: 2641,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 9층 입구 앞", "신공 9층 입구", 21, "평지", "도보");
//61
  graph.addEdge("신공 9층 입구 앞", "신공 중도 갈림길", 9, "평지", "도보",
      node2X: 982,
      node2Y: 2661,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 중도 갈림길", "신공 9층 입구 앞", 9, "평지", "도보");
//2
  graph.addEdge("신공 중도 갈림길", "중도 후문", 9, "평지", "도보",
      node2X: 978,
      node2Y: 2673,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 후문", "신공 중도 갈림길", 9, "평지", "도보");
//3
  graph.addEdge("신공 중도 갈림길", "신공 중도 갈림길2", 107, "평지", "도보",
      node2X: 1067,
      node2Y: 2687,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 중도 갈림길2", "신공 중도 갈림길", 107, "평지", "도보");
//4
  graph.addEdge("신공 중도 갈림길2", "중도 옆 계단 아래", 21, "평지", "도보",
      node2X: 1088,
      node2Y: 2694,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆 계단 아래", "신공 중도 갈림길2", 21, "평지", "도보");
//5
  graph.addEdge("중도 옆 계단 아래", "중도 옆 계단 위", 56, "계단위", "도보",
      node2X: 1139,
      node2Y: 2712,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆 계단 위", "중도 옆 계단 아래", 30, "계단아래", "도보");
//6
  graph.addEdge("중도 옆 계단 위", "중도 정문 앞", 44, "평지", "도보",
      node2X: 1126,
      node2Y: 2754,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 정문 앞", "중도 옆 계단 위", 44, "평지", "도보");
//7
  graph.addEdge("중도 정문 앞", "중도 정문", 10, "평지", "도보",
      node2X: 1116,
      node2Y: 2752,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 정문", "중도 정문 앞", 10, "평지", "도보");
//8
  graph.addEdge("신공 중도 갈림길2", "중도 옆옆 계단 앞", 14, "평지", "도보",
      node2X: 1071,
      node2Y: 2674,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆옆 계단 앞", "신공 중도 갈림길2", 14, "평지", "도보");
//9
  graph.addEdge("중도 옆옆 계단 앞", "중도 옆옆 계단 위", 14, "평지", "도보",
      node2X: 1058,
      node2Y: 2670,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆옆 계단 위", "중도 옆옆 계단 앞", 14, "평지", "도보");
//10
  graph.addEdge("중도 옆옆 계단 위", "중도 옆옆 계단 아래", 10, "계단아래", "도보",
      node2X: 1047,
      node2Y: 2665,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆옆 계단 아래", "중도 옆옆 계단 위", 18, "계단위", "도보");
//11
  graph.addEdge("중도 옆옆 계단 아래", "지하주차장 앞", 67, "평지", "도보",
      node2X: 1002,
      node2Y: 2615,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 앞", "중도 옆옆 계단 아래", 67, "평지", "도보");
//12
  graph.addEdge("중도 옆옆 계단 앞", "본관 중도 쪽문", 77, "평지", "도보",
      node2X: 1161,
      node2Y: 2698,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 중도 쪽문", "중도 옆옆 계단 앞", 77, "평지", "도보");
//13
  graph.addEdge("중도 옆 계단 위", "팔정도 좌측 하단", 82, "평지", "도보",
      node2X: 1212,
      node2Y: 2749,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 좌측 하단", "중도 옆 계단 위", 82, "평지", "도보");
//14
  graph.addEdge("중도 옆 계단 위", "팔정도 좌측 하단3", 44, "평지", "도보",
      node2X: 1169,
      node2Y: 2744,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 좌측 하단3", "중도 옆 계단 위", 44, "평지", "도보");
//15
  graph.addEdge("팔정도 좌측 하단3", "팔정도 좌측 하단2", 19, "평지", "차도",
      node2X: 1188,
      node2Y: 2742,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 좌측 하단2", "팔정도 좌측 하단3", 19, "평지", "차도");
//16
  graph.addEdge("팔정도 좌측 하단", "팔정도 좌측 하단2", 25, "평지", "차도");
  graph.addEdge("팔정도 좌측 하단2", "팔정도 좌측 하단", 25, "평지", "차도");
//17
  graph.addEdge("팔정도 좌측 하단3", "상록원 가는 길 명진관 계단 앞", 190, "평지", "차도",
      node2X: 1113,
      node2Y: 2930,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 앞", "팔정도 좌측 하단3", 190, "평지", "차도");
//18
  graph.addEdge("상록원 가는 길 명진관 계단 앞", "상록원 가는 길 명진관 계단 아래", 52, "평지", "도보",
      node2X: 1163,
      node2Y: 2947,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 아래", "상록원 가는 길 명진관 계단 앞", 52, "평지", "도보");
//19
  graph.addEdge("상록원 가는 길 명진관 계단 아래", "상록원 가는 길 명진관 계단 중간", 21, "계단위", "도보",
      node2X: 1162,
      node2Y: 2960,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 중간", "상록원 가는 길 명진관 계단 아래", 11, "계단아래", "도보");
//20
  graph.addEdge("상록원 가는 길 명진관 계단 중간", "상록원 가는 길 명진관 계단 위", 20, "계단위", "도보",
      node2X: 1176,
      node2Y: 2942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 위", "상록원 가는 길 명진관 계단 중간", 11, "계단아래", "도보");
//21
  graph.addEdge("상록원 가는 길 명진관 계단 앞", "상록원 가는 길", 57, "평지", "차도",
      node2X: 1101,
      node2Y: 2981,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길", "상록원 가는 길 명진관 계단 앞", 57, "평지", "차도");
//22
  graph.addEdge("상록원 가는 길", "상록원 가는 길2", 162, "오르막", "차도",
      node2X: 1102,
      node2Y: 3089,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길2", "상록원 가는 길", 86, "내리막", "차도");
//23
  graph.addEdge("상록원 가는 길2", "상록원 가는 길3", 42, "평지", "차도",
      node2X: 1090,
      node2Y: 3129,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길3", "상록원 가는 길2", 42, "평지", "차도");
//24
  graph.addEdge("상록원 가는 길3", "상록원 가는 길4", 36, "평지", "차도",
      node2X: 1079,
      node2Y: 3163,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길4", "상록원 가는 길3", 36, "평지", "차도");
//25
  graph.addEdge("상록원 가는 길4", "상록원 옆입구", 32, "평지", "도보",
      node2X: 1110,
      node2Y: 3172,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 옆입구", "상록원 가는 길4", 32, "평지", "도보");
//26
  graph.addEdge("상록원 가는 길3", "상록원 과학관 갈림길", 29, "평지", "도보",
      node2X: 1117 ,
      node2Y: 3139,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 과학관 갈림길", "상록원 가는 길3", 29, "평지", "도보");
//27
  graph.addEdge("상록원 과학관 갈림길", "상록원 앞", 17, "평지", "도보",
      node2X: 1133 ,
      node2Y: 3144,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 앞", "상록원 과학관 갈림길", 17, "평지", "도보");
//28
  graph.addEdge("상록원 앞", "상록원 정문", 9, "평지", "도보",
      node2X: 1127 ,
      node2Y: 3151,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 정문", "상록원 앞", 9, "평지", "도보");
//29
  graph.addEdge("상록원 앞", "상록원 옆 갈림길", 66, "평지", "도보",
      node2X: 1198,
      node2Y: 3135,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 옆 갈림길", "상록원 앞", 66, "평지", "도보");
//30
  graph.addEdge("상록원 옆 갈림길", "상록원 후문 앞", 77, "평지", "도보",
      node2X: 1263,
      node2Y: 3176,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 후문 앞", "상록원 옆 갈림길", 77, "평지", "도보");
//31
  graph.addEdge("상록원 후문 앞", "대운동장 상록원 계단 위", 41, "평지", "도보",
      node2X: 1287,
      node2Y: 3143,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 상록원 계단 위", "상록원 후문 앞", 41, "평지", "도보");
//32
  graph.addEdge("상록원 후문 앞", "상록원 후문", 19, "평지", "도보",
      node2X: 1252,
      node2Y: 3192,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 후문", "상록원 후문 앞", 19, "평지", "도보");
//33
  graph.addEdge("상록원 옆 갈림길", "상록원 옆 길", 41, "평지", "도보",
      node2X: 1238,
      node2Y: 3124,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 옆 길", "상록원 옆 갈림길", 41, "평지", "도보");
//34
  graph.addEdge("대운동장 상록원 계단 위", "상록원 옆 길", 53, "평지", "도보");
  graph.addEdge("상록원 옆 길", "대운동장 상록원 계단 위", 53, "평지", "도보");
//35
  graph.addEdge("대운동장 상록원 계단 위", "대운동장 상록원 계단 갈림길", 116, "계단아래", "도보",
      node2X: 1423,
      node2Y: 3193,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 상록원 계단 갈림길", "대운동장 상록원 계단 위", 217, "계단위", "도보");
//36
  graph.addEdge("대운동장 상록원 계단 갈림길", "대운동장 상록원 계단 아래", 44, "계단아래", "도보",
      node2X: 1475,
      node2Y: 3212,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 상록원 계단 아래", "대운동장 상록원 계단 갈림길", 83, "계단위", "도보");
//37
  graph.addEdge("대운동장 상록원 계단 갈림길", "과학관 우측 입구 앞", 108, "계단위", "도보",
      node2X: 1444,
      node2Y: 3124,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 우측 입구 앞", "대운동장 상록원 계단 갈림길", 58, "계단아래", "도보");
//38
  graph.addEdge("과학관 우측 입구 앞", "과학관 우측 입구", 24, "평지", "도보",
      node2X: 1421,
      node2Y: 3117,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 우측 입구", "과학관 우측 입구 앞", 24, "평지", "도보");
//39
  graph.addEdge("과학관 우측 입구 앞", "명진관 과학관 우측 하단", 47, "평지", "도보",
      node2X: 1458,
      node2Y: 3079,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 우측 하단", "과학관 우측 입구 앞", 47, "평지", "도보");
//40
  graph.addEdge("상록원 과학관 갈림길", "과학관 좌측 입구 앞", 114, "평지", "도보",
      node2X: 1153,
      node2Y: 3031,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 좌측 입구 앞", "상록원 과학관 갈림길", 114, "평지", "도보");
//41
  graph.addEdge("과학관 좌측 입구 앞", "과학관 좌측 입구", 9, "평지", "도보",
      node2X: 1162,
      node2Y: 3034,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 좌측 입구", "과학관 좌측 입구 앞", 9, "평지", "도보");
//42
  graph.addEdge("과학관 좌측 입구 앞", "명진관 과학관 좌측 하단", 45, "평지", "도보",
      node2X: 1167,
      node2Y: 2988,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 좌측 하단", "과학관 좌측 입구 앞", 45, "평지", "도보");
//43
  graph.addEdge("명진관 과학관 좌측 하단", "상록원 가는 길 명진관 계단 위", 42, "평지", "도보");
  graph.addEdge("상록원 가는 길 명진관 계단 위", "명진관 과학관 좌측 하단", 42, "평지", "도보");
//44
  graph.addEdge("명진관 과학관 좌측 하단", "과학관 정문 앞", 145, "평지", "차도",
      node2X: 1305,
      node2Y: 3031,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 정문 앞", "명진관 과학관 좌측 하단", 145, "평지", "차도");
//45
  graph.addEdge("과학관 정문 앞", "과학관 정문", 13, "평지", "도보",
      node2X: 1304,
      node2Y: 3044,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 정문", "과학관 정문 앞", 13, "평지", "도보");
//46
  graph.addEdge("과학관 정문 앞", "명진관 과학관 우측 하단", 160, "평지", "차도");
  graph.addEdge("명진관 과학관 우측 하단", "과학관 정문 앞", 160, "평지", "차도");
//47
  graph.addEdge("과학관 정문 앞", "명진관 과학관 중앙", 57, "평지", "도보",
      node2X: 1304,
      node2Y: 2974,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙", "과학관 정문 앞", 57, "평지", "도보");
//48
  graph.addEdge("명진관 과학관 중앙", "명진관 과학관 중앙 왼쪽", 115, "평지", "도보",
      node2X: 1195,
      node2Y: 2937,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙 왼쪽", "명진관 과학관 중앙", 115, "평지", "도보");
//49
  graph.addEdge("명진관 과학관 중앙", "명진관 과학관 중앙 오른쪽", 99, "평지", "도보",
      node2X: 1398,
      node2Y: 3005,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙 오른쪽", "명진관 과학관 중앙", 99, "평지", "도보");
//50
  graph.addEdge("명진관 과학관 중앙", "명진관 후문", 38, "평지", "도보",
      node2X: 1303,
      node2Y: 2936,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 후문", "명진관 과학관 중앙", 38, "평지", "도보");
//51
  graph.addEdge("상록원 가는 길 명진관 계단 위", "명진관 왼쪽길", 5, "평지", "도보",
      node2X: 1176,
      node2Y: 2942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽길", "상록원 가는 길 명진관 계단 위", 5, "평지", "도보");
//52
  graph.addEdge("명진관 왼쪽길", "명진관 과학관 중앙 왼쪽 끝", 9, "평지", "도보",
      node2X: 1180,
      node2Y: 2934,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙 왼쪽 끝", "명진관 왼쪽길", 9, "평지", "도보");
//53
  graph.addEdge("명진관 과학관 중앙 왼쪽 끝", "명진관 과학관 중앙 왼쪽", 15, "평지", "도보");
  graph.addEdge("명진관 과학관 중앙 왼쪽", "명진관 과학관 중앙 왼쪽 끝", 15, "평지", "도보");
//54
  graph.addEdge("명진관 과학관 중앙 왼쪽", "명진관 왼쪽 후문 앞", 22, "평지", "도보",
      node2X: 1202,
      node2Y: 2916,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 후문 앞", "명진관 과학관 중앙 왼쪽", 22, "평지", "도보");
//55
  graph.addEdge("명진관 왼쪽 후문 앞", "명진관 왼쪽 후문", 21, "평지", "도보",
      node2X: 1182,
      node2Y: 2910,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 후문", "명진관 왼쪽 후문 앞", 21, "평지", "도보");
//56
  graph.addEdge("명진관 과학관 중앙 오른쪽", "명진관 오른쪽 후문 앞", 22, "평지", "도보",
      node2X: 1405,
      node2Y: 2984,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 후문 앞", "명진관 과학관 중앙 오른쪽", 22, "평지", "도보");
//57
  graph.addEdge("명진관 오른쪽 후문 앞", "명진관 오른쪽 후문", 21, "평지", "도보",
      node2X: 1425,
      node2Y: 2990,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 후문", "명진관 오른쪽 후문 앞", 21, "평지", "도보");
//58
  graph.addEdge("명진관 과학관 중앙 오른쪽", "명진관 오른쪽길", 20, "평지", "도보",
      node2X: 1393,
      node2Y: 3024,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽길", "명진관 과학관 중앙 오른쪽", 20, "평지", "도보");
//59
  graph.addEdge("명진관 오른쪽길", "명진관 오른쪽 아래", 64, "평지", "도보",
      node2X: 1454,
      node2Y: 3044,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 아래", "명진관 오른쪽길", 64, "평지", "도보");
//60, 61 다른곳에
//62
  graph.addEdge("명진관 오른쪽 아래", "명진관 우측 입구 앞", 83, "평지", "도보",
      node2X: 1478,
      node2Y: 2965,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 우측 입구 앞", "명진관 오른쪽 아래", 83, "평지", "도보");
//63
  graph.addEdge("명진관 우측 입구 앞", "명진관 우측 입구", 9, "평지", "도보",
      node2X: 1469,
      node2Y: 2963,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 우측 입구", "명진관 우측 입구 앞", 9, "평지", "도보");
//64
  graph.addEdge("명진관 우측 입구 앞", "명진관 오른쪽 위", 48, "평지", "도보",
      node2X: 1495,
      node2Y: 2920,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 위", "명진관 우측 입구 앞", 48, "평지", "도보");
//65
  graph.addEdge("명진관 오른쪽 위", "명진관 오른쪽 계단 위", 51, "평지", "도보",
      node2X: 1451,
      node2Y: 2894,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 계단 위", "명진관 오른쪽 위", 51, "평지", "도보");
//66
  graph.addEdge("명진관 오른쪽 계단 위", "명진관 정문 앞", 124, "평지", "도보",
      node2X: 1334,
      node2Y: 2853,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 정문 앞", "명진관 오른쪽 계단 위", 124, "평지", "도보");
//67
  graph.addEdge("명진관 정문 앞", "명진관 정문", 22, "평지", "도보",
      node2X: 1327,
      node2Y: 2874,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 정문", "명진관 정문 앞", 22, "평지", "도보");
//68
  graph.addEdge("명진관 정문 앞", "명진관 왼쪽 계단 위", 118, "평지", "도보",
      node2X: 1223,
      node2Y: 2812,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 계단 위", "명진관 정문 앞", 118, "평지", "도보");
//69
  graph.addEdge("팔정도 좌측 하단3", "명진관 왼쪽 계단 위", 130, "계단위", "도보");
  graph.addEdge("명진관 왼쪽 계단 위", "팔정도 좌측 하단3", 69, "계단아래", "도보");
//70
  graph.addEdge("명진관 왼쪽 계단 위", "명진관 좌측 상단", 58, "평지", "도보",
      node2X: 1167,
      node2Y: 2815,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 상단", "명진관 왼쪽 계단 위", 58, "평지", "도보");
//60
  graph.addEdge("명진관 좌측 상단", "명진관 좌측 입구 앞", 61, "평지", "도보",
      node2X: 1147,
      node2Y: 2874,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구 앞", "명진관 좌측 상단", 61, "평지", "도보");
//71
  graph.addEdge("명진관 좌측 입구 앞", "명진관 좌측 입구", 6, "평지", "도보",
      node2X: 1153,
      node2Y: 2876  ,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구", "명진관 좌측 입구 앞", 6, "평지", "도보");
//72
  graph.addEdge("명진관 좌측 입구 앞", "명진관 좌측 하단", 54, "평지", "도보",
      node2X: 1130,
      node2Y: 2925,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구", "명진관 좌측 하단", 54, "평지", "도보");
//73
  graph.addEdge("명진관 좌측 하단", "명진관 왼쪽길", 50, "평지", "도보");
  graph.addEdge("명진관 왼쪽길", "명진관 좌측 하단", 50, "평지", "도보");
//74
  graph.addEdge("명진관 정문 앞", "명진관 중앙 계단 아래", 51, "계단아래", "도보",
      node2X: 1351,
      node2Y: 2792,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 중앙 계단 아래", "명진관 정문 앞", 95, "계단위", "도보");
//75
  graph.addEdge("명진관 오른쪽 계단 위", "명진관 오른쪽 계단 아래", 68, "계단아래", "도보",
      node2X: 1522,
      node2Y: 2847,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 계단 아래", "명진관 오른쪽 계단 위", 128, "계단위", "도보");
//76
  graph.addEdge("명진관 과학관 우측 하단", "과학관 차도 입구 앞", 175, "평지", "차도",
      node2X: 1514,
      node2Y: 2913,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 차도 입구 앞", "명진관 과학관 우측 하단", 175, "평지", "차도");
//77
  graph.addEdge("과학관 차도 입구 앞", "과학관 차도 입구", 36, "평지", "차도",
      node2X: 1544,
      node2Y: 2893,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 차도 입구", "과학관 차도 입구 앞", 36, "평지", "차도");
//78
  graph.addEdge("명진관 오른쪽 계단 아래", "과학관 차도 입구", 51, "평지", "차도");
  graph.addEdge("과학관 차도 입구", "명진관 오른쪽 계단 아래", 51, "평지", "차도");
//79
  graph.addEdge("과학관 차도 입구", "만해관 내려가는 길1", 64, "내리막", "차도",
      node2X: 1528,
      node2Y: 3038,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 내려가는 길1", "과학관 차도 입구", 219, "오르막", "차도");
//80
  graph.addEdge("만해관 내려가는 길1", "만해관 내려가는 길2", 80, "평지", "차도",
      node2X: 1519,
      node2Y: 3117,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 내려가는 길2", "만해관 내려가는 길1", 80, "평지", "차도");
//81
  graph.addEdge("만해관 내려가는 길2", "만해관 내려가는 길3", 91, "평지", "차도",
      node2X: 1556,
      node2Y: 3200,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 내려가는 길3", "만해관 내려가는 길2", 91, "평지", "차도");
//82
  graph.addEdge("대운동장 상록원 계단 아래", "대운동장 입구 앞", 34, "평지", "도보",
      node2X: 1509,
      node2Y: 3208,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 입구 앞", "대운동장 상록원 계단 아래", 34, "평지", "도보");
//83
  graph.addEdge("대운동장 입구 앞", "만해관 내려가는 길3", 48, "평지", "도보");
  graph.addEdge("만해관 내려가는 길3", "대운동장 입구 앞", 48, "평지", "도보");
//90
  graph.addEdge("대운동장 입구 앞", "대운동장 입구", 30, "평지", "도보",
      node2X: 1501,
      node2Y: 3237,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 입구", "대운동장 입구 앞", 30, "평지", "도보");
//84
  graph.addEdge("만해관 내려가는 길3", "정문3", 115, "내리막", "차도",
      node2X: 1694,
      node2Y: 3241,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문3", "만해관 내려가는 길3", 216, "오르막", "차도");
//85
  graph.addEdge("정문3", "정문2", 328, "내리막", "차도",
      node2X: 2087,
      node2Y: 3357,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문2", "정문3", 615, "오르막", "차도");
//86
  graph.addEdge("정문2", "정문", 236, "내리막", "차도",
      node2X: 2380,
      node2Y: 3389,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문", "정문2", 442, "오르막", "차도");
//87
  graph.addEdge("만해관 내려가는 길1", "만해관 옆 계단 아래", 47, "계단아래", "도보",
      node2X: 1557,
      node2Y: 3089,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 옆 계단 아래", "만해관 내려가는 길1", 88, "계단위", "도보");
//88
  graph.addEdge("만해관 옆 계단 아래", "정각원 계단 아래", 169, "평지", "도보",
      node2X: 1723,
      node2Y: 3121,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원 계단 아래", "만해관 옆 계단 아래", 169, "평지", "도보");
//89
  graph.addEdge("정각원 계단 아래", "정문 혜화관3", 95, "평지", "도보",
      node2X: 1815,
      node2Y: 3143,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관3", "정각원 계단 아래", 95, "평지", "도보");
//91
  graph.addEdge("정문 혜화관3", "정문 혜화관2", 67, "평지", "차도",
      node2X: 1750,
      node2Y: 3159,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관2", "정문 혜화관3", 67, "평지", "차도");
//92
  graph.addEdge("정문 혜화관2", "정문 혜화관1", 53, "평지", "차도",
      node2X: 1711,
      node2Y: 3195,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관1", "정문 혜화관2", 53, "평지", "차도");
//93
  graph.addEdge("정문 혜화관1", "정문3", 49, "평지", "차도");
  graph.addEdge("정문3", "정문 혜화관1", 49, "평지", "차도");
//94
  graph.addEdge("정문 혜화관3", "혜화별관 입구 앞", 24, "평지", "차도",
      node2X: 1838,
      node2Y: 3149,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 입구 앞", "정문 혜화관3", 24, "평지", "차도");
//95
  graph.addEdge("혜화별관 입구 앞", "혜화별관 입구", 43, "평지", "도보",
      node2X: 1850,
      node2Y: 3108,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 입구", "혜화별관 입구 앞", 43, "평지", "도보");
//96
  graph.addEdge("혜화별관 입구 앞", "정문 혜화관4", 45, "평지", "차도",
      node2X: 1882,
      node2Y: 3160,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관4", "혜화별관 입구 앞", 45, "평지", "차도");
//97
  graph.addEdge("정문 혜화관4", "혜화별관 쪽문 옆", 84, "평지", "도보",
      node2X: 1909,
      node2Y: 3080,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 쪽문 옆", "정문 혜화관4", 84, "평지", "도보");
//98
  graph.addEdge("혜화별관 쪽문 옆", "혜화별관 쪽문 앞", 16, "평지", "도보",
      node2X: 1894,
      node2Y: 3075,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 쪽문 앞", "혜화별관 쪽문 옆", 16, "평지", "도보");
//99
  graph.addEdge("혜화별관 쪽문 앞", "혜화별관 쪽문", 9, "평지", "도보",
      node2X: 1891,
      node2Y: 3084,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 쪽문", "혜화별관 쪽문 앞", 9, "평지", "도보");
//100
  graph.addEdge("정문 혜화관4", "정문 혜화관5", 171, "평지", "차도",
      node2X: 2047,
      node2Y: 3206,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관5", "정문 혜화관4", 171, "평지", "차도");
//101
  graph.addEdge("정문 혜화관5", "경영관 차도1", 66, "내리막", "차도",
      node2X: 2107,
      node2Y: 3262,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도1", "정문 혜화관5", 123, "오르막", "차도");
//102
  graph.addEdge("경영관 차도1", "경영관 차도2", 83, "내리막", "차도",
      node2X: 2189,
      node2Y: 3275,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도2", "경영관 차도1", 124, "오르막", "차도");
//103
  graph.addEdge("경영관 차도2", "경영관 차도3", 50, "평지", "차도",
      node2X: 2235,
      node2Y: 3255,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도3", "경영관 차도2", 50, "평지", "차도");
//104
  graph.addEdge("경영관 차도3", "경영관 2층 쪽문 앞", 42, "평지", "도보",
      node2X: 2243,
      node2Y: 3296,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문 앞", "경영관 차도3", 42, "평지", "도보");
  //437
  graph.addEdge("경영관 2층 쪽문 앞", "경영관 2층 쪽문", 11, "평지", "도보",
      node2X: 2254,
      node2Y: 3293,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문", "경영관 2층 쪽문 앞", 11, "평지", "도보");
  //436
  graph.addEdge("경영관 2층 쪽문 앞", "경영관 2층 쪽문 계단", 5, "평지", "도보",
      node2X: 2246,
      node2Y: 3300,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문 계단", "경영관 2층 쪽문 앞", 5, "평지", "도보");
//105
  graph.addEdge("경영관 차도3", "경영관 차도4", 100, "평지", "차도",
      node2X: 2281,
      node2Y: 3166,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도4", "경영관 차도3", 100, "평지", "차도");
//107
  graph.addEdge("경영관 차도4", "경영관 2층 입구", 48, "평지", "도보",
      node2X: 2329,
      node2Y: 3163,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 입구", "경영관 차도4", 48, "평지", "도보");
//108
  graph.addEdge("경영관 차도4", "경영관 계단 아래", 66, "평지", "차도",
      node2X: 2218,
      node2Y: 3145,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 계단 아래", "경영관 차도4", 66, "평지", "차도");
  //106
  graph.addEdge("경영관 계단 아래", "사회과학관 2층 옆문", 27, "평지", "도보",
      node2X: 2226,
      node2Y: 3119,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 옆문", "경영관 계단 아래", 27, "평지", "도보");
//109
  graph.addEdge("경영관 계단 아래", "경영관 계단 위", 110, "계단위", "도보",
      node2X: 2148,
      node2Y: 3124,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 계단 위", "경영관 계단 아래", 58, "계단아래", "도보");
//110
  graph.addEdge("경영관 계단 위", "정문 혜화관7", 51, "평지", "도보",
      node2X: 2099,
      node2Y: 3111,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관7", "경영관 계단 위", 51, "평지", "도보");
//111
  graph.addEdge("정문 혜화관5", "정문 혜화관6", 50, "평지", "차도",
      node2X: 2079,
      node2Y: 3168,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관6", "정문 혜화관5", 50, "평지", "차도");
//112
  graph.addEdge("정문 혜화관6", "정문 혜화관7", 60, "평지", "차도");
  graph.addEdge("정문 혜화관7", "정문 혜화관6", 60, "평지", "차도");
//113
  graph.addEdge("정문 혜화관7", "정문 혜화관8", 62, "평지", "차도",
      node2X: 2118,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관8", "정문 혜화관7", 62, "평지", "차도");
//114
  graph.addEdge("정문 혜화관8", "사회과학관 3층 입구", 56, "평지", "도보",
      node2X: 2171,
      node2Y: 3070,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 입구", "정문 혜화관8", 56, "평지", "도보");
//115
  graph.addEdge("정문 혜화관8", "정문 혜화관9", 88, "평지", "차도",
      node2X: 2144,
      node2Y: 2968,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관9", "정문 혜화관8", 88, "평지", "차도");
//116
  graph.addEdge("정문 혜화관9", "혜화관 입구", 120, "평지", "도보",
      node2X: 2030,
      node2Y: 2932,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 입구", "정문 혜화관9", 120, "평지", "도보");
//117
  graph.addEdge("정문 혜화관9", "혜화관 사회과학관 갈림길", 215, "평지", "차도",
      node2X: 2212,
      node2Y: 2764,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 사회과학관 갈림길", "정문 혜화관9", 215, "평지", "차도");
//118
  graph.addEdge("혜화관 사회과학관 갈림길", "사회과학관 2층 쪽문 앞 계단 아래", 40, "계단아래", "도보",
      node2X: 2258,
      node2Y: 2785,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 아래", "혜화관 사회과학관 갈림길", 76, "계단위", "도보");
//119 생략
//120
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 아래", "사회과학관 2층 쪽문", 43, "평지", "도보",
      node2X: 2297,
      node2Y: 2802,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문", "사회과학관 2층 쪽문 앞 계단 아래", 43, "평지", "도보");
//121
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 아래", "문화관 사회과학관 계단 위", 40, "평지", "도보",
      node2X: 2291,
      node2Y: 2763,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 위", "사회과학관 2층 쪽문 앞 계단 아래", 40, "평지", "도보");
//122
  graph.addEdge("문화관 사회과학관 계단 위", "문화관 사회과학관 계단 중간1", 28, "계단아래", "도보",
      node2X: 2326,
      node2Y: 2757,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 중간1", "문화관 사회과학관 계단 위", 53, "계단위", "도보");
//123
  graph.addEdge("문화관 사회과학관 계단 중간1", "문화관 사회과학관 계단 중간2", 28, "계단아래", "도보",
      node2X: 2338,
      node2Y: 2788,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 중간2", "문화관 사회과학관 계단 중간1", 53, "계단위", "도보");
//124
  graph.addEdge("문화관 사회과학관 계단 중간2", "문화관 사회과학관 계단 아래", 74, "계단아래", "도보",
      node2X: 2404,
      node2Y: 2724,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 아래", "문화관 사회과학관 계단 중간2", 138, "계단위", "도보");
//125
  graph.addEdge("문화관 사회과학관 계단 아래", "문화관 1층 입구 앞", 72, "평지", "차도",
      node2X: 2382,
      node2Y: 2793,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 1층 입구 앞", "문화관 사회과학관 계단 아래", 72, "평지", "차도");
//204
  graph.addEdge("문화관 1층 입구 앞", "문화관 1층 입구", 8, "평지", "도보",
      node2X: 2389,
      node2Y: 2796,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 1층 입구", "문화관 1층 입구 앞", 8, "평지", "도보");
//205
  graph.addEdge("문화관 1층 입구 앞", "사회과학관 B1 엘베 입구", 218, "평지", "차도",
      node2X: 2315,
      node2Y: 3000,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 B1 엘베 입구", "문화관 1층 입구 앞", 218, "평지", "차도");
  //434
  graph.addEdge("사회과학관 B1 엘베 입구", "사회과학관 B1 엘베 앞", 31, "평지", "차도",
      node2X: 2285,
      node2Y: 2993,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 B1 엘베 앞", "사회과학관 B1 엘베 입구", 31, "평지", "차도");
  //435
  graph.addEdge("사회과학관 B1 엘베 앞", "사회과학관 B1 엘베", 39, "평지", "차도",
      node2X: 2272,
      node2Y: 3030,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 B1 엘베", "사회과학관 B1 엘베 앞", 39, "평지", "차도");
  //126
  graph.addEdge("사회과학관 B1 엘베 입구", "동대입구 문화관3", 41, "평지", "도보",
      node2X: 2298,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 문화관3", "사회과학관 B1 엘베 입구", 41, "평지", "도보");
//127
  graph.addEdge("동대입구 문화관3", "문화관 쪽문 앞", 59, "평지", "차도",
      node2X: 2354,
      node2Y: 3071,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 쪽문 앞", "동대입구 문화관3", 59, "평지", "차도");
//128
  graph.addEdge("문화관 쪽문 앞", "문화관 쪽문", 26, "평지", "도보",
      node2X: 2361,
      node2Y: 3046,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 쪽문", "문화관 쪽문 앞", 26, "평지", "도보");
//129
  graph.addEdge("문화관 쪽문 앞", "문화관 산책로 입구", 67, "평지", "차도",
      node2X: 2417,
      node2Y: 3094,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 산책로 입구", "문화관 쪽문 앞", 67, "평지", "차도");
  //420
  graph.addEdge("문화관 산책로 입구", "경영관 뒷계단 앞", 27, "평지", "도보",
      node2X: 2443,
      node2Y: 3102,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 뒷계단 앞", "문화관 산책로 입구", 27, "평지", "도보");
  //421
  graph.addEdge("경영관 뒷계단 앞", "경영관 뒷계단 아래", 44, "평지", "도보",
      node2X: 2429,
      node2Y: 3144,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 뒷계단 아래", "경영관 뒷계단 앞", 44, "평지", "도보");
  //422
  graph.addEdge("경영관 뒷계단 아래", "경영관 2층 뒷문", 32, "계단위", "도보",
      node2X: 2409,
      node2Y: 3137,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 뒷문", "경영관 뒷계단 아래", 17, "계단아래", "도보");
//130
  graph.addEdge("문화관 사회과학관 계단 아래", "동대입구 문화관2", 69, "평지", "차도",
      node2X: 2425,
      node2Y: 2658,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 문화관2", "문화관 사회과학관 계단 아래", 69, "평지", "차도");
//131
  graph.addEdge("동대입구 문화관2", "동대입구 문화관1", 152, "평지", "차도",
      node2X: 2517,
      node2Y: 2537,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 문화관1", "동대입구 문화관2", 152, "평지", "차도");
//132
  graph.addEdge("동대입구 문화관1", "예술극장 입구", 73, "평지", "도보",
      node2X: 2498,
      node2Y: 2607,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("예술극장 입구", "동대입구 문화관1", 73, "평지", "도보");
//133
  graph.addEdge("동대입구 문화관1", "학술관 입구 앞", 102, "평지", "도보",
      node2X: 2550,
      node2Y: 2633,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관 입구 앞", "동대입구 문화관1", 102, "평지", "도보");
//349
  graph.addEdge("학술관 입구 앞", "문화관 후문 앞", 192, "평지", "도보",
      node2X: 2486,
      node2Y: 2814,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 후문 앞", "학술관 입구 앞", 192, "평지", "도보");
//350
  graph.addEdge("문화관 후문 앞", "문화관 후문", 4, "평지", "도보",
      node2X: 2482,
      node2Y: 2814,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 후문", "문화관 후문 앞", 4, "평지", "도보");
//351
  graph.addEdge("문화관 후문 앞", "학술관 옆문", 64, "평지", "도보",
      node2X: 2549,
      node2Y: 2826,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관 옆문", "문화관 후문 앞", 64, "평지", "도보");
//134
  graph.addEdge("학술관 입구 앞", "학술관 입구", 32, "평지", "도보",
      node2X: 2569,
      node2Y: 2659,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관 입구", "학술관 입구 앞", 32, "평지", "도보");
//135
  graph.addEdge("학술관 입구 앞", "가든쿡 입구", 42, "계단아래", "도보",
      node2X: 2539,
      node2Y: 2684,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("가든쿡 입구", "학술관 입구 앞", 78, "계단위", "도보");
//136 가든쿡을 건물로 하면 실내 노드로 전환
  graph.addEdge("가든쿡 입구", "가든쿡 갈림길", 100, "평지", "도보",
      node2X: 2522,
      node2Y: 2783,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("가든쿡 갈림길", "가든쿡 입구", 100, "평지", "도보");
//137 가든쿡을 건물로 하면 실내 노드로 전환
  graph.addEdge("가든쿡 갈림길", "가든쿡 학술관 입구", 28, "평지", "도보",
      node2X: 2549,
      node2Y: 2790,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("가든쿡 학술관 입구", "가든쿡 갈림길", 28, "평지", "도보");
//138 가든쿡을 건물로 하면 실내 노드로 전환
  graph.addEdge("가든쿡 갈림길", "가든쿡 예술극장 입구", 28, "평지", "도보",
      node2X: 2494,
      node2Y: 2778,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("가든쿡 예술극장 입구", "가든쿡 갈림길", 28, "평지", "도보");
//139
  graph.addEdge("동대입구 문화관1", "동대입구 앞", 85, "평지", "차도",
      node2X: 2567,
      node2Y: 2468,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 앞", "동대입구 문화관1", 85, "평지", "차도");
//140
  graph.addEdge("동대입구 앞", "동대입구", 47, "평지", "도보",
      node2X: 2587,
      node2Y: 2426,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구", "동대입구 앞", 47, "평지", "도보");
//141
  graph.addEdge("동대입구 앞", "동대입구 혜화관1", 46, "평지", "차도",
      node2X: 2527,
      node2Y: 2445,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 혜화관1", "동대입구 앞", 46, "평지", "차도");
//142
  graph.addEdge("동대입구 혜화관1", "동대입구 혜화관2", 468, "오르막", "차도",
      node2X: 2290,
      node2Y: 2648,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 혜화관2", "동대입구 혜화관1", 250, "내리막", "차도");
//143
  graph.addEdge("동대입구 혜화관2", "혜화관 사회과학관 갈림길", 210, "오르막", "차도");
  graph.addEdge("혜화관 사회과학관 갈림길", "동대입구 혜화관2", 112, "내리막", "차도");
//144
  graph.addEdge("혜화관 사회과학관 갈림길", "혜화관 팔정도 계단 아래", 311, "오르막", "차도",
      node2X: 2017,
      node2Y: 2694,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 팔정도 계단 아래", "혜화관 사회과학관 갈림길", 166, "내리막", "차도");
//145
  graph.addEdge("혜화관 팔정도 계단 아래", "혜화관 팔정도 계단 위", 218, "오르막", "도보",
      node2X: 1872,
      node2Y: 2705,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 팔정도 계단 위", "혜화관 팔정도 계단 아래", 116, "내리막", "도보");
//146
  graph.addEdge("혜화관 팔정도 계단 위", "법학관 뒷길1", 59, "평지", "차도",
      node2X: 1870,
      node2Y: 2764,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 뒷길1", "혜화관 팔정도 계단 위", 59, "평지", "차도");
//147
  graph.addEdge("법학관 뒷길1", "법학관 뒷길2", 73, "평지", "차도",
      node2X: 1827,
      node2Y: 2823,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 뒷길2", "법학관 뒷길1", 73, "평지", "차도");
//148
  graph.addEdge("법학관 뒷길2", "법학관 뒷길3", 58, "평지", "차도",
      node2X: 1775,
      node2Y: 2848,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 뒷길3", "법학관 뒷길2", 58, "평지", "차도");
//149
  graph.addEdge("법학관 뒷길2", "혜화관 만해관 중간", 82, "평지", "도보",
      node2X: 1805,
      node2Y: 2902,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 만해관 중간", "법학관 뒷길2", 82, "평지", "도보");
//150
  graph.addEdge("혜화관 만해관 중간", "혜화관 4층 입구", 103, "평지", "도보",
      node2X: 1905,
      node2Y: 2925,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 4층 입구", "혜화관 만해관 중간", 103, "평지", "도보");
//151
  graph.addEdge("혜화관 만해관 중간", "만해관 2층 입구 앞", 93, "평지", "도보",
      node2X: 1715,
      node2Y: 2879,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 2층 입구 앞", "혜화관 만해관 중간", 93, "평지", "도보");
//152
  graph.addEdge("만해관 2층 입구 앞", "만해관 2층 입구", 22, "계단위", "도보",
      node2X: 1701,
      node2Y: 2874,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 2층 입구", "만해관 2층 입구 앞", 12, "계단아래", "도보");
//153
  graph.addEdge("만해관 2층 입구 앞", "만해관 정각원 갈림길", 188, "평지", "도보",
      node2X: 1660,
      node2Y: 3059,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 정각원 갈림길", "만해관 2층 입구 앞", 188, "평지", "도보");
//154
  graph.addEdge("만해관 정각원 갈림길", "정각원 입구 앞", 78, "평지", "도보",
      node2X: 1737,
      node2Y: 3072,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원 입구 앞", "만해관 정각원 갈림길", 78, "평지", "도보");
//155
  graph.addEdge("정각원 입구 앞", "정각원 입구", 31, "계단", "도보",
      node2X: 1742,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원 입구", "정각원 입구 앞", 16, "계단", "도보");
//156
  graph.addEdge("정각원 입구 앞", "정각원 계단 아래", 41, "계단아래", "도보");
  graph.addEdge("정각원 계단 아래", "정각원 입구 앞", 76, "계단위", "도보");
//157
  graph.addEdge("만해관 정각원 갈림길", "만해관 우측 하단", 21, "평지", "도보",
      node2X: 1654,
      node2Y: 3079,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 우측 하단", "만해관 정각원 갈림길", 21, "평지", "도보");
//158
  graph.addEdge("만해관 우측 하단", "만해관 옆입구 앞", 52, "평지", "도보",
      node2X: 1605,
      node2Y: 3063,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 옆입구 앞", "만해관 우측 하단", 52, "평지", "도보");
//159
  graph.addEdge("만해관 옆입구 앞", "만해관 옆입구", 12, "평지", "도보",
      node2X: 1609,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 옆입구", "만해관 옆입구 앞", 12, "평지", "도보");
//160
  graph.addEdge("만해관 옆입구 앞", "만해관 내려가는 길1", 81, "평지", "도보");
  graph.addEdge("만해관 내려가는 길1", "만해관 옆입구 앞", 81, "평지", "도보");
//119
  graph.addEdge("과학관 차도 입구", "만해관 입구", 87, "평지", "도보",
      node2X: 1624,
      node2Y: 2860,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 입구", "과학관 차도 입구", 87, "평지", "도보");
//161
  graph.addEdge("팔정도 좌측 하단", "명진관 중앙 계단 아래", 145, "평지", "차도");
  graph.addEdge("명진관 중앙 계단 아래", "팔정도 좌측 하단", 145, "평지", "차도");
//162
  graph.addEdge("명진관 중앙 계단 아래", "명진관 오른쪽 계단 아래", 180, "평지", "차도");
  graph.addEdge("명진관 오른쪽 계단 아래", "명진관 중앙 계단 아래", 180, "평지", "차도");
//163
  graph.addEdge("명진관 오른쪽 계단 아래", "팔정도 오른쪽", 140, "평지", "차도",
      node2X: 1562,
      node2Y: 2713,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 오른쪽", "명진관 오른쪽 계단 아래", 140, "평지", "차도");
//164
  graph.addEdge("팔정도 오른쪽", "법학관 1층 입구 앞", 29, "평지", "차도",
      node2X: 1571,
      node2Y: 2685,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 1층 입구 앞", "팔정도 오른쪽", 29, "평지", "차도");
//165
  graph.addEdge("법학관 1층 입구 앞", "법학관 1층 입구", 29, "평지", "도보",
      node2X: 1598,
      node2Y: 2696,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 1층 입구", "법학관 1층 입구 앞", 29, "평지", "도보");
//166
  graph.addEdge("법학관 1층 입구 앞", "팔정도 우측 상단1", 97, "평지", "차도",
      node2X: 1588,
      node2Y: 2589,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 우측 상단1", "법학관 1층 입구 앞", 97, "평지", "차도");
//167
  graph.addEdge("팔정도 우측 상단1", "팔정도 우측 상단2", 27, "평지", "차도",
      node2X: 1576,
      node2Y: 2565,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 우측 상단2", "팔정도 우측 상단1", 27, "평지", "차도");
//168
  graph.addEdge("팔정도 우측 상단2", "팔정도 혜화관1", 34, "평지", "차도",
      node2X: 1605,
      node2Y: 2547,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 혜화관1", "팔정도 우측 상단2", 34, "평지", "차도");
//169
  graph.addEdge("팔정도 혜화관1", "팔정도 혜화관2", 105, "내리막", "차도",
      node2X: 1729,
      node2Y: 2589,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 혜화관2", "팔정도 혜화관1", 196, "오르막", "차도");
//170
  graph.addEdge("팔정도 혜화관2", "팔정도 혜화관3", 69, "평지", "차도",
      node2X: 1751,
      node2Y: 2654,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 혜화관3", "팔정도 혜화관2", 69, "평지", "차도");
//171
  graph.addEdge("팔정도 혜화관3", "혜화관 팔정도 계단 위", 131, "평지", "차도");
  graph.addEdge("혜화관 팔정도 계단 위", "팔정도 혜화관3", 131, "평지", "차도");
//172
  graph.addEdge("팔정도 우측 상단2", "다향관 오른쪽 입구 앞", 31, "평지", "차도",
      node2X: 1551,
      node2Y: 2546,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 오른쪽 입구 앞", "팔정도 우측 상단2", 31, "평지", "차도");
//173
  graph.addEdge("다향관 오른쪽 입구 앞", "다향관 오른쪽 입구", 17, "평지", "도보",
      node2X: 1555,
      node2Y: 2529,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 오른쪽 입구", "다향관 오른쪽 입구 앞", 17, "평지", "도보");
//174
  graph.addEdge("다향관 오른쪽 입구 앞", "팔정도 위", 114, "평지", "차도",
      node2X: 1442,
      node2Y: 2512,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 위", "다향관 오른쪽 입구 앞", 114, "평지", "차도");
//175
  graph.addEdge("팔정도 위", "다향관 3층 입구 앞", 108, "평지", "차도",
      node2X: 1339,
      node2Y: 2478,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 3층 입구 앞", "팔정도 위", 108, "평지", "차도");
//202
  graph.addEdge("다향관 3층 입구 앞", "다향관 3층 입구", 35, "평지", "도보",
      node2X: 1353,
      node2Y: 2446,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 3층 입구", "다향관 3층 입구 앞", 35, "평지", "도보");
//176
  graph.addEdge("다향관 3층 입구 앞", "팔정도 좌측 상단", 35, "평지", "차도",
      node2X: 1305,
      node2Y: 2469,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 좌측 상단", "다향관 3층 입구 앞", 35, "평지", "차도");
//177
  graph.addEdge("팔정도 좌측 상단", "본관 오른쪽 입구 앞", 10, "평지", "차도",
      node2X: 1300,
      node2Y: 2478,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 오른쪽 입구 앞", "팔정도 좌측 상단", 10, "평지", "차도");
//178
  graph.addEdge("본관 오른쪽 입구 앞", "본관 오른쪽 입구", 47, "평지", "도보",
      node2X: 1255,
      node2Y: 2463,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 오른쪽 입구", "본관 오른쪽 입구 앞", 47, "평지", "도보");
//179
  graph.addEdge("본관 오른쪽 입구 앞", "팔정도 왼쪽", 142, "평지", "차도",
      node2X: 1257,
      node2Y: 2613,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 왼쪽", "본관 오른쪽 입구 앞", 142, "평지", "차도");
//180
  graph.addEdge("팔정도 왼쪽", "본관 왼쪽 입구 앞", 23, "평지", "차도",
      node2X: 1250,
      node2Y: 2635,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 왼쪽 입구 앞", "팔정도 왼쪽", 23, "평지", "차도");
//181
  graph.addEdge("본관 왼쪽 입구 앞", "본관 왼쪽 입구", 46, "평지", "도보",
      node2X: 1206,
      node2Y: 2621,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 왼쪽 입구", "본관 왼쪽 입구 앞", 46, "평지", "도보");
//182
  graph.addEdge("본관 왼쪽 입구 앞", "팔정도 좌측 하단", 120, "평지", "차도");
  graph.addEdge("팔정도 좌측 하단", "본관 왼쪽 입구 앞", 120, "평지", "차도");
//183
  graph.addEdge("팔정도 좌측 하단", "팔정도1", 127, "평지", "도보",
      node2X: 1327,
      node2Y: 2695,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도1", "팔정도 좌측 하단", 127, "평지", "도보");
//184
  graph.addEdge("팔정도1", "팔정도 중앙", 83, "평지", "도보",
      node2X: 1403,
      node2Y: 2661,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 중앙", "팔정도1", 83, "평지", "도보");
//185
  graph.addEdge("팔정도1", "팔정도2", 46, "평지", "도보",
      node2X: 1342,
      node2Y: 2738,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도2", "팔정도1", 46, "평지", "도보");
//186
  graph.addEdge("팔정도2", "팔정도3", 30, "평지", "도보",
      node2X: 1364,
      node2Y: 2759,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도3", "팔정도2", 30, "평지", "도보");
//187
  graph.addEdge("팔정도3", "명진관 중앙 계단 아래", 35, "평지", "도보");
  graph.addEdge("명진관 중앙 계단 아래", "팔정도3", 35, "평지", "도보");
//188
  graph.addEdge("팔정도3", "팔정도4", 39, "평지", "도보",
      node2X: 1402,
      node2Y: 2752,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도4", "팔정도3", 39, "평지", "도보");
//189
  graph.addEdge("팔정도4", "팔정도5", 49, "평지", "도보",
      node2X: 1437,
      node2Y: 2717,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도5", "팔정도4", 49, "평지", "도보");
//190
  graph.addEdge("팔정도5", "명진관 오른쪽 계단 아래", 155, "평지", "도보");
  graph.addEdge("명진관 오른쪽 계단 아래", "팔정도5", 155, "평지", "도보");
//191
  graph.addEdge("팔정도5", "팔정도 중앙", 66, "평지", "도보");
  graph.addEdge("팔정도 중앙", "팔정도5", 66, "평지", "도보");
//192
  graph.addEdge("팔정도 중앙", "팔정도 오른쪽", 167, "평지", "도보");
  graph.addEdge("팔정도 오른쪽", "팔정도 중앙", 167, "평지", "도보");
//193
  graph.addEdge("팔정도 중앙", "팔정도6", 73, "평지", "도보",
      node2X: 1466,
      node2Y: 2625,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도6", "팔정도 중앙", 73, "평지", "도보");
//194
  graph.addEdge("팔정도6", "팔정도 우측 상단2", 125, "평지", "도보");
  graph.addEdge("팔정도 우측 상단2", "팔정도6", 125, "평지", "도보");
//195
  graph.addEdge("팔정도6", "팔정도7", 48, "평지", "도보",
      node2X: 1455,
      node2Y: 2578,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도7", "팔정도6", 48, "평지", "도보");
//196
  graph.addEdge("팔정도7", "팔정도8", 35, "평지", "도보",
      node2X: 1429,
      node2Y: 2555,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도8", "팔정도7", 35, "평지", "도보");
//197
  graph.addEdge("팔정도8", "팔정도 위", 45, "평지", "도보");
  graph.addEdge("팔정도 위", "팔정도8", 45, "평지", "도보");
//198
  graph.addEdge("팔정도8", "팔정도9", 35, "평지", "도보",
      node2X: 1394,
      node2Y: 2560,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도9", "팔정도8", 35, "평지", "도보");
//199
  graph.addEdge("팔정도9", "팔정도10", 38, "평지", "도보",
      node2X: 1362,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도10", "팔정도9", 38, "평지", "도보");
//200
  graph.addEdge("팔정도10", "팔정도 좌측 상단", 126, "평지", "도보");
  graph.addEdge("팔정도 좌측 상단", "팔정도10", 126, "평지", "도보");
//201
  graph.addEdge("팔정도10", "팔정도 중앙", 90, "평지", "도보");
  graph.addEdge("팔정도 중앙", "팔정도10", 90, "평지", "도보");
//202 다향관에 씀
//203
  graph.addEdge("팔정도 중앙", "팔정도 왼쪽", 154, "평지", "도보");
  graph.addEdge("팔정도 왼쪽", "팔정도 중앙", 154, "평지", "도보");
//204 문화관에 씀
//205 문화관에 씀
//206
  graph.addEdge("팔정도 좌측 상단", "팔정도 본관 계단 위", 48, "평지", "차도",
      node2X: 1320,
      node2Y: 2423,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 본관 계단 위", "팔정도 좌측 상단", 48, "평지", "차도");
//207
  graph.addEdge("팔정도 본관 계단 위", "다향관 2층 입구 앞", 29, "내리막", "차도",
      node2X: 1321,
      node2Y: 2387,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 2층 입구 앞", "팔정도 본관 계단 위", 54, "오르막", "차도");
//208
  graph.addEdge("다향관 2층 입구 앞", "다향관 2층 입구", 53, "평지", "도보",
      node2X: 1371,
      node2Y: 2404,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 2층 입구", "다향관 2층 입구 앞", 53, "평지", "도보");
//209
  graph.addEdge("다향관 2층 입구 앞", "다향관 1층 입구 앞", 26, "내리막", "차도",
      node2X: 1321,
      node2Y: 2354,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 앞", "다향관 2층 입구 앞", 50, "오르막", "차도");
//210
  graph.addEdge("다향관 1층 입구 앞", "다향관 1층 입구 앞2", 30, "내리막", "도보",
      node2X: 1357,
      node2Y: 2364,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 앞2", "다향관 1층 입구 앞", 56, "오르막", "도보");
//211
  graph.addEdge("다향관 1층 입구 앞2", "다향관 1층 입구", 26, "내리막", "도보",
      node2X: 1380,
      node2Y: 2387,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구", "다향관 1층 입구 앞2", 49, "오르막", "도보");
//212
  graph.addEdge("다향관 1층 입구 앞", "팔정도 후문 차도1", 80, "내리막", "차도",
      node2X: 1283,
      node2Y: 2262,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도1", "다향관 1층 입구 앞", 149, "오르막", "차도");
//213
  graph.addEdge("팔정도 후문 차도1", "팔정도 후문 차도2", 24, "내리막", "차도",
      node2X: 1258,
      node2Y: 2245,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도2", "팔정도 후문 차도1", 45, "오르막", "차도");
//214
  graph.addEdge("팔정도 후문 차도2", "헐떡고개 위", 22, "내리막", "차도",
      node2X: 1231,
      node2Y: 2248,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("헐떡고개 위", "팔정도 후문 차도2", 41, "오르막", "차도");
//215
  graph.addEdge("헐떡고개 위", "만해광장 입구", 75, "내리막", "차도",
      node2X: 1138,
      node2Y: 2264,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 입구", "헐떡고개 위", 142, "오르막", "차도");
//216
  graph.addEdge("만해광장 입구", "팔정도 후문 차도3", 64, "내리막", "차도",
      node2X: 1059,
      node2Y: 2278,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도3", "만해광장 입구", 120, "오르막", "차도");
//217
  graph.addEdge("팔정도 후문 차도3", "지하주차장 가는길1", 33, "평지", "차도",
      node2X: 1046,
      node2Y: 2308,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 가는길1", "팔정도 후문 차도3", 33, "평지", "차도");
//218
  graph.addEdge("지하주차장 가는길1", "지하주차장 가는길2", 81, "평지", "차도",
      node2X: 1078,
      node2Y: 2382,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 가는길2", "지하주차장 가는길1", 81, "평지", "차도");
//219
  graph.addEdge("지하주차장 가는길2", "팔정도 본관 계단 아래", 160, "평지", "도보",
      node2X: 1235,
      node2Y: 2349,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 본관 계단 아래", "지하주차장 가는길2", 160, "평지", "도보");
//220
  graph.addEdge("팔정도 본관 계단 아래", "팔정도 본관 계단 중간", 102, "계단위", "도보",
      node2X: 1255,
      node2Y: 2414,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 본관 계단 중간", "팔정도 본관 계단 아래", 54, "계단아래", "도보");
//221
  graph.addEdge("팔정도 본관 계단 중간", "팔정도 본관 계단 위", 98, "계단위", "도보");
  graph.addEdge("팔정도 본관 계단 위", "팔정도 본관 계단 중간", 52, "계단아래", "도보");
//222 본관 1층인지 불확실
  graph.addEdge("지하주차장 가는길2", "본관 1층 입구", 44, "평지", "도보",
      node2X: 1113,
      node2Y: 2409,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 1층 입구", "지하주차장 가는길2", 44, "평지", "도보");
//223
  graph.addEdge("지하주차장 가는길2", "원흥관2 쪽문", 101, "평지", "도보",
      node2X: 979,
      node2Y: 2404,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관2 쪽문", "지하주차장 가는길2", 101, "평지", "도보");
//224
  graph.addEdge("지하주차장 가는길2", "지하주차장 가는길3", 211, "평지", "차도",
      node2X: 1013,
      node2Y: 2583,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 가는길3", "지하주차장 가는길2", 211, "평지", "차도");
//225
  graph.addEdge("지하주차장 가는길3", "본관 쪽문", 23, "평지", "도보",
      node2X: 1035,
      node2Y: 2590,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 쪽문", "지하주차장 가는길3", 23, "평지", "도보");
//226
  graph.addEdge("지하주차장 가는길3", "지하주차장 앞", 34, "평지", "차도");
  graph.addEdge("지하주차장 앞", "지하주차장 가는길3", 34, "평지", "차도");
//227
  graph.addEdge("지하주차장 앞", "지하주차장 입구", 64, "평지", "차도",
      node2X: 939,
      node2Y: 2624,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 입구", "지하주차장 앞", 64, "평지", "차도");
//228
  graph.addEdge("헐떡고개 위", "헐떡고개 아래", 180, "내리막", "도보",
      node2X: 1282,
      node2Y: 2029,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("헐떡고개 아래", "헐떡고개 위", 337, "오르막", "도보");
//229
  graph.addEdge("헐떡고개 아래", "체육관 옆문 앞", 24, "내리막", "도보",
      node2X: 1288,
      node2Y: 1999,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("체육관 옆문 앞", "헐떡고개 아래", 46, "오르막", "도보");
//230
  graph.addEdge("체육관 옆문 앞", "체육관 옆문", 52, "평지", "도보",
      node2X: 1338,
      node2Y: 2012,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("체육관 옆문", "체육관 옆문 앞", 52, "평지", "도보");
//231
  graph.addEdge("체육관 옆문 앞", "듀이카 가는길1", 128, "내리막", "차도",
      node2X: 1322,
      node2Y: 1843,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길1", "체육관 옆문 앞", 239, "오르막", "차도");
//232
  graph.addEdge("듀이카 가는길1", "듀이카 가는길2", 22, "평지", "도보",
      node2X: 1344,
      node2Y: 1841,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길2", "듀이카 가는길1", 22, "평지", "도보");
//233
  graph.addEdge("듀이카 가는길2", "학림관 우측 앞문", 27, "평지", "도보",
      node2X: 1354,
      node2Y: 1816,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 우측 앞문", "듀이카 가는길2", 27, "평지", "도보");
//234
  graph.addEdge("듀이카 가는길2", "듀이카 가는길3", 42, "평지", "도보",
      node2X: 1386,
      node2Y: 1839,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길3", "듀이카 가는길2", 42, "평지", "도보");
//235
  graph.addEdge("듀이카 가는길3", "듀이카 가는길4", 70, "평지", "도보",
      node2X: 1455,
      node2Y: 1851,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길4", "듀이카 가는길3", 70, "평지", "도보");
//236
  graph.addEdge("듀이카 가는길4", "체육관 정문", 9, "평지", "도보",
      node2X: 1453,
      node2Y: 1860,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("체육관 정문", "듀이카 가는길4", 9, "평지", "도보");
//237
  graph.addEdge("듀이카 가는길4", "반야관 입구 앞", 26, "평지", "도보",
      node2X: 1480,
      node2Y: 1859,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 입구 앞", "듀이카 가는길4", 26, "평지", "도보");
//238
  graph.addEdge("반야관 입구 앞", "반야관 입구", 31, "평지", "도보",
      node2X: 1495,
      node2Y: 1832,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 입구", "반야관 입구 앞", 31, "평지", "도보");
//239
  graph.addEdge("반야관 입구 앞", "듀이카 앞 계단 위", 40, "평지", "도보",
      node2X: 1517,
      node2Y: 1873,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 위", "반야관 입구 앞", 40, "평지", "도보");
//240
  graph.addEdge("듀이카 앞 계단 위", "듀이카 앞 계단 중간1", 22, "계단아래", "도보",
      node2X: 1541,
      node2Y: 1886,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 중간1", "듀이카 앞 계단 위", 41, "계단위", "도보");
//241
  graph.addEdge("듀이카 앞 계단 중간1", "듀이카 옆 입구", 11, "평지", "도보",
      node2X: 1550,
      node2Y: 1892,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 옆 입구", "듀이카 앞 계단 중간1", 11, "평지", "도보");
//242
  graph.addEdge("듀이카 앞 계단 중간1", "듀이카 앞 계단 중간2", 15, "계단아래", "도보",
      node2X: 1541,
      node2Y: 1905,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 중간2", "듀이카 앞 계단 중간1", 29, "계단위", "도보");
//243
  graph.addEdge("듀이카 앞 계단 중간2", "듀이카 앞 계단 중간3", 35, "계단아래", "도보",
      node2X: 1582,
      node2Y: 1920,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 중간3", "듀이카 앞 계단 중간2", 65, "계단위", "도보");
//346
  graph.addEdge("듀이카 앞 계단 중간3", "듀이카쪽 학교 입구", 37, "계단아래", "도보",
      node2X: 1625,
      node2Y: 1936,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카쪽 학교 입구", "듀이카 앞 계단 중간3", 69, "계단위", "도보");
//345
  graph.addEdge("듀이카 앞 계단 중간3", "듀이카 쪽문", 6, "평지", "도보",
      node2X: 1583,
      node2Y: 1914,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 쪽문", "듀이카 앞 계단 중간3", 6, "평지", "도보");
//244
  graph.addEdge("듀이카 가는길4", "학림관 뒷길1", 101, "평지", "도보",
      node2X: 1482,
      node2Y: 1754,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길1", "듀이카 가는길4", 101, "평지", "도보");
//245
  graph.addEdge("학림관 뒷길1", "반야관 편의점 가는길1", 51, "계단아래", "도보",
      node2X: 1541,
      node2Y: 1731,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 편의점 가는길1", "학림관 뒷길1", 95, "계단위", "도보");
//246
  graph.addEdge("반야관 편의점 가는길1", "반야관 편의점 가는길2", 59, "계단아래", "도보",
      node2X: 1600,
      node2Y: 1775,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 편의점 가는길2", "반야관 편의점 가는길1", 110, "계단위", "도보");
//247
  graph.addEdge("반야관 편의점 가는길2", "반야관 편의점 입구", 42, "계단아래", "도보",
      node2X: 1626,
      node2Y: 1821,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 편의점 입구", "반야관 편의점 가는길2", 79, "계단위", "도보");
//248
  graph.addEdge("학림관 뒷길1", "학림관 뒷길2", 63, "평지", "도보",
      node2X: 1497,
      node2Y: 1693,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길2", "학림관 뒷길1", 63, "평지", "도보");
//249
  graph.addEdge("학림관 뒷길2", "학림관 뒷길3", 125, "평지", "도보",
      node2X: 1374,
      node2Y: 1714,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길3", "학림관 뒷길2", 125, "평지", "도보");
//250
  graph.addEdge("학림관 뒷길3", "학림관 오른쪽 뒷문", 57, "평지", "도보",
      node2X: 1357,
      node2Y: 1768,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 오른쪽 뒷문", "학림관 뒷길3", 57, "평지", "도보");
//251
  graph.addEdge("학림관 뒷길3", "학림관 뒷길4", 74, "계단아래", "도보",
      node2X: 1282,
      node2Y: 1705,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길4", "학림관 뒷길3", 139, "계단위", "도보");
//252
  graph.addEdge("학림관 뒷길4", "학림관 뒷문", 30, "계단위", "도보",
      node2X: 1276,
      node2Y: 1724,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷문", "학림관 뒷길4", 16, "계단아래", "도보");
//253
  graph.addEdge("학림관 뒷길4", "학림관 뒷길5", 77, "계단위", "도보",
      node2X: 1215,
      node2Y: 1667,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길5", "학림관 뒷길4", 77, "계단아래", "도보");
//254
  graph.addEdge("학림관 뒷길5", "학림관 왼쪽 뒷문", 87, "계단위", "도보",
      node2X: 1197,
      node2Y: 1722,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 왼쪽 뒷문", "학림관 뒷길5", 46, "계단아래", "도보");
//255
  graph.addEdge("학림관 뒷길5", "후문", 123, "내리막", "도보",
      node2X: 1114,
      node2Y: 1576,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문", "학림관 뒷길5", 231, "오르막", "도보");
//256
  graph.addEdge("후문", "후문 학생회관1", 188, "오르막", "도보",
      node2X: 993,
      node2Y: 1608,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문 학생회관1", "후문", 100, "내리막", "도보");
//257
  graph.addEdge("후문 학생회관1", "후문 학생회관2", 67, "평지", "도보",
      node2X: 936,
      node2Y: 1643,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문 학생회관2", "후문 학생회관1", 67, "평지", "도보");
//258
  graph.addEdge("후문 학생회관2", "후문 학생회관3", 98, "평지", "도보",
      node2X: 882,
      node2Y: 1725,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문 학생회관3", "후문 학생회관2", 98, "평지", "도보");
//259
  graph.addEdge("후문 학생회관3", "학생회관 학림관 계단 아래", 66, "평지", "도보",
      node2X: 869,
      node2Y: 1790,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 학림관 계단 아래", "후문 학생회관3", 66, "평지", "도보");
//260
  graph.addEdge("학생회관 학림관 계단 아래", "학생회관 계단 입구", 69, "계단위", "도보",
      node2X: 832,
      node2Y: 1817,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 계단 입구", "학생회관 학림관 계단 아래", 37, "계단아래", "도보");
//261
  graph.addEdge("학생회관 학림관 계단 아래", "학생회관 학림관 계단 중간", 68, "계단위", "도보",
      node2X: 913,
      node2Y: 1780,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 학림관 계단 중간", "학생회관 학림관 계단 아래", 36, "계단아래", "도보");
//262
  graph.addEdge("학생회관 학림관 계단 중간", "학생회관 학림관 계단 위", 57, "계단위", "도보",
      node2X: 951,
      node2Y: 1783,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 학림관 계단 위", "학생회관 학림관 계단 중간", 30, "계단아래", "도보");
//263
  graph.addEdge("학생회관 학림관 계단 아래", "학생회관 옆 계단 위", 50, "계단위", "도보",
      node2X: 861,
      node2Y: 1833,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 옆 계단 위", "학생회관 학림관 계단 아래", 26, "계단아래", "도보");
//264
  graph.addEdge("학생회관 옆 계단 위", "팔정도 후문 차도6", 61, "평지", "도보",
      node2X: 879,
      node2Y: 1891,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도6", "학생회관 옆 계단 위", 61, "평지", "도보");
//265
  graph.addEdge("듀이카 가는길1", "학림관 입구 앞", 82, "평지", "차도",
      node2X: 1244,
      node2Y: 1819,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 입구 앞", "듀이카 가는길1", 82, "평지", "차도");
//266
  graph.addEdge("학림관 입구 앞", "학림관 입구", 34, "평지", "도보",
      node2X: 1255,
      node2Y: 1787,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 입구", "학림관 입구 앞", 34, "평지", "도보");
//267
  graph.addEdge("학림관 입구 앞", "학림관 좌측 앞문 앞", 93, "평지", "차도",
      node2X: 1154,
      node2Y: 1795,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 좌측 앞문 앞", "학림관 입구 앞", 93, "평지", "차도");
  //368
  graph.addEdge("학림관 좌측 앞문 앞", "학림관 좌측 앞문", 39, "평지", "차도",
      node2X: 1166,
      node2Y: 1758,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 좌측 앞문", "학림관 좌측 앞문 앞", 39, "평지", "차도");
  //369
  graph.addEdge("학림관 좌측 앞문 앞", "계산관B 입구 앞", 51, "평지", "차도",
      node2X: 1105,
      node2Y: 1782,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관B 입구 앞", "학림관 좌측 앞문 앞", 51, "평지", "차도");
//268
  graph.addEdge("계산관B 입구 앞", "계산관B 입구 앞2", 34, "평지", "도보",
      node2X: 1097,
      node2Y: 1815,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관B 입구 앞2", "계산관B 입구 앞", 34, "평지", "도보");
//269
  graph.addEdge("계산관B 입구 앞2", "계산관B 입구", 26, "평지", "도보",
      node2X: 1071,
      node2Y: 1810,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관B 입구", "계산관B 입구 앞2", 26, "평지", "도보");
//270
  graph.addEdge("계산관B 입구 앞", "계산관A 계단 위", 71, "평지", "차도",
      node2X: 1037,
      node2Y: 1762,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 계단 위", "계산관B 입구 앞", 71, "평지", "차도");
//271
  graph.addEdge("계산관A 계단 위", "계산관A 계단 아래", 18, "계단아래", "도보",
      node2X: 1044,
      node2Y: 1740,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 계단 아래", "계산관A 계단 위", 35, "계단위", "도보");
//272
  graph.addEdge("계산관A 계단 아래", "계산관A 학림관 갈림길", 32, "평지", "도보",
      node2X: 1053,
      node2Y: 1709,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 학림관 갈림길", "계산관A 계단 아래", 32, "평지", "도보");
//273
  graph.addEdge("계산관A 학림관 갈림길", "학림관 편의점 입구", 31, "계단아래", "도보",
      node2X: 1090,
      node2Y: 1721,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 편의점 입구", "계산관A 학림관 갈림길", 58, "계단위", "도보");
//274
  graph.addEdge("계산관A 학림관 갈림길", "계산관A 입구", 17, "평지", "도보",
      node2X: 1058,
      node2Y: 1693,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 입구", "계산관A 학림관 갈림길", 17, "평지", "도보");
//275
  graph.addEdge("계산관A 계단 위", "팔정도 후문 차도8", 43, "평지", "차도",
      node2X: 995,
      node2Y: 1751,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도8", "계산관A 계단 위", 43, "평지", "차도");
//276
  graph.addEdge("팔정도 후문 차도8", "팔정도 후문 차도7", 28, "평지", "차도",
      node2X: 968,
      node2Y: 1757,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도7", "팔정도 후문 차도8", 28, "평지", "차도");
//277
  graph.addEdge("팔정도 후문 차도7", "학생회관 학림관 계단 위", 31, "평지", "차도");
  graph.addEdge("학생회관 학림관 계단 위", "팔정도 후문 차도7", 31, "평지", "차도");
//278
  graph.addEdge("학생회관 학림관 계단 위", "팔정도 후문 차도6", 130, "평지", "차도");
  graph.addEdge("팔정도 후문 차도6", "학생회관 학림관 계단 위", 130, "평지", "차도");
//279
  graph.addEdge("팔정도 후문 차도6", "학생회관 입구 앞", 41, "평지", "도보",
      node2X: 840,
      node2Y: 1904,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 입구 앞", "팔정도 후문 차도6", 41, "평지", "도보");
//280
  graph.addEdge("학생회관 입구 앞", "학생회관 입구", 38, "평지", "도보",
      node2X: 806,
      node2Y: 1888,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 입구", "학생회관 입구 앞", 38, "평지", "도보");
//281
  graph.addEdge("학생회관 입구 앞", "정P 3층 입구 앞", 38, "평지", "도보",
      node2X: 841,
      node2Y: 1942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 입구 앞", "학생회관 입구 앞", 38, "평지", "도보");
//282
  graph.addEdge("정P 3층 입구 앞", "정P 밖 3층 계단", 29, "평지", "도보",
      node2X: 812,
      node2Y: 1946,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 밖 3층 계단", "정P 3층 입구 앞", 29, "평지", "도보");
//283
  graph.addEdge("정P 3층 입구 앞", "정P 3층 입구", 32, "평지", "도보",
      node2X: 842,
      node2Y: 1974,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 입구", "정P 3층 입구 앞", 32, "평지", "도보");
//284
  graph.addEdge("정P 3층 입구 앞", "팔정도 후문 차도5", 49, "평지", "도보",
      node2X: 888,
      node2Y: 1928,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도5", "정P 3층 입구 앞", 49, "평지", "도보");
//285
  graph.addEdge("팔정도 후문 차도5", "팔정도 후문 차도6", 38, "평지", "차도");
  graph.addEdge("팔정도 후문 차도6", "팔정도 후문 차도5", 38, "평지", "차도");
//286
  graph.addEdge("팔정도 후문 차도5", "만해광장 계단 아래", 153, "오르막", "차도",
      node2X: 913,
      node2Y: 2027,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 계단 아래", "팔정도 후문 차도5", 82, "내리막", "차도");
//287
  graph.addEdge("만해광장 계단 아래", "만해광장 계단 위", 130, "오르막", "도보",
      node2X: 999,
      node2Y: 2038,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 계단 위", "만해광장 계단 아래", 69, "내리막", "도보");
//288
  graph.addEdge("만해광장 계단 위", "만해광장", 103, "평지", "도보",
      node2X: 1101,
      node2Y: 2051,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장", "만해광장 계단 위", 103, "평지", "도보");
//289
  graph.addEdge("만해광장", "만해광장 입구", 216, "평지", "도보");
  graph.addEdge("만해광장 입구", "만해광장", 216, "평지", "도보");
//290
  graph.addEdge("만해광장 계단 아래", "팔정도 후문 차도4", 72, "오르막", "차도",
      node2X: 924,
      node2Y: 2074,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도4", "만해광장 계단 아래", 39, "내리막", "차도");
//291
  graph.addEdge("팔정도 후문 차도4", "팔정도 후문 차도3", 367, "오르막", "차도");
  graph.addEdge("팔정도 후문 차도3", "팔정도 후문 차도4", 196, "내리막", "차도");
//292
  graph.addEdge("팔정도 후문 차도4", "원흥관 앞 계단 아래", 92, "내리막", "차도",
      node2X: 880,
      node2Y: 2180,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 아래", "팔정도 후문 차도4", 172, "오르막", "차도");
//293
  graph.addEdge("원흥관 앞 계단 아래", "원흥관 앞 계단 중간", 114, "계단위", "도보",
      node2X: 953,
      node2Y: 2158,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 중간", "원흥관 앞 계단 아래", 61, "계단아래", "도보");
//294
  graph.addEdge("원흥관 앞 계단 중간", "원흥관 앞 계단 위", 233, "계단위", "도보",
      node2X: 1039,
      node2Y: 2287,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 위", "원흥관 앞 계단 중간", 124, "계단아래", "도보");
//295
  graph.addEdge("원흥관 앞 계단 위", "팔정도 후문 차도3", 22, "평지", "도보");
  graph.addEdge("팔정도 후문 차도3", "원흥관 앞 계단 위", 22, "평지", "도보");
//296
  graph.addEdge("원흥관 앞 계단 위", "지하주차장 가는길1", 22, "평지", "도보");
  graph.addEdge("지하주차장 가는길1", "원흥관 앞 계단 위", 22, "평지", "도보");
//297
  graph.addEdge("원흥관 앞 계단 아래", "원흥관 정문 앞", 91, "평지", "차도",
      node2X: 926,
      node2Y: 2259,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 정문 앞", "원흥관 앞 계단 아래", 91, "평지", "차도");
//298
  graph.addEdge("원흥관 정문 앞", "원흥관 정문", 26, "평지", "도보",
      node2X: 912,
      node2Y: 2281,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 정문", "원흥관 정문 앞", 26, "평지", "도보");
//299
  graph.addEdge("원흥관 정문 앞", "정P 3층 후문 앞", 118, "평지", "차도",
      node2X: 832,
      node2Y: 2188,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 후문 앞", "원흥관 정문 앞", 118, "평지", "차도");
//300
  graph.addEdge("정P 3층 후문 앞", "원흥관 앞 계단 아래", 66, "평지", "차도");
  graph.addEdge("원흥관 앞 계단 아래", "정P 3층 후문 앞", 66, "평지", "차도");
//301
  graph.addEdge("정P 3층 후문 앞", "정P 3층 후문", 14, "평지", "도보",
      node2X: 833,
      node2Y: 2174,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 후문", "정P 3층 후문 앞", 14, "평지", "도보");
//302
  graph.addEdge("정P 3층 후문 앞", "정P 뒷길1", 38, "평지", "도보",
      node2X: 794,
      node2Y: 2188,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길1", "정P 3층 후문 앞", 38, "평지", "도보");
//303
  graph.addEdge("정P 뒷길1", "원흥관1 쪽문", 11, "평지", "도보",
      node2X: 784,
      node2Y: 2193,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관1 쪽문", "정P 뒷길1", 11, "평지", "도보");
//304
  graph.addEdge("정P 뒷길1", "정P 뒷길 계단 위", 76, "평지", "도보",
      node2X: 785,
      node2Y: 2111,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길 계단 위", "정P 뒷길1", 76, "평지", "도보");
//305
  graph.addEdge("정P 뒷길 계단 위", "정P 뒷길 계단 아래", 23, "계단아래", "도보",
      node2X: 780,
      node2Y: 2083,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길 계단 아래", "정P 뒷길 계단 위", 43, "계단위", "도보");
//306
  graph.addEdge("정P 뒷길 계단 아래", "자취촌 학교 입구", 72, "계단아래", "도보",
      node2X: 691,
      node2Y: 2095,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("자취촌 학교 입구", "정P 뒷길 계단 아래", 135, "계단위", "도보");
//307
  graph.addEdge("정P 뒷길 계단 아래", "정P 뒷길2", 72, "평지", "도보",
      node2X: 774,
      node2Y: 2011,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길2", "정P 뒷길 계단 아래", 72, "평지", "도보");
//308
  graph.addEdge("정P 뒷길2", "정P 뒷길3", 30, "계단아래", "도보",
      node2X: 774,
      node2Y: 1974,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길3", "정P 뒷길2", 56, "계단위", "도보");
//309
  graph.addEdge("정P 뒷길3", "정P 뒷길4", 22, "평지", "도보",
      node2X: 793,
      node2Y: 1963,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길4", "정P 뒷길3", 22, "평지", "도보");
//310
  graph.addEdge("정P 뒷길4", "정Q 입구 앞", 21, "평지", "도보",
      node2X: 792,
      node2Y: 1942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정Q 입구 앞", "정P 뒷길4", 21, "평지", "도보");
//311
  graph.addEdge("정Q 입구 앞", "정Q 입구", 16, "평지", "도보",
      node2X: 776,
      node2Y: 1942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정Q 입구", "정Q 입구 앞", 16, "평지", "도보");
//312
  graph.addEdge("정Q 입구 앞", "정P 밖 2층 계단", 20, "평지", "도보",
      node2X: 812,
      node2Y: 1946,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 밖 2층 계단", "정Q 입구 앞", 20, "평지", "도보");
//313
  graph.addEdge("정P 밖 2층 계단", "정P 2층 입구", 32, "평지", "도보",
      node2X: 814,
      node2Y: 1978,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 2층 입구", "정P 밖 2층 계단", 32, "평지", "도보");
//314
  graph.addEdge("원흥관 후문", "원흥관 신공학관1", 20, "평지", "도보",
      node1X: 799,
      node1Y: 2311,
      isInside1: 0,
      building1: "실외",
      showRoute1: true,
      node2X: 786,
      node2Y: 2326,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 신공학관1", "원흥관 후문", 20, "평지", "도보");
//315
  graph.addEdge("원흥관 신공학관1", "원흥관 신공학관2", 246, "계단위", "도보",
      node2X: 908,
      node2Y: 2436,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 신공학관2", "원흥관 신공학관1", 131, "계단아래", "도보");
//316
  graph.addEdge("원흥관 신공학관2", "원흥관2 후문", 51, "평지", "도보",
      node2X: 956,
      node2Y: 2452,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관2 후문", "원흥관 신공학관2", 51, "평지", "도보");
//317
  graph.addEdge("원흥관 신공학관2", "원흥별관 후문", 36, "평지", "도보",
      node2X: 873,
      node2Y: 2442,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 후문", "원흥관 신공학관2", 36, "평지", "도보");
//318
  graph.addEdge("원흥관 신공학관2", "원흥별관 정문 앞", 126, "평지", "도보",
      node2X: 867,
      node2Y: 2555,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 정문 앞", "원흥관 신공학관2", 126, "평지", "도보");
//319
  graph.addEdge("원흥별관 정문 앞", "원흥별관 정문", 45, "평지", "도보",
      node2X: 843,
      node2Y: 2517,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 정문", "원흥별관 정문 앞", 45, "평지", "도보");
//320
  graph.addEdge("원흥별관 정문 앞", "108계단 중간1", 16, "평지", "도보",
      node2X: 863,
      node2Y: 2571,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 중간1", "원흥별관 정문 앞", 16, "평지", "도보");
//321
  graph.addEdge("108계단 중간1", "신공 7층 입구 앞", 37, "평지", "도보",
      node2X: 898,
      node2Y: 2584,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 7층 입구 앞", "108계단 중간1", 37, "평지", "도보");
//322   단면도 적용하면 실내로 빼야함
  graph.addEdge("신공 7층 입구 앞", "신공 7층 입구", 47, "평지", "도보",
      node2X: 881,
      node2Y: 2628,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 7층 입구", "신공 7층 입구 앞", 47, "평지", "도보");
//323
  graph.addEdge("신공 7층 입구 앞", "108계단 중간2", 28, "평지", "도보",
      node2X: 925,
      node2Y: 2592,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 중간2", "신공 7층 입구 앞", 28, "평지", "도보");
//324
  graph.addEdge("108계단 중간2", "지하주차장 앞", 125, "계단위", "도보");
  graph.addEdge("지하주차장 앞", "108계단 중간2", 67, "계단아래", "도보");
//325 계단 층수 확인
  graph.addEdge("신공 9층 입구 앞", "원흥관2 n층 계단", 28, "평지", "도보",
      node2X: 934,
      node2Y: 2595,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관2 n층 계단", "신공 9층 입구 앞", 28, "평지", "도보");
//326
  graph.addEdge("원흥관2 n층 계단", "원흥관2 n층 입구", 10, "평지", "도보",
      node2X: 937,
      node2Y: 2585,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관2 n층 입구", "원흥관2 n층 계단", 10, "평지", "도보");
//327
  graph.addEdge("108계단 중간1", "원흥별관 쪽문 앞", 13, "계단아래", "도보",
      node2X: 825,
      node2Y: 2558,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 쪽문 앞", "108계단 중간1", 24, "계단위", "도보");
//328
  graph.addEdge("원흥별관 쪽문 앞", "원흥별관 쪽문", 16, "평지", "도보",
      node2X: 830,
      node2Y: 2543,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 쪽문", "원흥별관 쪽문 앞", 16, "평지", "도보");
//329
  graph.addEdge("원흥별관 쪽문 앞", "108계단 아래", 55, "계단아래", "도보",
      node2X: 760,
      node2Y: 2536,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 아래", "원흥별관 쪽문 앞", 103, "계단위", "도보");
//330
  graph.addEdge("108계단 아래", "신공 3층 입구 앞", 17, "평지", "도보",
      node2X: 753,
      node2Y: 2552,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 앞", "108계단 아래", 17, "평지", "도보");
//331
  graph.addEdge("신공 3층 입구 앞", "신공 3층 입구", 33, "평지", "도보",
      node2X: 739,
      node2Y: 2582,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 3층 입구", "신공 3층 입구 앞", 33, "평지", "도보");
//332
  graph.addEdge("신공 3층 입구 앞", "신공 오르막", 94, "내리막", "도보",
      node2X: 636,
      node2Y: 2538,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 오르막", "신공 3층 입구 앞", 177, "오르막", "도보");
//333
  graph.addEdge("신공 오르막", "충무로쪽 입구", 51, "내리막", "도보",
      node2X: 574,
      node2Y: 2552,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("충무로쪽 입구", "신공 오르막", 95, "오르막", "도보");

  //----------------------------실내 노드------------------------------
  //정P(입구: 2층 입구, 3층 입구(3층), 3층 후문)
  //후문
  graph.addEdge("정P 3층 후문", "정보문화관p", 0, "평지", "도보",
      node2X: 857,
      node2Y: 2058,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  //입구
  graph.addEdge("정P 3층 입구", "정보문화관p", 0, "평지", "도보");
  //2층 입구
  graph.addEdge("정P 2층 입구", "정보문화관p", 0, "평지", "도보");
  //352
  graph.addEdge("정P 3층 후문", "정P 3층 엘베 갈림길", 18, "평지", "도보",
      node2X: 830,
      node2Y: 2156,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 엘베 갈림길", "정P 3층 후문", 18, "평지", "도보");
  //353
  graph.addEdge("정P 3층 엘베 갈림길", "정P 3층 계단 앞", 9, "평지", "도보",
      node2X: 821,
      node2Y: 2155,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 계단 앞", "정P 3층 엘베 갈림길", 9, "평지", "도보");
  //354
  graph.addEdge("정P 3층 계단 앞", "정P 내 3층 계단", 7, "평지", "도보",
      node2X: 821,
      node2Y: 2162,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 내 3층 계단", "정P 3층 계단 앞", 7, "평지", "도보");
  //355
  graph.addEdge("정P 3층 계단 앞", "정P 3층 엘베 앞", 12, "평지", "도보",
      node2X: 809,
      node2Y: 2156,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 엘베 앞", "정P 3층 계단 앞", 12, "평지", "도보");
  //356
  graph.addEdge("정P 3층 엘베 앞", "정P 3층 엘베", 6, "평지", "도보",
      node2X: 810,
      node2Y: 2162,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 엘베", "정P 3층 엘베 앞", 6, "평지", "도보");
  //357
  graph.addEdge("정P 3층 엘베 갈림길", "정P 3층 정문 갈림길", 150, "평지", "도보",
      node2X: 816,
      node2Y: 2006,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 정문 갈림길", "정P 3층 엘베 갈림길", 150, "평지", "도보");
  //358
  graph.addEdge("정P 3층 정문 갈림길", "정P 3층 입구", 41, "평지", "도보");
  graph.addEdge("정P 3층 입구", "정P 3층 정문 갈림길", 41, "평지", "도보");

  //정P 내 계단 2층 - 3층 이동
  graph.addEdge("정P 내 3층 계단", "정P 내 2층 계단", 30, "계단아래", "도보",
      node2X: 821,
      node2Y: 2162,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 내 2층 계단", "정P 내 3층 계단", 16, "계단위", "도보");
  //정P 엘베 2층 - 3층 이동
  graph.addEdge("정P 3층 엘베", "정P 2층 엘베", 30, "엘베", "도보",
      node2X: 810,
      node2Y: 2162,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 엘베", "정P 3층 엘베", 30, "엘베", "도보");
  //361
  graph.addEdge("정P 2층 엘베", "정P 2층 엘베 앞", 6, "평지", "도보",
      node2X: 809,
      node2Y: 2156,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 엘베 앞", "정P 2층 엘베", 6, "평지", "도보");
  //362
  graph.addEdge("정P 2층 엘베 앞", "정P 내 2층 계단 앞", 12, "평지", "도보",
      node2X: 821,
      node2Y: 2155,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 내 2층 계단 앞", "정P 2층 엘베 앞", 12, "평지", "도보");
  //363
  graph.addEdge("정P 내 2층 계단 앞", "정P 내 2층 계단", 7, "평지", "도보");
  graph.addEdge("정P 내 2층 계단", "정P 내 2층 계단 앞", 7, "평지", "도보");
  //364
  graph.addEdge("정P 내 2층 계단 앞", "정P 2층 엘베 갈림길", 9, "평지", "도보",
      node2X: 830,
      node2Y: 2156,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 엘베 갈림길", "정P 내 2층 계단 앞", 9, "평지", "도보");
  //365
  graph.addEdge("정P 2층 엘베 갈림길", "정P 2층 정문 갈림길", 150, "평지", "도보",
      node2X: 816,
      node2Y: 2006,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 정문 갈림길", "정P 2층 엘베 갈림길", 150, "평지", "도보");
  //366
  graph.addEdge("정P 2층 정문 갈림길", "정P 2층 입구", 28, "평지", "도보");
  graph.addEdge("정P 2층 입구", "정P 2층 정문 갈림길", 28, "평지", "도보");

  //정P 밖 계단 2층 - 3층 이동
  graph.addEdge("정P 밖 2층 계단", "정P 밖 3층 계단", 150, "계단위", "도보");
  graph.addEdge("정P 밖 3층 계단", "정P 밖 2층 계단", 80, "계단아래", "도보");
  //**************************************************************************
  //신공학관(입구: 1층 입구, 1층 옆문, 3층 입구, 7층 입구, 9층 입구)
  //334
  graph.addEdge("충무로쪽 입구", "남산학사 계단 위", 31, "평지", "도보",
      node2X: 593,
      node2Y: 2576,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 계단 위", "충무로쪽 입구", 31, "평지", "도보");
//335
  graph.addEdge("남산학사 계단 위", "남산학사 계단 아래", 16, "계단아래", "도보",
      node2X: 598,
      node2Y: 2595,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 계단 아래", "남산학사 계단 위", 29, "계단위", "도보");
//336
  graph.addEdge("남산학사 계단 아래", "남산학사 식당 앞2", 31, "평지", "도보",
      node2X: 614,
      node2Y: 2622,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 식당 앞2", "남산학사 계단 아래", 31, "평지", "도보");
//337
  graph.addEdge("남산학사 식당 앞2", "남산학사 식당 앞", 45, "평지", "도보",
      node2X: 657,
      node2Y: 2636,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 식당 앞", "남산학사 식당 앞2", 45, "평지", "도보");
//338
  graph.addEdge("남산학사 식당 앞", "남산학사 식당 입구", 56, "평지", "도보",
      node2X: 618,
      node2Y: 2676,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 식당 입구", "남산학사 식당 앞", 56, "평지", "도보");
//339
  graph.addEdge("남산학사 식당 앞", "남산학사 입구 앞", 19, "평지", "도보",
      node2X: 675,
      node2Y: 2641,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 입구 앞", "남산학사 식당 앞", 19, "평지", "도보");
//340
  graph.addEdge("남산학사 입구 앞", "남산학사 카페 입구", 74, "평지", "도보",
      node2X: 655,
      node2Y: 2712,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 카페 입구", "남산학사 입구 앞", 74, "평지", "도보");
//341
  graph.addEdge("남산학사 입구 앞", "남산학사 입구", 18, "평지", "도보",
      node2X: 681,
      node2Y: 2624,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 입구", "남산학사 입구 앞", 18, "평지", "도보");
//342
  graph.addEdge("남산학사 입구 앞", "남산학사 편의점 앞", 20, "평지", "도보",
      node2X: 694,
      node2Y: 2648,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 편의점 앞", "남산학사 입구 앞", 20, "평지", "도보");
//343
  graph.addEdge("남산학사 편의점 앞", "남산학사 편의점 입구", 72, "평지", "도보",
      node2X: 671,
      node2Y: 2716,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 편의점 입구", "남산학사 편의점 앞", 72, "평지", "도보");
//344
  graph.addEdge("남산학사 편의점 앞", "신공학관 1층 입구 갈림길", 17, "평지", "도보",
      node2X: 710,
      node2Y: 2653,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 입구 갈림길", "남산학사 편의점 앞", 17, "평지", "도보");
//347
  graph.addEdge("신공학관 1층 입구 갈림길", "신공학관 1층 옆문", 72, "평지", "도보",
      node2X: 688,
      node2Y: 2722,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 옆문", "신공학관 1층 입구 갈림길", 72, "평지", "도보");
//348
  graph.addEdge("신공학관 1층 입구 갈림길", "신공학관 1층 입구", 91, "평지", "도보",
      node2X: 797,
      node2Y: 2681,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 입구", "신공학관 1층 입구 갈림길", 91, "평지", "도보");
  //370
  graph.addEdge("신공학관 1층 옆문", "신공학관 1층 옆문 앞", 48, "평지", "도보",
      node2X: 673,
      node2Y: 2768,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 옆문 앞", "신공학관 1층 옆문", 48, "평지", "도보");
  //371
  graph.addEdge("신공학관 1층 옆문 앞", "신공학관 1층 뒷계단 앞1", 26, "평지", "도보",
      node2X: 697,
      node2Y: 2777,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒷계단 앞1", "신공학관 1층 옆문 앞", 26, "평지", "도보");
  //372
  graph.addEdge("신공학관 1층 뒷계단 앞1", "신공학관 1층 뒷계단 앞2", 10, "평지", "도보",
      node2X: 707,
      node2Y: 2780,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒷계단 앞2", "신공학관 1층 뒷계단 앞1", 10, "평지", "도보");
  //373
  graph.addEdge("신공학관 1층 뒷계단 앞2", "신공학관 1층 뒷계단 앞3", 16, "평지", "도보",
      node2X: 712,
      node2Y: 2765,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒷계단 앞3", "신공학관 1층 뒷계단 앞2", 16, "평지", "도보");
  //374
  graph.addEdge("신공학관 1층 뒷계단 앞1", "신공학관 1층 뒷엘베 앞", 16, "평지", "도보",
      node2X: 701,
      node2Y: 2762,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒷엘베 앞", "신공학관 1층 뒷계단 앞1", 16, "평지", "도보");
  //375
  graph.addEdge("신공학관 1층 뒷엘베 앞", "신공학관 1층 뒷계단", 6, "평지", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒷계단", "신공학관 1층 뒷엘베 앞", 6, "평지", "도보");
  //신공학관 뒷계단 1층 - 3층 이동
  graph.addEdge("신공학관 1층 뒷계단", "신공학관 3층 뒷계단", 60, "계단위", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 3층 뒷계단", "신공학관 1층 뒷계단", 32, "계단아래", "도보");
  //신공학관 뒷계단 3층 - 7층 이동
  graph.addEdge("신공학관 3층 뒷계단", "신공학관 7층 뒷계단", 120, "계단위", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 7층 뒷계단", "신공학관 3층 뒷계단", 64, "계단아래", "도보");
  //신공학관 뒷계단 7층 - 9층 이동
  graph.addEdge("신공학관 7층 뒷계단", "신공학관 9층 뒷계단", 60, "계단위", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 9층 뒷계단", "신공학관 7층 뒷계단", 32, "계단아래", "도보");
  //376
  graph.addEdge("신공학관 1층 뒷엘베 앞", "신공학관 1층 뒷엘베", 5, "평지", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒷엘베", "신공학관 1층 뒷엘베 앞", 5, "평지", "도보");
  //신공학관 뒷엘베 1층 - 3층 이동
  graph.addEdge("신공학관 1층 뒷엘베", "신공학관 3층 뒷엘베", 60, "엘베", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 3층 뒷엘베", "신공학관 1층 뒷엘베", 60, "엘베", "도보");
  //신공학관 뒷엘베 3층 - 7층 이동
  graph.addEdge("신공학관 3층 뒷엘베", "신공학관 7층 뒷엘베", 120, "엘베", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 7층 뒷엘베", "신공학관 3층 뒷엘베", 120, "엘베", "도보");
  //신공학관 뒷엘베 7층 - 9층 이동
  graph.addEdge("신공학관 7층 뒷엘베", "신공학관 9층 뒷엘베", 120, "엘베", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 9층 뒷엘베", "신공학관 7층 뒷엘베", 120, "엘베", "도보");
  //377
  graph.addEdge("신공학관 1층 뒷엘베 앞", "신공학관 1층 뒷계단 앞3", 12, "평지", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒷계단 앞3", "신공학관 1층 뒷엘베 앞", 12, "평지", "도보");
  //378
  graph.addEdge("신공학관 1층 뒷계단 앞3", "신공학관 1층 뒷계단 앞4", 12, "평지", "도보",
  node2X: 716,
  node2Y: 2754,
  isInside2: 1,
  building2: "신공학관",
  showRoute2: false);
  graph.addEdge("신공학관 1층 뒷계단 앞4", "신공학관 1층 뒷계단 앞3", 12, "평지", "도보");
  //379
  graph.addEdge("신공학관 1층 뒷계단 앞4", "신공학관 1층 뒤편1", 72, "평지", "도보",
      node2X: 783,
      node2Y: 2779,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒤편1", "신공학관 1층 뒷계단 앞4", 72, "평지", "도보");
  //380
  graph.addEdge("신공학관 1층 뒤편1", "신공학관 1층 뒤편2", 35, "평지", "도보",
      node2X: 816,
      node2Y: 2792,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒤편2", "신공학관 1층 뒤편1", 35, "평지", "도보");
  //395
  graph.addEdge("신공학관 1층 뒤편2", "신공학관 1층 뒤편3", 13, "평지", "도보",
      node2X: 827,
      node2Y: 2786,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 뒤편3", "신공학관 1층 뒤편2", 13, "평지", "도보");
  //381
  graph.addEdge("신공학관 1층 뒤편3", "신공학관 1층 화장실 오른쪽", 51, "평지", "도보",
      node2X: 843,
      node2Y: 2738,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 화장실 오른쪽", "신공학관 1층 뒤편3", 51, "평지", "도보");
  //382
  graph.addEdge("신공학관 1층 뒤편1", "신공학관 1층 화장실 왼쪽", 59, "평지", "도보",
      node2X: 804,
      node2Y: 2724,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 화장실 왼쪽", "신공학관 1층 뒤편1", 59, "평지", "도보");
  //383
  graph.addEdge("신공학관 1층 화장실 왼쪽", "신공학관 1층 화장실 오른쪽", 41, "평지", "도보");
  graph.addEdge("신공학관 1층 화장실 오른쪽", "신공학관 1층 화장실 왼쪽", 41, "평지", "도보");
  //384
  graph.addEdge("신공학관 1층 화장실 왼쪽", "신공학관 1층 입구 앞", 39, "평지", "도보",
      node2X: 817,
      node2Y: 2687,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 입구 앞", "신공학관 1층 화장실 왼쪽", 39, "평지", "도보");
  //385
  graph.addEdge("신공학관 1층 입구 앞", "신공학관 1층 입구", 21, "평지", "도보");
  graph.addEdge("신공학관 1층 입구", "신공학관 1층 입구 앞", 21, "평지", "도보");
  //386
  graph.addEdge("신공학관 1층 입구 앞", "신공학관 1층 왼쪽 위", 61, "평지", "도보",
      node2X: 840,
      node2Y: 2630,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 왼쪽 위", "신공학관 1층 입구 앞", 61, "평지", "도보");
  //387
  graph.addEdge("신공학관 1층 왼쪽 위", "신공학관 1층 9층 엘베 앞", 12, "평지", "도보",
      node2X: 851,
      node2Y: 2634,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 9층 엘베 앞", "신공학관 1층 왼쪽 위", 12, "평지", "도보");
  //388
  graph.addEdge("신공학관 1층 9층 엘베 앞", "신공학관 1층 9층 엘베", 12, "평지", "도보",
      node2X: 847,
      node2Y: 2645,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 9층 엘베", "신공학관 1층 9층 엘베 앞", 12, "평지", "도보");
  //신공학관 9층 엘베 1층 - 9층 이동
  graph.addEdge("신공학관 1층 9층 엘베", "신공학관 9층 9층 엘베", 180, "엘베", "도보",
      node2X: 847,
      node2Y: 2645,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 9층 9층 엘베", "신공학관 1층 9층 엘베", 180, "엘베", "도보");
  //389
  graph.addEdge("신공학관 1층 9층 엘베 앞", "신공학관 1층 전층 엘베 앞", 19, "평지", "도보",
      node2X: 865,
      node2Y: 2639,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 전층 엘베 앞", "신공학관 1층 9층 엘베 앞", 19, "평지", "도보");
  //390
  graph.addEdge("신공학관 1층 전층 엘베 앞", "신공학관 1층 전층 엘베", 12, "평지", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 전층 엘베", "신공학관 1층 전층 엘베 앞", 12, "평지", "도보");
  //신공학관 전층 엘베 1층 - 3층
  graph.addEdge("신공학관 1층 전층 엘베", "신공학관 3층 전층 엘베", 60, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 3층 전층 엘베", "신공학관 1층 전층 엘베", 60, "엘베", "도보");
  //신공학관 전층 엘베 3층 - 7층
  graph.addEdge("신공학관 3층 전층 엘베", "신공학관 7층 전층 엘베", 120, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 7층 전층 엘베", "신공학관 3층 전층 엘베", 120, "엘베", "도보");
  //신공학관 전층 엘베 7층 - 9층
  graph.addEdge("신공학관 7층 전층 엘베", "신공학관 9층 전층 엘베", 60, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 9층 전층 엘베", "신공학관 7층 전층 엘베", 60, "엘베", "도보");
  //391
  graph.addEdge("신공학관 1층 전층 엘베 앞", "신공학관 1층 오른쪽 위", 11, "평지", "도보",
      node2X: 875,
      node2Y: 2643,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 오른쪽 위", "신공학관 1층 전층 엘베 앞", 11, "평지", "도보");
  //392
  graph.addEdge("신공학관 1층 오른쪽 위", "신공학관 1층 계단 앞", 34, "평지", "도보",
      node2X: 864,
      node2Y: 2675,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 계단 앞", "신공학관 1층 오른쪽 위", 34, "평지", "도보");
  //393
  graph.addEdge("신공학관 1층 계단 앞", "신공학관 1층 계단", 5, "평지", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 1층 계단", "신공학관 1층 계단 앞", 5, "평지", "도보");
  //신공학관 계단 1층 - 3층 이동
  graph.addEdge("신공학관 1층 계단", "신공학관 3층 계단", 60, "계단위", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 3층 계단", "신공학관 1층 계단", 32, "계단아래", "도보");
  //신공학관 계단 3층 - 7층 이동
  graph.addEdge("신공학관 3층 계단", "신공학관 7층 계단", 120, "계단위", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 7층 계단", "신공학관 3층 계단", 64, "계단아래", "도보");
  //신공학관 계단 7층 - 9층 이동
  graph.addEdge("신공학관 7층 계단", "신공학관 9층 계단", 60, "계단위", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공학관 9층 계단", "신공학관 7층 계단", 32, "계단아래", "도보");
  //394
  graph.addEdge("신공학관 1층 계단 앞", "신공학관 1층 화장실 오른쪽", 66, "평지", "도보");
  graph.addEdge("신공학관 1층 화장실 오른쪽", "신공학관 1층 계단 앞", 66, "평지", "도보");


//1층 입구
  graph.addEdge("신공학관 1층 입구", "신공학관", 100000, "평지", "도보",
      node2X: 714,
      node2Y: 2657,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공학관", "신공학관 1층 입구", 100000, "평지", "도보");
//1층 옆문
  graph.addEdge("신공학관 1층 옆문", "신공학관", 100000, "평지", "도보");
  graph.addEdge("신공학관", "신공학관 1층 옆문", 100000, "평지", "도보");
//9층 입구
  graph.addEdge("신공 9층 입구", "신공학관", 100000, "평지", "도보");
  graph.addEdge("신공학관", "신공 9층 입구", 100000, "평지", "도보");
//7층 입구
  graph.addEdge("신공 7층 입구", "신공학관", 100000, "평지", "도보");
  graph.addEdge("신공학관", "신공 7층 입구", 100000, "평지", "도보");
//3층 입구
  graph.addEdge("신공 3층 입구", "신공학관", 100000, "평지", "도보");
  graph.addEdge("신공학관", "신공 3층 입구", 100000, "평지", "도보");

  //신공학관 각층 출입구만 임시로 찍은 노드들
  //신공학관 9층 계단 - 신공학관 9층 입구
  graph.addEdge("신공학관 9층 계단", "신공 9층 입구", 57, "평지", "도보");
  graph.addEdge("신공 9층 입구", "신공학관 9층 계단", 57, "평지", "도보");
  //신공학관 9층 9층 엘베 - 신공학관 9층 입구
  graph.addEdge("신공학관 9층 9층 엘베", "신공 9층 입구", 54, "평지", "도보");
  graph.addEdge("신공 9층 입구", "신공학관 9층 9층 엘베", 54, "평지", "도보");
  //신공학관 9층 전층 엘베 - 신공학관 9층 입구
  graph.addEdge("신공학관 9층 9층 엘베", "신공 9층 입구", 42, "평지", "도보");
  graph.addEdge("신공 9층 입구", "신공학관 9층 9층 엘베", 42, "평지", "도보");
  //신공학관 9층 전층 엘베 - 신공학관 9층 입구
  graph.addEdge("신공학관 9층 9층 엘베", "신공 9층 입구", 42, "평지", "도보");
  graph.addEdge("신공 9층 입구", "신공학관 9층 9층 엘베", 42, "평지", "도보");
  //**************************************************************************
  //법학관_만해관(입구: 만해관 입구, 만해관 옆입구, 만해관 2층 입구, 법학관 1층 입구)
  //359
  graph.addEdge("법학관 1층 입구", "법학관 1층 입구 안", 52, "평지", "도보",
      node2X: 1646,
      node2Y: 2715,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("법학관 1층 입구 안", "법학관 1층 입구", 52, "평지", "도보");
  //360
  graph.addEdge("법학관 1층 입구 안", "법학관 1층 만해관 앞", 137, "평지", "도보",
      node2X: 1607,
      node2Y: 2846,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("법학관 1층 만해관 앞", "법학관 1층 입구 안", 137, "평지", "도보");
  //367
  graph.addEdge("법학관 1층 만해관 앞", "만해관 입구 안", 20, "평지", "도보",
      node2X: 1626,
      node2Y: 2852,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("만해관 입구 안", "법학관 1층 만해관 앞", 20, "평지", "도보");
  //395
  graph.addEdge("만해관 입구 안", "만해관 입구", 8, "평지", "도보");
  graph.addEdge("만해관 입구", "만해관 입구 안", 8, "평지", "도보");
  //396
  graph.addEdge("만해관 입구 안", "만해관 2층 입구 안", 47, "평지", "도보",
      node2X: 1671,
      node2Y: 2866,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("만해관 2층 입구 안", "만해관 입구 안", 47, "평지", "도보");
  //397
  graph.addEdge("만해관 2층 입구 안", "만해관 2층 입구", 31, "평지", "도보");
  graph.addEdge("만해관 2층 입구", "만해관 2층 입구 안", 31, "평지", "도보");
  //398
  graph.addEdge("만해관 2층 입구 안", "만해관 옆입구", 196, "평지", "도보");
  graph.addEdge("만해관 옆입구", "만해관 2층 입구 안", 196, "평지", "도보");

  //만해관 입구
  graph.addEdge("만해관 입구", "법학관_만해관", 100000, "평지", "도보",
      node2X: 1672,
      node2Y: 2801,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관_만해관", "만해관 입구", 100000, "평지", "도보");
  //만해관 옆입구
  graph.addEdge("만해관 옆입구", "법학관_만해관", 100000, "평지", "도보");
  graph.addEdge("법학관_만해관", "만해관 옆입구", 100000, "평지", "도보");
  //만해관 2층 입구
  graph.addEdge("만해관 2층 입구", "법학관_만해관", 100000, "평지", "도보");
  graph.addEdge("법학관_만해관", "만해관 2층 입구", 100000, "평지", "도보");
  //법학관 1층 입구
  graph.addEdge("법학관 1층 입구", "법학관_만해관", 100000, "평지", "도보");
  graph.addEdge("법학관_만해관", "법학관 1층 입구", 100000, "평지", "도보");
  //**************************************************************************
  //학림관(입구: 편의점 입구, 입구, 우측 앞문, 오른쪽 뒷문, 뒷문, 왼쪽 뒷문, 좌측 앞문)
  //399
  graph.addEdge("학림관 좌측 앞문", "학림관 1층 엘베 앞", 36, "평지", "도보",
      node2X: 1179,
      node2Y: 1724,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 1층 엘베 앞", "학림관 좌측 앞문", 36, "평지", "도보");
  //400
  graph.addEdge("학림관 1층 엘베 앞", "학림관 1층 엘베", 7, "평지", "도보",
      node2X: 1181,
      node2Y: 1717,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 1층 엘베", "학림관 1층 엘베 앞", 7, "평지", "도보");
  //401
  graph.addEdge("학림관 1층 엘베 앞", "학림관 입구 안", 93, "평지", "도보",
      node2X: 1268,
      node2Y: 1751,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 입구 안", "학림관 1층 엘베 앞", 93, "평지", "도보");
  //402
  graph.addEdge("학림관 입구 안", "학림관 뒷문", 28, "평지", "도보");
  graph.addEdge("학림관 뒷문", "학림관 입구 안", 28, "평지", "도보");
  //403
  graph.addEdge("학림관 입구 안", "학림관 입구", 38, "평지", "도보");
  graph.addEdge("학림관 입구", "학림관 입구 안", 38, "평지", "도보");
  //404
  graph.addEdge("학림관 입구 안", "학림관 우측 앞문 앞", 101, "평지", "도보",
      node2X: 1365,
      node2Y: 1780,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 우측 앞문 앞", "학림관 입구 안", 101, "평지", "도보");
  //405
  graph.addEdge("학림관 우측 앞문 앞", "학림관 우측 앞문", 38, "평지", "도보");
  graph.addEdge("학림관 우측 앞문", "학림관 우측 앞문 앞", 38, "평지", "도보");
  //406
  graph.addEdge("학림관 우측 앞문 앞", "학림관 오른쪽 뒷문", 14, "평지", "도보");
  graph.addEdge("학림관 오른쪽 뒷문", "학림관 우측 앞문 앞", 14, "평지", "도보");
  //407
  graph.addEdge("학림관 우측 앞문 앞", "학림관 중앙 계단 앞", 17, "평지", "도보",
      node2X: 1381,
      node2Y: 1786,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 중앙 계단 앞", "학림관 우측 앞문 앞", 17, "평지", "도보");
  //408
  graph.addEdge("학림관 중앙 계단 앞", "학림관 중앙 계단", 7, "평지", "도보",
      node2X: 1378,
      node2Y: 1792,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 중앙 계단", "학림관 중앙 계단 앞", 7, "평지", "도보");
  //409
  graph.addEdge("학림관 중앙 계단 앞", "학림관 우측 계단 앞", 73, "평지", "도보",
      node2X: 1451,
      node2Y: 1807,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 우측 계단 앞", "학림관 중앙 계단 앞", 73, "평지", "도보");
  //410
  graph.addEdge("학림관 우측 계단 앞", "학림관 우측 계단", 6, "평지", "도보",
      node2X: 1449,
      node2Y: 1813,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 우측 계단", "학림관 우측 계단 앞", 6, "평지", "도보");
  //411
  graph.addEdge("학림관 편의점 입구", "학림관 편의점 입구 안", 11, "평지", "도보",
      node2X: 1097,
      node2Y: 1713,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 편의점 입구 안", "학림관 편의점 입구", 11, "평지", "도보");
  //412
  graph.addEdge("학림관 편의점 입구 안", "학림관 B1 왼쪽 끝", 13, "평지", "도보",
      node2X: 1101,
      node2Y: 1701,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 B1 왼쪽 끝", "학림관 편의점 입구 안", 13, "평지", "도보");
  //413
  graph.addEdge("학림관 B1 왼쪽 끝", "학림관 B1 엘베 앞", 81, "평지", "도보",
      node2X: 1179,
      node2Y: 1723,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 B1 엘베 앞", "학림관 B1 왼쪽 끝", 81, "평지", "도보");
  //414
  graph.addEdge("학림관 B1 엘베 앞", "학림관 B1 엘베", 6, "평지", "도보",
      node2X: 1181,
      node2Y: 1717,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 B1 엘베", "학림관 B1 엘베 앞", 6, "평지", "도보");
  //학림관 B1 - 1F 엘베 이동
  graph.addEdge("학림관 B1 엘베", "학림관 1층 엘베", 30, "엘베", "도보");
  graph.addEdge("학림관 1층 엘베", "학림관 B1 엘베", 30, "엘베", "도보");
  //415
  graph.addEdge("학림관 B1 엘베 앞", "학림관 왼쪽 뒷문 안", 14, "계단아래", "도보",
      node2X: 1195,
      node2Y: 1729,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 왼쪽 뒷문 안", "학림관 B1 엘베 앞", 26, "계단위", "도보");
  //416
  graph.addEdge("학림관 왼쪽 뒷문 안", "학림관 왼쪽 뒷문", 7, "평지", "도보");
  graph.addEdge("학림관 왼쪽 뒷문", "학림관 왼쪽 뒷문 안", 7, "평지", "도보");
  //편의점 입구
  graph.addEdge("학림관 편의점 입구", "학림관", 100000, "평지", "도보",
      node2X: 1265,
      node2Y: 1758,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  //입구
  graph.addEdge("학림관 입구", "학림관", 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 입구", 100000, "평지", "도보");
  //우측 앞문
  graph.addEdge("학림관 우측 앞문", "학림관", 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 우측 앞문", 100000, "평지", "도보");
  //오른쪽 뒷문
  graph.addEdge("학림관 오른쪽 뒷문", "학림관", 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 오른쪽 뒷문", 100000, "평지", "도보");
  //뒷문
  graph.addEdge("학림관 뒷문", "학림관", 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 뒷문", 100000, "평지", "도보");
  //좌측 앞문
 graph.addEdge("학림관 좌측 앞문", "학림관", 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 좌측 앞문", 100000, "평지", "도보");
  //**************************************************************************
  //과학관(입구: 좌측 입구, 정문, 우측 입구)
  //417
  graph.addEdge("과학관 좌측 입구", "과학관 정문 안", 139, "평지", "도보",
      node2X: 1295,
      node2Y: 3076,
      isInside2: 1,
      building2: "과학관",
      showRoute2: false);
  graph.addEdge("과학관 정문 안", "과학관 좌측 입구", 139, "평지", "도보");
  //418
  graph.addEdge("과학관 정문 안", "과학관 정문", 33, "평지", "도보");
  graph.addEdge("과학관 정문", "과학관 정문 안", 33, "평지", "도보");
  //419
  graph.addEdge("과학관 정문 안", "과학관 우측 입구", 133, "평지", "도보");
  graph.addEdge("과학관 우측 입구", "과학관 정문 안", 133, "평지", "도보");
  //과학관 좌측 입구
  graph.addEdge("과학관 좌측 입구", "과학관", 100000, "평지", "도보",
      node2X: 1250,
      node2Y: 3070,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관", "과학관 좌측 입구", 100000, "평지", "도보");
  //과학관 정문
  graph.addEdge("과학관 정문", "과학관", 100000, "평지", "도보");
  graph.addEdge("과학관", "과학관 정문", 100000, "평지", "도보");
  //과학관 우측 입구
  graph.addEdge("과학관 우측 입구", "과학관", 100000, "평지", "도보");
  graph.addEdge("과학관", "과학관 우측 입구", 100000, "평지", "도보");
  //**************************************************************************
  //혜화관(입구: 입구, 4층 입구)
  //420
  graph.addEdge("혜화관 4층 입구", "혜화관 4층 입구 안", 62, "평지", "도보",
      node2X: 1963,
      node2Y: 2946,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 입구 안", "혜화관 4층 입구", 62, "평지", "도보");
  //421
  graph.addEdge("혜화관 4층 입구 안", "혜화관 4층 엘베 앞", 11, "평지", "도보",
      node2X: 1960,
      node2Y: 2957,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 엘베 앞", "혜화관 4층 입구 안", 11, "평지", "도보");
  //422
  graph.addEdge("혜화관 4층 엘베 앞", "혜화관 4층 엘베", 8, "평지", "도보",
      node2X: 1952,
      node2Y: 2955,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 엘베", "혜화관 4층 엘베 앞", 8, "평지", "도보");
  //423
  graph.addEdge("혜화관 4층 엘베 앞", "혜화관 4층 계단 옆", 27, "평지", "도보",
      node2X: 1987,
      node2Y: 2953,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 옆", "혜화관 4층 엘베 앞", 27, "평지", "도보");
  //424
  graph.addEdge("혜화관 4층 입구 안", "혜화관 4층 계단 옆", 25, "평지", "도보");
  graph.addEdge("혜화관 4층 계단 옆", "혜화관 4층 입구 안", 25, "평지", "도보");
  //425
  graph.addEdge("혜화관 4층 계단 옆", "혜화관 4층 계단 앞", 12, "평지", "도보",
      node2X: 1990,
      node2Y: 2941,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 앞", "혜화관 4층 계단 옆", 12, "평지", "도보");
  //426
  graph.addEdge("혜화관 4층 계단 앞", "혜화관 4층 계단", 14, "평지", "도보",
      node2X: 1977,
      node2Y: 2936,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단", "혜화관 4층 계단 앞", 14, "평지", "도보");
  //427
  graph.addEdge("혜화관 4층 계단", "혜화관 4층 계단 중간1", 19, "계단아래", "도보",
      node2X: 1954,
      node2Y: 2928,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 중간1", "혜화관 4층 계단", 37, "계단위", "도보");
  //428
  graph.addEdge("혜화관 4층 계단 중간1", "혜화관 4층 계단 중간2", 15, "평지", "도보",
      node2X: 1959,
      node2Y: 2914,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 중간2", "혜화관 4층 계단 중간1", 15, "평지", "도보");
  //429
  graph.addEdge("혜화관 4층 계단 중간2", "혜화관 3층 계단", 19, "계단아래", "도보",
      node2X: 1981,
      node2Y: 2922,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 3층 계단", "혜화관 4층 계단 중간2", 35, "계단위", "도보");
  //혜화관 계단 1층 - 3층 이동
  graph.addEdge("혜화관 3층 계단", "혜화관 1층 계단", 32, "계단아래", "도보",
      node2X: 1981,
      node2Y: 2922,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 계단", "혜화관 3층 계단", 60, "계단위", "도보");
  //430
  graph.addEdge("혜화관 1층 계단", "혜화관 1층 계단 앞", 14, "평지", "도보",
      node2X: 1994,
      node2Y: 2927,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 계단 앞", "혜화관 1층 계단", 14, "평지", "도보");
  //431
  graph.addEdge("혜화관 1층 계단 앞", "혜화관 입구", 36, "평지", "도보");
  graph.addEdge("혜화관 입구", "혜화관 1층 계단 앞", 36, "평지", "도보");
  //432
  graph.addEdge("혜화관 1층 계단 앞", "혜화관 1층 엘베 앞", 39, "평지", "도보",
      node2X: 1983,
      node2Y: 2964,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 엘베 앞", "혜화관 1층 계단 앞", 39, "평지", "도보");
  //433
  graph.addEdge("혜화관 1층 엘베 앞", "혜화관 1층 엘베", 32, "평지", "도보",
      node2X: 1952,
      node2Y: 2955,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 엘베", "혜화관 1층 엘베 앞", 32, "평지", "도보");
  //혜화관 엘베 1층 - 4층 이동
  graph.addEdge("혜화관 4층 엘베", "혜화관 1층 엘베", 90, "엘베", "도보");
  graph.addEdge("혜화관 1층 엘베", "혜화관 4층 엘베", 90, "엘베", "도보");

  //혜화관 입구
  graph.addEdge("혜화관 입구", "혜화관", 100000, "평지", "도보",
      node2X: 1993,
      node2Y: 2884,
      isInside2: 0,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관", "혜화관 입구", 100000, "평지", "도보");
  //혜화관 4층 입구
  graph.addEdge("혜화관 4층 입구", "혜화관", 100000, "평지", "도보");
  graph.addEdge("혜화관", "혜화관 4층 입구", 100000, "평지", "도보");
  //**************************************************************************
  //사회과학관_경영관
  //(사회과학관 입구: 3층 입구, 2층 쪽문, B1 엘베, 2층 옆문)
  //(경영관 입구: 2층 입구, 2층 뒷문, 2층 쪽문)
  //438
  graph.addEdge("경영관 2층 쪽문", "경영관 2층 쪽문 안", 86, "평지", "도보",
      node2X: 2338,
      node2Y: 3274,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문 안", "경영관 2층 쪽문", 86, "평지", "도보");
  //439
  graph.addEdge("경영관 2층 쪽문 안", "경영관 2층 입구 안", 103, "평지", "도보",
      node2X: 2369,
      node2Y: 3176,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 쪽문 안", 103, "평지", "도보");
  //440
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 입구", 42, "평지", "도보");
  graph.addEdge("경영관 2층 입구", "경영관 2층 입구 안", 42, "평지", "도보");
  //441
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 계단", 14, "평지", "도보",
      node2X: 2382,
      node2Y: 3180,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 계단", "경영관 2층 입구 안", 14, "평지", "도보");
  //경영관 계단 2층 - 3층 이동
  graph.addEdge("경영관 2층 계단", "경영관 3층 계단", 30, "계단위", "도보",
      node2X: 2382,
      node2Y: 3180,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 계단", "경영관 2층 계단", 16, "계단아래", "도보");
  //442
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 뒷문 안", 48, "평지", "도보",
      node2X: 2383,
      node2Y: 3130,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 뒷문 안", "경영관 2층 입구 안", 48, "평지", "도보");
  //443
  graph.addEdge("경영관 2층 뒷문 안", "경영관 2층 뒷문", 27, "평지", "도보");
  graph.addEdge("경영관 2층 뒷문", "경영관 2층 뒷문 안", 27, "평지", "도보");
  //444
  graph.addEdge("경영관 2층 뒷문 안", "경영관 구름다리 앞", 46, "평지", "도보",
      node2X: 2340,
      node2Y: 3115,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 구름다리 앞", "경영관 2층 뒷문 안", 46, "평지", "도보");
  //445
  graph.addEdge("경영관 구름다리 앞", "경영관 구름다리 입구", 38, "평지", "도보",
      node2X: 2350,
      node2Y: 3078,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 구름다리 입구", "경영관 구름다리 앞", 38, "평지", "도보");
  //경영관 문화관 구름다리 이동
  graph.addEdge("경영관 구름다리 입구", "문화관 구름다리 입구", 14, "평지", "도보",
      node2X: 2354,
      node2Y: 3065,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 구름다리 입구", "경영관 구름다리 입구", 14, "평지", "도보");
  //446
  graph.addEdge("경영관 구름다리 앞", "사회과학관 2층 옆문 안", 107, "평지", "도보",
      node2X: 2238,
      node2Y: 3082,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 옆문 안", "경영관 구름다리 앞", 107, "평지", "도보");
  //447
  graph.addEdge("사회과학관 2층 옆문 안", "사회과학관 2층 옆문", 39, "평지", "도보");
  graph.addEdge("사회과학관 2층 옆문", "사회과학관 2층 옆문 안", 39, "평지", "도보");
  //448
  graph.addEdge("사회과학관 2층 옆문 안", "사회과학관 2층 계단 앞", 17, "평지", "도보",
      node2X: 2242,
      node2Y: 3065,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 옆문 안", 17, "평지", "도보");
  //449
  graph.addEdge("사회과학관 2층 옆문 안", "사회과학관 2층 쪽문 방향", 43, "평지", "도보",
      node2X: 2222,
      node2Y: 3042,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 옆문 안", 43, "평지", "도보");
  //450
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 계단", 9, "평지", "도보",
      node2X: 2250,
      node2Y: 3069,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 계단", "사회과학관 2층 계단 앞", 9, "평지", "도보");
  //사회과학관 계단 2층 - 3층 이동
  graph.addEdge("사회과학관 2층 계단", "사회과학관 3층 계단", 30, "계단위", "도보",
      node2X: 2250,
      node2Y: 3069,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단", "사회과학관 2층 계단", 16, "계단아래", "도보");
  //451
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 계단 옆", 15, "평지", "도보",
      node2X: 2246,
      node2Y: 3051,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 계단 옆", "사회과학관 2층 계단 앞", 15, "평지", "도보");
  //452
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 쪽문 방향", 30, "평지", "도보");
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 계단 앞", 30, "평지", "도보");
  //453
  graph.addEdge("사회과학관 2층 계단 옆", "사회과학관 2층 쪽문 방향", 26, "평지", "도보");
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 계단 옆", 26, "평지", "도보");
  //454
  graph.addEdge("사회과학관 2층 계단 옆", "사회과학관 2층 엘베 앞", 19, "평지", "도보",
      node2X: 2264,
      node2Y: 3056,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 엘베 앞", "사회과학관 2층 계단 옆", 19, "평지", "도보");
  //455
  graph.addEdge("사회과학관 2층 엘베 앞", "사회과학관 2층 엘베", 27, "평지", "도보",
      node2X: 2272,
      node2Y: 3030,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 엘베", "사회과학관 2층 엘베 앞", 27, "평지", "도보");
  //사회과학관 엘베 B1 - 2층 이동
  graph.addEdge("사회과학관 2층 엘베", "사회과학관 B1 엘베", 60, "엘베", "도보");
  graph.addEdge("사회과학관 B1 엘베", "사회과학관 2층 엘베", 60, "엘베", "도보");
  //사회과학관 엘베 2층 - 3층 이동
  graph.addEdge("사회과학관 2층 엘베", "사회과학관 3층 엘베", 30, "엘베", "도보",
      node2X: 2272,
      node2Y: 3030,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 엘베", "사회과학관 2층 엘베", 30, "엘베", "도보");
  //456
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 쪽문 계단 앞", 242, "평지", "도보",
      node2X: 2298,
      node2Y: 2812,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 계단 앞", "사회과학관 2층 쪽문 방향", 242, "평지", "도보");
  //457
  graph.addEdge("사회과학관 2층 쪽문 계단 앞", "사회과학관 2층 쪽문 계단", 12, "평지", "도보",
      node2X: 2309,
      node2Y: 2808,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 계단", "사회과학관 2층 쪽문 계단 앞", 12, "평지", "도보");
  //458
  graph.addEdge("사회과학관 2층 쪽문 계단", "사회과학관 2층 쪽문", 13, "평지", "도보");
  graph.addEdge("사회과학관 2층 쪽문", "사회과학관 2층 쪽문 계단", 13, "평지", "도보");
  //사회과학관 쪽문 계단 2층 - 3층 이동
  graph.addEdge("사회과학관 2층 쪽문 계단", "사회과학관 3층 쪽문 계단", 30, "계단위", "도보",
      node2X: 2309,
      node2Y: 2808,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 쪽문 계단", "사회과학관 2층 쪽문 계단", 16, "계단아래", "도보");


  //복사ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
  //경영관 쪽문 계단 2층 - 3층 이동
  graph.addEdge("경영관 2층 쪽문 계단", "경영관 3층 쪽문 계단", 30, "계단위", "도보",
      node2X: 2246,
      node2Y: 3300,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 쪽문 계단", "경영관 2층 쪽문 계단", 16, "계단아래", "도보");
  //459
  graph.addEdge("경영관 3층 쪽문 계단", "경영관 3층 쪽문", 11, "평지", "도보",
      node2X: 2338,
      node2Y: 3274,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 쪽문", "경영관 3층 쪽문 계단", 11, "평지", "도보");
  //460
  graph.addEdge("경영관 3층 쪽문", "경영관 3층 쪽문 안", 86, "평지", "도보",
      node2X: 2338,
      node2Y: 3274,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 쪽문 안", "경영관 3층 쪽문", 86, "평지", "도보");
  //461
  graph.addEdge("경영관 3층 쪽문 안", "경영관 3층 계단 앞", 103, "평지", "도보",
      node2X: 2369,
      node2Y: 3176,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 계단 앞", "경영관 3층 쪽문 안", 103, "평지", "도보");
  //462
  graph.addEdge("경영관 3층 계단 앞", "경영관 3층 계단", 14, "평지", "도보");
  graph.addEdge("경영관 3층 계단", "경영관 3층 계단 앞", 14, "평지", "도보");
  //463
  graph.addEdge("경영관 3층 계단 앞", "경영관 3층 계단 옆", 48, "평지", "도보",
      node2X: 2383,
      node2Y: 3130,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 계단 옆", "경영관 3층 계단 앞", 48, "평지", "도보");
  //464
  graph.addEdge("경영관 3층 계단 옆", "사회과학관 3층 계단 오른쪽", 153, "평지", "도보",
      node2X: 2238,
      node2Y: 3082,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단 오른쪽", "경영관 3층 계단 옆", 153, "평지", "도보");
  //465
  graph.addEdge("사회과학관 3층 계단 오른쪽", "사회과학관 3층 입구 안", 34, "평지", "도보",
      node2X: 2204,
      node2Y: 3081,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 입구 안", "사회과학관 3층 계단 오른쪽", 34, "평지", "도보");
  //466
  graph.addEdge("사회과학관 3층 입구 안", "사회과학관 3층 입구", 35, "평지", "도보");
  graph.addEdge("사회과학관 3층 입구", "사회과학관 3층 입구 안", 35, "평지", "도보");
  //467
  graph.addEdge("사회과학관 3층 계단 오른쪽", "사회과학관 3층 계단 앞", 17, "평지", "도보",
      node2X: 2242,
      node2Y: 3065,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 계단 오른쪽", 17, "평지", "도보");
  //468
  graph.addEdge("사회과학관 3층 계단 오른쪽", "사회과학관 3층 쪽문 방향", 43, "평지", "도보",
      node2X: 2222,
      node2Y: 3042,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 계단 오른쪽", 43, "평지", "도보");
  //469
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 계단", 9, "평지", "도보");
  graph.addEdge("사회과학관 3층 계단", "사회과학관 3층 계단 앞", 9, "평지", "도보");
  //470
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 계단 왼쪽", 15, "평지", "도보",
      node2X: 2246,
      node2Y: 3051,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단 왼쪽", "사회과학관 3층 계단 앞", 15, "평지", "도보");
  //471
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 쪽문 방향", 30, "평지", "도보");
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 계단 앞", 30, "평지", "도보");
  //472
  graph.addEdge("사회과학관 3층 계단 왼쪽", "사회과학관 3층 쪽문 방향", 26, "평지", "도보");
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 계단 왼쪽", 26, "평지", "도보");
  //473
  graph.addEdge("사회과학관 3층 계단 왼쪽", "사회과학관 3층 엘베 앞", 19, "평지", "도보",
      node2X: 2264,
      node2Y: 3056,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 엘베 앞", "사회과학관 3층 계단 왼쪽", 19, "평지", "도보");
  //474
  graph.addEdge("사회과학관 3층 엘베 앞", "사회과학관 3층 엘베", 27, "평지", "도보");
  graph.addEdge("사회과학관 3층 엘베", "사회과학관 3층 엘베 앞", 27, "평지", "도보");
  //475
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 쪽문 계단 앞", 242, "평지", "도보",
      node2X: 2298,
      node2Y: 2812,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 쪽문 계단 앞", "사회과학관 3층 쪽문 방향", 242, "평지", "도보");
  //476
  graph.addEdge("사회과학관 3층 쪽문 계단 앞", "사회과학관 3층 쪽문 계단", 12, "평지", "도보");
  graph.addEdge("사회과학관 3층 쪽문 계단", "사회과학관 3층 쪽문 계단 앞", 12, "평지", "도보");

  //사회과학관 3층 입구
  graph.addEdge("사회과학관 3층 입구", "사회과학관_경영관", 100000, "평지", "도보",
      node2X: 2295,
      node2Y: 3098,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관_경영관", "사회과학관 3층 입구", 100000, "평지", "도보");
  //사회과학관 2층 옆문
  graph.addEdge("사회과학관 2층 옆문", "사회과학관_경영관", 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "사회과학관 2층 옆문", 100000, "평지", "도보");
  //사회과학관 2층 쪽문
  graph.addEdge("사회과학관 2층 쪽문", "사회과학관_경영관", 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "사회과학관 2층 쪽문", 100000, "평지", "도보");
  //사회과학관 B1 엘베
  graph.addEdge("사회과학관 B1 엘베", "사회과학관_경영관", 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "사회과학관 B1 엘베", 100000, "평지", "도보");
  //경영관 2층 뒷문
  graph.addEdge("경영관 2층 뒷문", "사회과학관_경영관", 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "경영관 2층 뒷문", 100000, "평지", "도보");
  //경영관 2층 쪽문
  graph.addEdge("경영관 2층 쪽문", "사회과학관_경영관", 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "경영관 2층 쪽문", 100000, "평지", "도보");
  //경영관 2층 입구
  graph.addEdge("경영관 2층 입구", "사회과학관_경영관", 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "경영관 2층 입구", 100000, "평지", "도보");


//--------------------------------------------실내 임시 노드-------------------------------
//      중앙도서관
//후문
  graph.addEdge("중도 후문", "중앙도서관", 100, "평지", "도보",
      node2X: 1012,
      node2Y: 2786,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중앙도서관", "중도 후문", 100, "평지", "도보");
//정문
  graph.addEdge("중도 정문", "중앙도서관", 100, "평지", "도보");
  graph.addEdge("중앙도서관", "중도 정문", 100, "평지", "도보");
//      본관
//왼쪽 입구
  graph.addEdge("본관 왼쪽 입구", "본관", 100, "평지", "도보",
      node2X: 1149,
      node2Y: 2551,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관", "본관 왼쪽 입구", 100, "평지", "도보");
//오른쪽 입구
  graph.addEdge("본관 오른쪽 입구", "본관", 100, "평지", "도보");
  graph.addEdge("본관", "본관 오른쪽 입구", 100, "평지", "도보");
//1층 입구
  graph.addEdge("본관 1층 입구", "본관", 100, "평지", "도보");
  graph.addEdge("본관", "본관 1층 입구", 100, "평지", "도보");
//쪽문
  graph.addEdge("본관 쪽문", "본관", 100, "평지", "도보");
  graph.addEdge("본관", "본관 쪽문", 100, "평지", "도보");
//      원흥관
//원흥관2 후문
  graph.addEdge("원흥관2 후문", "원흥관", 500, "평지", "도보",
      node2X: 953,
      node2Y: 2405,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관", "원흥관2 후문", 500, "평지", "도보");
//원흥관2 n층 입구
  graph.addEdge("원흥관2 n층 입구", "원흥관", 500, "평지", "도보");
  graph.addEdge("원흥관", "원흥관2 n층 입구", 500, "평지", "도보");
//원흥관2 쪽문
  graph.addEdge("원흥관2 쪽문", "원흥관", 500, "평지", "도보");
  graph.addEdge("원흥관", "원흥관2 쪽문", 500, "평지", "도보");
//원흥관 후문
  graph.addEdge("원흥관 후문", "원흥관", 500, "평지", "도보");
  graph.addEdge("원흥관", "원흥관 후문", 500, "평지", "도보");
//원흥관 정문
  graph.addEdge("원흥관 정문", "원흥관", 500, "평지", "도보");
  graph.addEdge("원흥관", "원흥관 정문", 500, "평지", "도보");
//원흥관1 쪽문
  graph.addEdge("원흥관1 쪽문", "원흥관", 500, "평지", "도보");
  graph.addEdge("원흥관", "원흥관1 쪽문", 500, "평지", "도보");

//      정q
//정Q 입구
  graph.addEdge("정Q 입구", "정보문화관q", 100, "평지", "도보",
      node2X: 741,
      node2Y: 1928,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정보문화관q", "정Q 입구", 100, "평지", "도보");
//      학생회관
//계단 입구
  graph.addEdge("학생회관 계단 입구", "학생회관", 100, "평지", "도보",
      node2X: 759,
      node2Y: 1843,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관", "학생회관 계단 입구", 100, "평지", "도보");
//입구
  graph.addEdge("학생회관 입구", "학생회관", 100, "평지", "도보");
  graph.addEdge("학생회관", "학생회관 입구", 100, "평지", "도보");
//      체육관
//정문
  graph.addEdge("체육관 정문", "체육관", 100, "평지", "도보",
      node2X: 1432,
      node2Y: 1958,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("체육관", "체육관 정문", 100, "평지", "도보");
//옆문
  graph.addEdge("체육관 옆문", "체육관", 100, "평지", "도보");
  graph.addEdge("체육관", "체육관 옆문", 100, "평지", "도보");
//      다향관
//다향관 1층 입구
  graph.addEdge("다향관 1층 입구", "다향관", 100, "평지", "도보",
      node2X: 1456,
      node2Y: 2468,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관", "다향관 1층 입구", 100, "평지", "도보");
//다향관 2층 입구
  graph.addEdge("다향관 2층 입구", "다향관", 100, "평지", "도보");
  graph.addEdge("다향관", "다향관 2층 입구", 100, "평지", "도보");
//다향관 3층 입구
  graph.addEdge("다향관 3층 입구", "다향관", 100, "평지", "도보");
  graph.addEdge("다향관", "다향관 3층 입구", 100, "평지", "도보");
//다향관 오른쪽 입구
  graph.addEdge("다향관 오른쪽 입구", "다향관", 100, "평지", "도보");
  graph.addEdge("다향관", "다향관 오른쪽 입구", 100, "평지", "도보");
//      명진관
//명진관 정문
  graph.addEdge("명진관 정문", "명진관", 100, "평지", "도보",
      node2X: 1323,
      node2Y: 2901,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관", "명진관 정문", 100, "평지", "도보");
//명진관 좌측 입구
  graph.addEdge("명진관 좌측 입구", "명진관", 100, "평지", "도보");
  graph.addEdge("명진관", "명진관 좌측 입구", 100, "평지", "도보");
//명진관 왼쪽 후문
  graph.addEdge("명진관 왼쪽 후문", "명진관", 100, "평지", "도보");
  graph.addEdge("명진관", "명진관 왼쪽 후문", 100, "평지", "도보");
//명진관 후문
  graph.addEdge("명진관 후문", "명진관", 100, "평지", "도보");
  graph.addEdge("명진관", "명진관 후문", 100, "평지", "도보");
//명진관 오른쪽 후문
  graph.addEdge("명진관 오른쪽 후문", "명진관", 100, "평지", "도보");
  graph.addEdge("명진관", "명진관 오른쪽 후문", 100, "평지", "도보");
//명진관 우측 입구
  graph.addEdge("명진관 우측 입구", "명진관", 100, "평지", "도보");
  graph.addEdge("명진관", "명진관 우측 입구", 100, "평지", "도보");
//      상록원
//상록원 옆입구
  graph.addEdge("상록원 옆입구", "상록원", 100, "평지", "도보",
      node2X: 1182,
      node2Y: 3225,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원", "상록원 옆입구", 100, "평지", "도보");
//상록원 정문
  graph.addEdge("상록원 정문", "상록원", 100, "평지", "도보");
  graph.addEdge("상록원", "상록원 정문", 100, "평지", "도보");
//상록원 후문
  graph.addEdge("상록원 후문", "상록원", 100, "평지", "도보");
  graph.addEdge("상록원", "상록원 후문", 100, "평지", "도보");
//      정각원
//정각원 입구
  graph.addEdge("정각원 입구", "정각원", 100, "평지", "도보",
      node2X: 1752,
      node2Y: 3007,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원", "정각원 입구", 100, "평지", "도보");
//      대운동장
//대운동장 입구
  graph.addEdge("대운동장 입구", "대운동장", 100, "평지", "도보",
      node2X: 1571,
      node2Y: 3414,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장", "대운동장 입구", 100, "평지", "도보");
//      문화관
//문화관 쪽문
  graph.addEdge("문화관 쪽문", "문화관", 100, "평지", "도보",
      node2X: 2422,
      node2Y: 2841,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관", "문화관 쪽문", 100, "평지", "도보");
//문화관 1층 입구
  graph.addEdge("문화관 1층 입구", "문화관", 100, "평지", "도보");
  graph.addEdge("문화관", "문화관 1층 입구", 100, "평지", "도보");
//문화관 후문
  graph.addEdge("문화관 후문", "문화관", 100, "평지", "도보");
  graph.addEdge("문화관", "문화관 후문", 100, "평지", "도보");
//가든쿡 예술극장 입구
  graph.addEdge("가든쿡 예술극장 입구", "문화관", 100, "평지", "도보");
  graph.addEdge("문화관", "가든쿡 예술극장 입구", 100, "평지", "도보");
//예술극장 입구
  graph.addEdge("예술극장 입구", "문화관", 100, "평지", "도보");
  graph.addEdge("문화관", "예술극장 입구", 100, "평지", "도보");
//      학술관
//학술관 입구
  graph.addEdge("학술관 입구", "학술관", 100, "평지", "도보",
      node2X: 2597,
      node2Y: 2719,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관", "학술관 입구", 100, "평지", "도보");
//가든쿡 학술관 입구
  graph.addEdge("가든쿡 학술관 입구", "학술관", 100, "평지", "도보");
  graph.addEdge("학술관", "가든쿡 학술관 입구", 100, "평지", "도보");
//가든쿡 학술관 옆문
  graph.addEdge("학술관 옆문", "학술관", 100, "평지", "도보");
  graph.addEdge("학술관", "학술관 옆문", 100, "평지", "도보");
}