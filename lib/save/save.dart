import 'package:Dubeogi/save/astar.dart';
/*
String sciencePath = 'assets/images/building/과학관(1102,2973).png';
String dhPath = 'assets/images/building/다향관(1337,2379).png';   //new
String dwPath = 'assets/images/building/대운동장(1308,3206).png';
String mhPath = 'assets/images/building/만해광장(972,1880).png';
String mjPath = 'assets/images/building/명진관(1129,2805).png';
String culturePath = 'assets/images/building/문화관(2297,2582).png';
String bmPath = 'assets/images/building/법학관_만해관(1528,2563).png'; //new
String bPath = 'assets/images/building/본관(1017,2394).png';
String scPath = 'assets/images/building/사회과학관_경영관(2145,2775).png';
String srPath = 'assets/images/building/상록원(1067,3118).png';   //new
String nePath = 'assets/images/building/신공학관(482,2525).png';
String whPath = 'assets/images/building/원흥관(694,2084).png';
String ipPath = 'assets/images/building/정p(769,1920).png';
String iqPath = 'assets/images/building/정q(634,1866).png';
String jgPath = 'assets/images/building/정각원(1673,2941).png';
String gymPath = 'assets/images/building/체육관(1321,1843).png';
String libraryPath = 'assets/images/building/중앙도서관(897,2663).png';
String hlPath = 'assets/images/building/학림관(1078,1636).png';
String stuPath = 'assets/images/building/학생회관(670,1773).png';
String hsPath = 'assets/images/building/학술관(2527,2567).png';
String hhPath = 'assets/images/building/혜화관(1804,2694).png';
*/
String vendingPath = 'assets/images/facility/vending.png';
String showerPath = 'assets/images/facility/showerbooth.png';
String storePath = 'assets/images/facility/store.png';
String atmPath = 'assets/images/facility/atm.png';
String loungePath = 'assets/images/facility/lounge.png';
String printerPath = 'assets/images/facility/printer.png';


Map<String, String> OriginalData = {
  '과학관':'assets/images/building/과학관(1102,2973).png',
  '다향관':'assets/images/building/다향관(1337,2379).png',
  '대운동장':'assets/images/building/대운동장(1308,3206).png',
  '법학관_만해관':'assets/images/building/법학관_만해관(1528,2563).png',
  '만해광장':'assets/images/building/만해광장(972,1880).png',
  '명진관':'assets/images/building/명진관(1129,2805).png',
  '문화관':'assets/images/building/문화관(2297,2582).png',
  '본관':'assets/images/building/본관(1017,2394).png',
  '사회과학관_경영관':'assets/images/building/사회과학관_경영관(2145,2775).png',
  '상록원':'assets/images/building/상록원(1067,3118).png',
  '신공학관':'assets/images/building/신공학관(482,2525).png',
  '원흥관':'assets/images/building/원흥관(694,2084).png',
  '정각원':'assets/images/building/정각원(1673,2941).png',
  '정보문화관p':'assets/images/building/정p(769,1920).png',
  '정보문화관q':'assets/images/building/정q(634,1866).png',
  '중앙도서관':'assets/images/building/중앙도서관(897,2663).png',
  '체육관':'assets/images/building/체육관(1321,1843).png',
  '학림관':'assets/images/building/학림관(1078,1636).png',
  '학생회관':'assets/images/building/학생회관(670,1773).png',
  '학술관':'assets/images/building/학술관(2527,2567).png',
  '혜화관':'assets/images/building/혜화관(1804,2694).png'
};

Map<String, String> LookData = {
  '과학관':'assets/images/building/과학관(1102,2973).png',
  '다향관':'assets/images/building/다향관(1337,2379).png',
  '대운동장':'assets/images/building/대운동장(1308,3206).png',
  '법학관_만해관':'assets/images/building/법학관_만해관(1528,2563).png',
  '만해광장':'assets/images/building/만해광장(972,1880).png',
  '명진관':'assets/images/building/명진관(1129,2805).png',
  '문화관':'assets/images/building/문화관(2297,2582).png',
  '본관':'assets/images/building/본관(1017,2394).png',
  '사회과학관_경영관':'assets/images/building/사회과학관_경영관(2145,2775).png',
  '상록원':'assets/images/building/상록원(1067,3118).png',
  '신공학관':'assets/images/building/신공학관(482,2525).png',
  '원흥관':'assets/images/building/원흥관(694,2084).png',
  '정각원':'assets/images/building/정각원(1673,2941).png',
  '정보문화관p':'assets/images/building/정p(769,1920).png',
  '정보문화관q':'assets/images/building/정q(634,1866).png',
  '중앙도서관':'assets/images/building/중앙도서관(897,2663).png',
  '체육관':'assets/images/building/체육관(1321,1843).png',
  '학림관':'assets/images/building/학림관(1078,1636).png',
  '학생회관':'assets/images/building/학생회관(670,1773).png',
  '학술관':'assets/images/building/학술관(2527,2567).png',
  '혜화관':'assets/images/building/혜화관(1804,2694).png'
};

Map<String, int> FloorData = {
  '과학관': 0,
  '다향관': 0,
  '대운동장': 0,
  '법학관_만해관': 0,
  '만해광장': 0,
  '명진관': 0,
  '문화관': 0,
  '본관': 0,
  '사회과학관_경영관': 0,
  '상록원': 0,
  '신공학관': 0,
  '원흥관': 0,
  '정각원': 0,
  '정보문화관p': 0,
  '정보문화관q': 0,
  '중앙도서관': 0,
  '체육관': 0,
  '학림관': 0,
  '학생회관': 0,
  '학술관': 0,
  '혜화관': 0,
};

List<String> allFileNames = [
  '과학관1.png',
  '문화관B1.png',
  '문화관1.png',
  '문화관3.png',
  '문화관4.png',
  '법학관_만해관_1F.png',
  '명진관1.png',
  '본관1.png',
  '본관2.png',
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
  '학림관1.png',
  '학림관B1.png',
  '학술관B1.png',
  '학술관1.png',
  '학술관4.png',
  '혜화관1.png',
  '혜화관4.png',
  '다향관1.png',
  '다향관2.png',
  '다향관3.png',
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

List<String> names = [];

void initGraph(Graph graph) {
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
  graph.addEdge("신공 9층 입구", "신공 9층 입구 앞", 34.4819, 34.4819, "평지", "도보",
      node1X: 900,
      node1Y: 2635,
      isInside1: 0,
      building1: "실외",
      showRoute1: true,
      node2X: 933,
      node2Y: 2645,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 9층 입구 앞", "신공 9층 입구", 34.4819, 34.4819,"평지", "도보");
//61
  graph.addEdge("신공 9층 입구 앞", "신공 중도 갈림길", 51.5461, 51.5461, "평지", "도보",
      node2X: 982,
      node2Y: 2661,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 중도 갈림길", "신공 9층 입구 앞", 51.5461, 51.5461, "평지", "도보");
//2
  graph.addEdge("신공 중도 갈림길", "중도 후문", 9, 9, "평지", "도보",
      node2X: 978,
      node2Y: 2673,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 후문", "신공 중도 갈림길", 9, 9, "평지", "도보");
//3
  graph.addEdge("신공 중도 갈림길", "신공 중도 갈림길2", 107, 107, "평지", "도보",
      node2X: 1067,
      node2Y: 2687,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 중도 갈림길2", "신공 중도 갈림길", 107, 107, "평지", "도보");
//4
  graph.addEdge("신공 중도 갈림길2", "중도 옆 계단 아래", 21, 21, "평지", "도보",
      node2X: 1088,
      node2Y: 2694,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆 계단 아래", "신공 중도 갈림길2", 21, 21, "평지", "도보");
//5
  graph.addEdge("중도 옆 계단 아래", "중도 옆 계단 위", 56, 56, "계단위", "도보",
      node2X: 1139,
      node2Y: 2712,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆 계단 위", "중도 옆 계단 아래", 30, 30, "계단아래", "도보");
//6
  graph.addEdge("중도 옆 계단 위", "중도 정문 앞", 44, 44, "평지", "도보",
      node2X: 1126,
      node2Y: 2754,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 정문 앞", "중도 옆 계단 위", 44, 44, "평지", "도보");
//7
  graph.addEdge("중도 정문 앞", "중도 정문", 10, 10, "평지", "도보",
      node2X: 1116,
      node2Y: 2752,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 정문", "중도 정문 앞", 10, 10, "평지", "도보");
//8
  graph.addEdge("신공 중도 갈림길2", "중도 옆옆 계단 앞", 14, 14, "평지", "도보",
      node2X: 1071,
      node2Y: 2674,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆옆 계단 앞", "신공 중도 갈림길2", 14, 14, "평지", "도보");
//9
  graph.addEdge("중도 옆옆 계단 앞", "중도 옆옆 계단 위", 14, 14, "평지", "도보",
      node2X: 1058,
      node2Y: 2670,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆옆 계단 위", "중도 옆옆 계단 앞", 14, 14, "평지", "도보");
//10
  graph.addEdge("중도 옆옆 계단 위", "중도 옆옆 계단 아래", 10, 10, "계단아래", "도보",
      node2X: 1047,
      node2Y: 2665,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆옆 계단 아래", "중도 옆옆 계단 위", 18, 18, "계단위", "도보");
//11
  graph.addEdge("중도 옆옆 계단 아래", "지하주차장 앞", 67, 67, "평지", "도보",
      node2X: 1002,
      node2Y: 2615,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 앞", "중도 옆옆 계단 아래", 67, 67, "평지", "도보");
//12
  graph.addEdge("중도 옆옆 계단 앞", "본관 2층 중도 쪽문", 91.3947, 91.3947, "평지", "도보",
      node2X: 1158,
      node2Y: 2702,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 2층 중도 쪽문", "중도 옆옆 계단 앞", 91.3947, 91.3947, "평지", "도보");
//13
  graph.addEdge("중도 옆 계단 위", "팔정도 좌측 하단", 82, 82, "평지", "도보",
      node2X: 1212,
      node2Y: 2749,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 좌측 하단", "중도 옆 계단 위", 82, 82, "평지", "도보");
//14
  graph.addEdge("중도 옆 계단 위", "팔정도 좌측 하단3", 44, 44, "평지", "도보",
      node2X: 1169,
      node2Y: 2744,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 좌측 하단3", "중도 옆 계단 위", 44, 44, "평지", "도보");
//15
  graph.addEdge("팔정도 좌측 하단3", "팔정도 좌측 하단2", 19, 19, "평지", "차도",
      node2X: 1188,
      node2Y: 2742,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 좌측 하단2", "팔정도 좌측 하단3", 19, 19, "평지", "차도");
//16
  graph.addEdge("팔정도 좌측 하단", "팔정도 좌측 하단2", 25, 25, "평지", "차도");
  graph.addEdge("팔정도 좌측 하단2", "팔정도 좌측 하단", 25, 25, "평지", "차도");
//17
  graph.addEdge("팔정도 좌측 하단3", "상록원 가는 길 명진관 계단 앞", 190, 190, "평지", "차도",
      node2X: 1113,
      node2Y: 2930,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 앞", "팔정도 좌측 하단3", 190, 190, "평지", "차도");
//18
  graph.addEdge("상록원 가는 길 명진관 계단 앞", "상록원 가는 길 명진관 계단 아래", 52, 52, "평지", "도보",
      node2X: 1163,
      node2Y: 2947,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 아래", "상록원 가는 길 명진관 계단 앞", 52, 52, "평지", "도보");
//19
  graph.addEdge("상록원 가는 길 명진관 계단 아래", "상록원 가는 길 명진관 계단 중간", 21, 21, "계단위", "도보",
      node2X: 1162,
      node2Y: 2960,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 중간", "상록원 가는 길 명진관 계단 아래", 11, 11, "계단아래", "도보");
//20
  graph.addEdge("상록원 가는 길 명진관 계단 중간", "상록원 가는 길 명진관 계단 위", 20, 20, "계단위", "도보",
      node2X: 1176,
      node2Y: 2942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 위", "상록원 가는 길 명진관 계단 중간", 11, 11, "계단아래", "도보");
//21
  graph.addEdge("상록원 가는 길 명진관 계단 앞", "상록원 가는 길", 57, 57, "평지", "차도",
      node2X: 1101,
      node2Y: 2981,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길", "상록원 가는 길 명진관 계단 앞", 57, 57, "평지", "차도");
//22
  graph.addEdge("상록원 가는 길", "상록원 가는 길2", 162, 162, "오르막", "차도",
      node2X: 1102,
      node2Y: 3089,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길2", "상록원 가는 길", 86, 86, "내리막", "차도");
//23
  graph.addEdge("상록원 가는 길2", "상록원 가는 길3", 42, 42, "평지", "차도",
      node2X: 1090,
      node2Y: 3129,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길3", "상록원 가는 길2", 42, 42, "평지", "차도");
//24
  graph.addEdge("상록원 가는 길3", "상록원 가는 길4", 36, 36, "평지", "차도",
      node2X: 1079,
      node2Y: 3163,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길4", "상록원 가는 길3", 36, 36, "평지", "차도");
//25
  graph.addEdge("상록원 가는 길4", "상록원 옆입구", 32, 32, "평지", "도보",
      node2X: 1110,
      node2Y: 3172,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 옆입구", "상록원 가는 길4", 32, 32, "평지", "도보");
//26
  graph.addEdge("상록원 가는 길3", "상록원 과학관 갈림길", 29, 29, "평지", "도보",
      node2X: 1117 ,
      node2Y: 3139,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 과학관 갈림길", "상록원 가는 길3", 29, 29, "평지", "도보");
//27
  graph.addEdge("상록원 과학관 갈림길", "상록원 앞", 17, 17, "평지", "도보",
      node2X: 1133 ,
      node2Y: 3144,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 앞", "상록원 과학관 갈림길", 17, 17, "평지", "도보");
//28
  graph.addEdge("상록원 앞", "상록원 정문", 9, 9, "평지", "도보",
      node2X: 1127 ,
      node2Y: 3151,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 정문", "상록원 앞", 9, 9, "평지", "도보");
//29
  graph.addEdge("상록원 앞", "상록원 옆 갈림길", 66, 66, "평지", "도보",
      node2X: 1198,
      node2Y: 3135,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 옆 갈림길", "상록원 앞", 66, 66, "평지", "도보");
//30
  graph.addEdge("상록원 옆 갈림길", "상록원 후문 앞", 77, 77, "평지", "도보",
      node2X: 1263,
      node2Y: 3176,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 후문 앞", "상록원 옆 갈림길", 77, 77, "평지", "도보");
//31
  graph.addEdge("상록원 후문 앞", "대운동장 상록원 계단 위", 41, 41, "평지", "도보",
      node2X: 1287,
      node2Y: 3143,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 상록원 계단 위", "상록원 후문 앞", 41, 41, "평지", "도보");
//32
  graph.addEdge("상록원 후문 앞", "상록원 후문", 19, 19, "평지", "도보",
      node2X: 1252,
      node2Y: 3192,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 후문", "상록원 후문 앞", 19, 19, "평지", "도보");
//33
  graph.addEdge("상록원 옆 갈림길", "상록원 옆 길", 41, 41, "평지", "도보",
      node2X: 1238,
      node2Y: 3124,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 옆 길", "상록원 옆 갈림길", 41, 41, "평지", "도보");
//34
  graph.addEdge("대운동장 상록원 계단 위", "상록원 옆 길", 53, 53, "평지", "도보");
  graph.addEdge("상록원 옆 길", "대운동장 상록원 계단 위", 53, 53, "평지", "도보");
//35
  graph.addEdge("대운동장 상록원 계단 위", "대운동장 상록원 계단 갈림길", 116, 116, "계단아래", "도보",
      node2X: 1423,
      node2Y: 3193,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 상록원 계단 갈림길", "대운동장 상록원 계단 위", 217, 217, "계단위", "도보");
//36
  graph.addEdge("대운동장 상록원 계단 갈림길", "대운동장 상록원 계단 아래", 44, 44, "계단아래", "도보",
      node2X: 1475,
      node2Y: 3212,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 상록원 계단 아래", "대운동장 상록원 계단 갈림길", 83, 83, "계단위", "도보");
//37
  graph.addEdge("대운동장 상록원 계단 갈림길", "과학관 우측 입구 앞", 108, 108, "계단위", "도보",
      node2X: 1444,
      node2Y: 3124,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 우측 입구 앞", "대운동장 상록원 계단 갈림길", 58, 58, "계단아래", "도보");
//38
  graph.addEdge("과학관 우측 입구 앞", "과학관 우측 입구", 24, 24, "평지", "도보",
      node2X: 1421,
      node2Y: 3117,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 우측 입구", "과학관 우측 입구 앞", 24, 24, "평지", "도보");
//39
  graph.addEdge("과학관 우측 입구 앞", "명진관 과학관 우측 하단", 47, 47, "평지", "도보",
      node2X: 1458,
      node2Y: 3079,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 우측 하단", "과학관 우측 입구 앞", 47, 47, "평지", "도보");
//40
  graph.addEdge("상록원 과학관 갈림길", "과학관 좌측 입구 앞", 114, 114, "평지", "도보",
      node2X: 1153,
      node2Y: 3031,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 좌측 입구 앞", "상록원 과학관 갈림길", 114, 114, "평지", "도보");
//41
  graph.addEdge("과학관 좌측 입구 앞", "과학관 좌측 입구", 9, 9, "평지", "도보",
      node2X: 1162,
      node2Y: 3034,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 좌측 입구", "과학관 좌측 입구 앞", 9, 9, "평지", "도보");
//42
  graph.addEdge("과학관 좌측 입구 앞", "명진관 과학관 좌측 하단", 45, 45, "평지", "도보",
      node2X: 1167,
      node2Y: 2988,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 좌측 하단", "과학관 좌측 입구 앞", 45, 45, "평지", "도보");
//43
  graph.addEdge("명진관 과학관 좌측 하단", "상록원 가는 길 명진관 계단 위", 42, 42, "평지", "도보");
  graph.addEdge("상록원 가는 길 명진관 계단 위", "명진관 과학관 좌측 하단", 42, 42, "평지", "도보");
//44
  graph.addEdge("명진관 과학관 좌측 하단", "과학관 정문 앞", 145, 145, "평지", "차도",
      node2X: 1305,
      node2Y: 3031,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 정문 앞", "명진관 과학관 좌측 하단", 145, 145, "평지", "차도");
//45
  graph.addEdge("과학관 정문 앞", "과학관 정문", 13, 13, "평지", "도보",
      node2X: 1304,
      node2Y: 3044,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 정문", "과학관 정문 앞", 13, 13, "평지", "도보");
//46
  graph.addEdge("과학관 정문 앞", "명진관 과학관 우측 하단", 160, 160, "평지", "차도");
  graph.addEdge("명진관 과학관 우측 하단", "과학관 정문 앞", 160, 160, "평지", "차도");
//47
  graph.addEdge("과학관 정문 앞", "명진관 과학관 중앙", 57, 57, "평지", "도보",
      node2X: 1304,
      node2Y: 2974,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙", "과학관 정문 앞", 57, 57, "평지", "도보");
//48
  graph.addEdge("명진관 과학관 중앙", "명진관 과학관 중앙 왼쪽", 115, 115, "평지", "도보",
      node2X: 1195,
      node2Y: 2937,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙 왼쪽", "명진관 과학관 중앙", 115, 115, "평지", "도보");
//49
  graph.addEdge("명진관 과학관 중앙", "명진관 과학관 중앙 오른쪽", 99, 99, "평지", "도보",
      node2X: 1398,
      node2Y: 3005,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙 오른쪽", "명진관 과학관 중앙", 99, 99, "평지", "도보");
//50
  graph.addEdge("명진관 과학관 중앙", "명진관 후문", 38, 38, "평지", "도보",
      node2X: 1303,
      node2Y: 2936,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 후문", "명진관 과학관 중앙", 38, 38, "평지", "도보");
//51
  graph.addEdge("상록원 가는 길 명진관 계단 위", "명진관 왼쪽길", 5, 5, "평지", "도보",
      node2X: 1176,
      node2Y: 2942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽길", "상록원 가는 길 명진관 계단 위", 5, 5, "평지", "도보");
//52
  graph.addEdge("명진관 왼쪽길", "명진관 과학관 중앙 왼쪽 끝", 9, 9, "평지", "도보",
      node2X: 1180,
      node2Y: 2934,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙 왼쪽 끝", "명진관 왼쪽길", 9, 9, "평지", "도보");
//53
  graph.addEdge("명진관 과학관 중앙 왼쪽 끝", "명진관 과학관 중앙 왼쪽", 15, 15, "평지", "도보");
  graph.addEdge("명진관 과학관 중앙 왼쪽", "명진관 과학관 중앙 왼쪽 끝", 15, 15, "평지", "도보");
//54
  graph.addEdge("명진관 과학관 중앙 왼쪽", "명진관 왼쪽 후문 앞", 22, 22, "평지", "도보",
      node2X: 1202,
      node2Y: 2916,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 후문 앞", "명진관 과학관 중앙 왼쪽", 22, 22, "평지", "도보");
//55
  graph.addEdge("명진관 왼쪽 후문 앞", "명진관 왼쪽 후문", 21, 21, "평지", "도보",
      node2X: 1182,
      node2Y: 2910,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 후문", "명진관 왼쪽 후문 앞", 21, 21, "평지", "도보");
//56
  graph.addEdge("명진관 과학관 중앙 오른쪽", "명진관 오른쪽 후문 앞", 22, 22, "평지", "도보",
      node2X: 1405,
      node2Y: 2984,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 후문 앞", "명진관 과학관 중앙 오른쪽", 22, 22, "평지", "도보");
//57
  graph.addEdge("명진관 오른쪽 후문 앞", "명진관 오른쪽 후문", 21, 21, "평지", "도보",
      node2X: 1425,
      node2Y: 2990,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 후문", "명진관 오른쪽 후문 앞", 21, 21, "평지", "도보");
//58
  graph.addEdge("명진관 과학관 중앙 오른쪽", "명진관 오른쪽길", 20, 20, "평지", "도보",
      node2X: 1393,
      node2Y: 3024,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽길", "명진관 과학관 중앙 오른쪽", 20, 20, "평지", "도보");
//59
  graph.addEdge("명진관 오른쪽길", "명진관 오른쪽 아래", 64, 64, "평지", "도보",
      node2X: 1454,
      node2Y: 3044,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 아래", "명진관 오른쪽길", 64, 64, "평지", "도보");
//60, 61 다른곳에
//62
  graph.addEdge("명진관 오른쪽 아래", "명진관 우측 입구 앞", 83, 83, "평지", "도보",
      node2X: 1478,
      node2Y: 2965,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 우측 입구 앞", "명진관 오른쪽 아래", 83, 83, "평지", "도보");
//63
  graph.addEdge("명진관 우측 입구 앞", "명진관 우측 입구", 9, 9, "평지", "도보",
      node2X: 1469,
      node2Y: 2963,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 우측 입구", "명진관 우측 입구 앞", 9, 9, "평지", "도보");
//64
  graph.addEdge("명진관 우측 입구 앞", "명진관 오른쪽 위", 48, 48, "평지", "도보",
      node2X: 1495,
      node2Y: 2920,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 위", "명진관 우측 입구 앞", 48, 48, "평지", "도보");
//65
  graph.addEdge("명진관 오른쪽 위", "명진관 오른쪽 계단 위", 51, 51, "평지", "도보",
      node2X: 1451,
      node2Y: 2894,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 계단 위", "명진관 오른쪽 위", 51, 51, "평지", "도보");
//66
  graph.addEdge("명진관 오른쪽 계단 위", "명진관 정문 앞", 124, 124, "평지", "도보",
      node2X: 1334,
      node2Y: 2853,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 정문 앞", "명진관 오른쪽 계단 위", 124, 124, "평지", "도보");
//67
  graph.addEdge("명진관 정문 앞", "명진관 정문", 22, 22, "평지", "도보",
      node2X: 1327,
      node2Y: 2874,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 정문", "명진관 정문 앞", 22, 22, "평지", "도보");
//68
  graph.addEdge("명진관 정문 앞", "명진관 왼쪽 계단 위", 118, 118, "평지", "도보",
      node2X: 1223,
      node2Y: 2812,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 계단 위", "명진관 정문 앞", 118, 118, "평지", "도보");
//69
  graph.addEdge("팔정도 좌측 하단3", "명진관 왼쪽 계단 위", 130, 130, "계단위", "도보");
  graph.addEdge("명진관 왼쪽 계단 위", "팔정도 좌측 하단3", 69, 69, "계단아래", "도보");
//70
  graph.addEdge("명진관 왼쪽 계단 위", "명진관 좌측 상단", 58, 58, "평지", "도보",
      node2X: 1167,
      node2Y: 2815,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 상단", "명진관 왼쪽 계단 위", 58, 58, "평지", "도보");
//60
  graph.addEdge("명진관 좌측 상단", "명진관 좌측 입구 앞", 61, 61, "평지", "도보",
      node2X: 1147,
      node2Y: 2874,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구 앞", "명진관 좌측 상단", 61, 61, "평지", "도보");
//71
  graph.addEdge("명진관 좌측 입구 앞", "명진관 좌측 입구", 6, 6, "평지", "도보",
      node2X: 1153,
      node2Y: 2876  ,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구", "명진관 좌측 입구 앞", 6, 6, "평지", "도보");
//72
  graph.addEdge("명진관 좌측 입구 앞", "명진관 좌측 하단", 54, 54, "평지", "도보",
      node2X: 1130,
      node2Y: 2925,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구", "명진관 좌측 하단", 54, 54, "평지", "도보");
//73
  graph.addEdge("명진관 좌측 하단", "명진관 왼쪽길", 50, 50, "평지", "도보");
  graph.addEdge("명진관 왼쪽길", "명진관 좌측 하단", 50, 50, "평지", "도보");
//74
  graph.addEdge("명진관 정문 앞", "명진관 중앙 계단 아래", 51, 51, "계단아래", "도보",
      node2X: 1351,
      node2Y: 2792,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 중앙 계단 아래", "명진관 정문 앞", 95, 95, "계단위", "도보");
//75
  graph.addEdge("명진관 오른쪽 계단 위", "명진관 오른쪽 계단 아래", 68, 68, "계단아래", "도보",
      node2X: 1522,
      node2Y: 2847,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 계단 아래", "명진관 오른쪽 계단 위", 128, 128, "계단위", "도보");
//76
  graph.addEdge("명진관 과학관 우측 하단", "과학관 차도 입구 앞", 175, 175, "평지", "차도",
      node2X: 1514,
      node2Y: 2913,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 차도 입구 앞", "명진관 과학관 우측 하단", 175, 175, "평지", "차도");
//77
  graph.addEdge("과학관 차도 입구 앞", "과학관 차도 입구", 36, 36, "평지", "차도",
      node2X: 1544,
      node2Y: 2893,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 차도 입구", "과학관 차도 입구 앞", 36, 36, "평지", "차도");
//78
  graph.addEdge("명진관 오른쪽 계단 아래", "과학관 차도 입구", 51, 51, "평지", "차도");
  graph.addEdge("과학관 차도 입구", "명진관 오른쪽 계단 아래", 51, 51, "평지", "차도");
//79
  graph.addEdge("과학관 차도 입구", "만해관 내려가는 길1", 64, 64, "내리막", "차도",
      node2X: 1528,
      node2Y: 3038,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 내려가는 길1", "과학관 차도 입구", 219, 219, "오르막", "차도");
//80
  graph.addEdge("만해관 내려가는 길1", "만해관 내려가는 길2", 80, 80, "평지", "차도",
      node2X: 1519,
      node2Y: 3117,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 내려가는 길2", "만해관 내려가는 길1", 80, 80, "평지", "차도");
//81
  graph.addEdge("만해관 내려가는 길2", "만해관 내려가는 길3", 91, 91, "평지", "차도",
      node2X: 1556,
      node2Y: 3200,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 내려가는 길3", "만해관 내려가는 길2", 91, 91, "평지", "차도");
//82
  graph.addEdge("대운동장 상록원 계단 아래", "대운동장 입구 앞", 34, 34, "평지", "도보",
      node2X: 1509,
      node2Y: 3208,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 입구 앞", "대운동장 상록원 계단 아래", 34, 34, "평지", "도보");
//83
  graph.addEdge("대운동장 입구 앞", "만해관 내려가는 길3", 48, 48, "평지", "도보");
  graph.addEdge("만해관 내려가는 길3", "대운동장 입구 앞", 48, 48, "평지", "도보");
//90
  graph.addEdge("대운동장 입구 앞", "대운동장 입구", 30, 30, "평지", "도보",
      node2X: 1501,
      node2Y: 3237,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 입구", "대운동장 입구 앞", 30, 30, "평지", "도보");
//84
  graph.addEdge("만해관 내려가는 길3", "정문3", 115, 115, "내리막", "차도",
      node2X: 1694,
      node2Y: 3241,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문3", "만해관 내려가는 길3", 216, 216, "오르막", "차도");
//85
  graph.addEdge("정문3", "정문2", 328, 328, "내리막", "차도",
      node2X: 2087,
      node2Y: 3357,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문2", "정문3", 615, 615, "오르막", "차도");
//86
  graph.addEdge("정문2", "정문", 236, 236, "내리막", "차도",
      node2X: 2380,
      node2Y: 3389,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문", "정문2", 442, 442, "오르막", "차도");
//87
  graph.addEdge("만해관 내려가는 길1", "만해관 옆 계단 아래", 47, 47, "계단아래", "도보",
      node2X: 1557,
      node2Y: 3089,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 옆 계단 아래", "만해관 내려가는 길1", 88, 88, "계단위", "도보");
//88
  graph.addEdge("만해관 옆 계단 아래", "정각원 계단 아래", 169, 169, "평지", "도보",
      node2X: 1723,
      node2Y: 3121,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원 계단 아래", "만해관 옆 계단 아래", 169, 169, "평지", "도보");
//89
  graph.addEdge("정각원 계단 아래", "정문 혜화관3", 95, 95, "평지", "도보",
      node2X: 1815,
      node2Y: 3143,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관3", "정각원 계단 아래", 95, 95, "평지", "도보");
//91
  graph.addEdge("정문 혜화관3", "정문 혜화관2", 67, 67, "평지", "차도",
      node2X: 1750,
      node2Y: 3159,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관2", "정문 혜화관3", 67, 67, "평지", "차도");
//92
  graph.addEdge("정문 혜화관2", "정문 혜화관1", 53, 53, "평지", "차도",
      node2X: 1711,
      node2Y: 3195,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관1", "정문 혜화관2", 53, 53, "평지", "차도");
//93
  graph.addEdge("정문 혜화관1", "정문3", 49, 49, "평지", "차도");
  graph.addEdge("정문3", "정문 혜화관1", 49, 49, "평지", "차도");
//94
  graph.addEdge("정문 혜화관3", "혜화별관 입구 앞", 24, 24, "평지", "차도",
      node2X: 1838,
      node2Y: 3149,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 입구 앞", "정문 혜화관3", 24, 24, "평지", "차도");
//95
  graph.addEdge("혜화별관 입구 앞", "혜화별관 입구", 43, 43, "평지", "도보",
      node2X: 1850,
      node2Y: 3108,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 입구", "혜화별관 입구 앞", 43, 43, "평지", "도보");
//96
  graph.addEdge("혜화별관 입구 앞", "정문 혜화관4", 45, 45, "평지", "차도",
      node2X: 1882,
      node2Y: 3160,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관4", "혜화별관 입구 앞", 45, 45, "평지", "차도");
//97
  graph.addEdge("정문 혜화관4", "혜화별관 쪽문 옆", 84, 84, "평지", "도보",
      node2X: 1909,
      node2Y: 3080,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 쪽문 옆", "정문 혜화관4", 84, 84, "평지", "도보");
//98
  graph.addEdge("혜화별관 쪽문 옆", "혜화별관 쪽문 앞", 16, 16, "평지", "도보",
      node2X: 1894,
      node2Y: 3075,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 쪽문 앞", "혜화별관 쪽문 옆", 16, 16, "평지", "도보");
//99
  graph.addEdge("혜화별관 쪽문 앞", "혜화별관 쪽문", 9, 9, "평지", "도보",
      node2X: 1891,
      node2Y: 3084,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 쪽문", "혜화별관 쪽문 앞", 9, 9, "평지", "도보");
//100
  graph.addEdge("정문 혜화관4", "정문 혜화관5", 171, 171, "평지", "차도",
      node2X: 2047,
      node2Y: 3206,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관5", "정문 혜화관4", 171, 171, "평지", "차도");
//101
  graph.addEdge("정문 혜화관5", "경영관 차도1", 66, 66, "내리막", "차도",
      node2X: 2107,
      node2Y: 3262,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도1", "정문 혜화관5", 123, 123, "오르막", "차도");
//102
  graph.addEdge("경영관 차도1", "경영관 차도2", 83, 83, "내리막", "차도",
      node2X: 2189,
      node2Y: 3275,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도2", "경영관 차도1", 124, 124, "오르막", "차도");
//103
  graph.addEdge("경영관 차도2", "경영관 차도3", 50, 50, "평지", "차도",
      node2X: 2235,
      node2Y: 3255,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도3", "경영관 차도2", 50, 50, "평지", "차도");
//104
  graph.addEdge("경영관 차도3", "경영관 2층 쪽문 앞", 42, 42, "평지", "도보",
      node2X: 2243,
      node2Y: 3296,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문 앞", "경영관 차도3", 42, 42, "평지", "도보");
  //437
  graph.addEdge("경영관 2층 쪽문 앞", "경영관 2층 쪽문", 11, 11, "평지", "도보",
      node2X: 2254,
      node2Y: 3293,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문", "경영관 2층 쪽문 앞", 11, 11, "평지", "도보");
  //436
  graph.addEdge("경영관 2층 쪽문 앞", "경영관 2층 쪽문 계단", 5, 5, "평지", "도보",
      node2X: 2246,
      node2Y: 3300,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문 계단", "경영관 2층 쪽문 앞", 5, 5, "평지", "도보");
//105
  graph.addEdge("경영관 차도3", "경영관 차도4", 100, 100, "평지", "차도",
      node2X: 2281,
      node2Y: 3166,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도4", "경영관 차도3", 100, 100, "평지", "차도");
//107
  graph.addEdge("경영관 차도4", "경영관 2층 입구", 48, 48, "평지", "도보",
      node2X: 2329,
      node2Y: 3163,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 입구", "경영관 차도4", 48, 48, "평지", "도보");
//108
  graph.addEdge("경영관 차도4", "경영관 계단 아래", 66, 66, "평지", "차도",
      node2X: 2218,
      node2Y: 3145,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 계단 아래", "경영관 차도4", 66, 66, "평지", "차도");
  //106
  graph.addEdge("경영관 계단 아래", "사회과학관 2층 옆문", 27, 27, "평지", "도보",
      node2X: 2226,
      node2Y: 3119,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 옆문", "경영관 계단 아래", 27, 27, "평지", "도보");
//109
  graph.addEdge("경영관 계단 아래", "경영관 계단 위", 110, 110, "계단위", "도보",
      node2X: 2148,
      node2Y: 3124,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 계단 위", "경영관 계단 아래", 58, 58, "계단아래", "도보");
//110
  graph.addEdge("경영관 계단 위", "정문 혜화관7", 51, 51, "평지", "도보",
      node2X: 2099,
      node2Y: 3111,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관7", "경영관 계단 위", 51, 51, "평지", "도보");
//111
  graph.addEdge("정문 혜화관5", "정문 혜화관6", 50, 50, "평지", "차도",
      node2X: 2079,
      node2Y: 3168,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관6", "정문 혜화관5", 50, 50, "평지", "차도");
//112
  graph.addEdge("정문 혜화관6", "정문 혜화관7", 60, 60, "평지", "차도");
  graph.addEdge("정문 혜화관7", "정문 혜화관6", 60, 60, "평지", "차도");
//113
  graph.addEdge("정문 혜화관7", "정문 혜화관8", 62, 62, "평지", "차도",
      node2X: 2118,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관8", "정문 혜화관7", 62, 62, "평지", "차도");
//114
  graph.addEdge("정문 혜화관8", "사회과학관 3층 입구", 56, 56, "평지", "도보",
      node2X: 2171,
      node2Y: 3070,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 입구", "정문 혜화관8", 56, 56, "평지", "도보");
//115
  graph.addEdge("정문 혜화관8", "정문 혜화관9", 88, 88, "평지", "차도",
      node2X: 2144,
      node2Y: 2968,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관9", "정문 혜화관8", 88, 88, "평지", "차도");
//116
  graph.addEdge("정문 혜화관9", "혜화관 입구", 120, 120, "평지", "도보",
      node2X: 2030,
      node2Y: 2932,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 입구", "정문 혜화관9", 120, 120, "평지", "도보");
//117
  graph.addEdge("정문 혜화관9", "혜화관 사회과학관 갈림길", 215, 215, "평지", "차도",
      node2X: 2212,
      node2Y: 2764,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 사회과학관 갈림길", "정문 혜화관9", 215, 215, "평지", "차도");
//118
  graph.addEdge("혜화관 사회과학관 갈림길", "사회과학관 2층 쪽문 앞 계단 아래", 40, 40, "계단아래", "도보",
      node2X: 2258,
      node2Y: 2785,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 아래", "혜화관 사회과학관 갈림길", 76, 76, "계단위", "도보");
//119 생략
//120
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 아래", "사회과학관 2층 쪽문", 43, 43, "평지", "도보",
      node2X: 2297,
      node2Y: 2802,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문", "사회과학관 2층 쪽문 앞 계단 아래", 43, 43, "평지", "도보");
//121
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 아래", "문화관 사회과학관 계단 위", 40, 40, "평지", "도보",
      node2X: 2291,
      node2Y: 2763,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 위", "사회과학관 2층 쪽문 앞 계단 아래", 40, 40, "평지", "도보");
//122
  graph.addEdge("문화관 사회과학관 계단 위", "문화관 사회과학관 계단 중간1", 28, 28, "계단아래", "도보",
      node2X: 2326,
      node2Y: 2757,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 중간1", "문화관 사회과학관 계단 위", 53, 53, "계단위", "도보");
//123
  graph.addEdge("문화관 사회과학관 계단 중간1", "문화관 사회과학관 계단 중간2", 28, 28, "계단아래", "도보",
      node2X: 2338,
      node2Y: 2788,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 중간2", "문화관 사회과학관 계단 중간1", 53, 53, "계단위", "도보");
//124
  graph.addEdge("문화관 사회과학관 계단 중간2", "문화관 사회과학관 계단 아래", 74, 74, "계단아래", "도보",
      node2X: 2404,
      node2Y: 2724,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 아래", "문화관 사회과학관 계단 중간2", 138, 138, "계단위", "도보");
//125
  graph.addEdge("문화관 사회과학관 계단 아래", "문화관 1층 입구 앞", 61, 61, "평지", "차도",
      node2X: 2385,
      node2Y: 2782,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 1층 입구 앞", "문화관 사회과학관 계단 아래", 61, 61, "평지", "차도");
//204
  graph.addEdge("문화관 1층 입구 앞", "문화관 1층 입구", 7, 7, "평지", "도보",
      node2X: 2392,
      node2Y: 2784,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 1층 입구", "문화관 1층 입구 앞", 7, 7, "평지", "도보");
//205
  graph.addEdge("문화관 1층 입구 앞", "사회과학관 B1 엘베 입구", 218, 218, "평지", "차도",
      node2X: 2315,
      node2Y: 3000,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 B1 엘베 입구", "문화관 1층 입구 앞", 218, 218, "평지", "차도");
  //434
  graph.addEdge("사회과학관 B1 엘베 입구", "사회과학관 B1 엘베 앞", 31, 31, "평지", "차도",
      node2X: 2285,
      node2Y: 2993,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 B1 엘베 앞", "사회과학관 B1 엘베 입구", 31, 31, "평지", "차도");
  //435
  graph.addEdge("사회과학관 B1 엘베 앞", "사회과학관 B1 엘베", 39, 39, "평지", "차도",
      node2X: 2272,
      node2Y: 3030,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 B1 엘베", "사회과학관 B1 엘베 앞", 39, 39, "평지", "차도");
  //126
  graph.addEdge("사회과학관 B1 엘베 입구", "동대입구 문화관3", 41, 41, "평지", "도보",
      node2X: 2298,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 문화관3", "사회과학관 B1 엘베 입구", 41, 41, "평지", "도보");
//127
  graph.addEdge("동대입구 문화관3", "문화관 쪽문 앞", 59, 59, "평지", "차도",
      node2X: 2354,
      node2Y: 3071,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 쪽문 앞", "동대입구 문화관3", 59, 59, "평지", "차도");
//128
  graph.addEdge("문화관 쪽문 앞", "문화관 쪽문", 26, 26, "평지", "도보",
      node2X: 2361,
      node2Y: 3046,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 쪽문", "문화관 쪽문 앞", 26, 26, "평지", "도보");
//129
  graph.addEdge("문화관 쪽문 앞", "문화관 산책로 입구", 67, 67, "평지", "차도",
      node2X: 2417,
      node2Y: 3094,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 산책로 입구", "문화관 쪽문 앞", 67, 67, "평지", "차도");
  //420
  graph.addEdge("문화관 산책로 입구", "경영관 뒷계단 앞", 27, 27, "평지", "도보",
      node2X: 2443,
      node2Y: 3102,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 뒷계단 앞", "문화관 산책로 입구", 27, 27, "평지", "도보");
  //421
  graph.addEdge("경영관 뒷계단 앞", "경영관 뒷계단 아래", 44, 44, "평지", "도보",
      node2X: 2429,
      node2Y: 3144,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 뒷계단 아래", "경영관 뒷계단 앞", 44, 44, "평지", "도보");
  //422
  graph.addEdge("경영관 뒷계단 아래", "경영관 2층 뒷문", 32, 32, "계단위", "도보",
      node2X: 2409,
      node2Y: 3137,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 뒷문", "경영관 뒷계단 아래", 17, 17, "계단아래", "도보");
//130
  graph.addEdge("문화관 사회과학관 계단 아래", "동대입구 문화관2", 69, 69, "평지", "차도",
      node2X: 2425,
      node2Y: 2658,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 문화관2", "문화관 사회과학관 계단 아래", 69, 69, "평지", "차도");
//131
  graph.addEdge("동대입구 문화관2", "동대입구 문화관1", 152, 152, "평지", "차도",
      node2X: 2517,
      node2Y: 2537,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 문화관1", "동대입구 문화관2", 152, 152, "평지", "차도");
//132
  graph.addEdge("동대입구 문화관1", "예술극장 입구", 73, 73, "평지", "도보",
      node2X: 2498,
      node2Y: 2607,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("예술극장 입구", "동대입구 문화관1", 73, 73, "평지", "도보");
//133
  graph.addEdge("동대입구 문화관1", "학술관 입구 앞", 102, 102, "평지", "도보",
      node2X: 2550,
      node2Y: 2633,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관 입구 앞", "동대입구 문화관1", 102, 102, "평지", "도보");
//349
  graph.addEdge("학술관 입구 앞", "문화관 후문 앞", 192, 192, "평지", "도보",
      node2X: 2486,
      node2Y: 2814,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 후문 앞", "학술관 입구 앞", 192, 192, "평지", "도보");
//350
  graph.addEdge("문화관 후문 앞", "문화관 후문", 4, 4, "평지", "도보",
      node2X: 2482,
      node2Y: 2814,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 후문", "문화관 후문 앞", 4, 4, "평지", "도보");
//351
  graph.addEdge("문화관 후문 앞", "학술관 옆문", 64, 64, "평지", "도보",
      node2X: 2549,
      node2Y: 2826,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관 옆문", "문화관 후문 앞", 64, 64, "평지", "도보");
//134
  graph.addEdge("학술관 입구 앞", "학술관 입구", 32, 32, "평지", "도보",
      node2X: 2569,
      node2Y: 2659,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관 입구", "학술관 입구 앞", 32, 32, "평지", "도보");
//135
  graph.addEdge("학술관 입구 앞", "가든쿡 입구 앞", 52, 52, "평지", "도보",
      node2X: 2539,
      node2Y: 2684,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("가든쿡 입구 앞", "학술관 입구 앞", 52, 52, "평지", "도보");
  //136
  graph.addEdge("가든쿡 입구 앞", "가든쿡 입구", 46, 46, "계단아래", "도보",
      node2X: 2529,
      node2Y: 2741,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("가든쿡 입구", "가든쿡 입구 앞", 87, 87, "계단위", "도보");
//139
  graph.addEdge("동대입구 문화관1", "동대입구 앞", 85, 85, "평지", "차도",
      node2X: 2567,
      node2Y: 2468,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 앞", "동대입구 문화관1", 85, 85, "평지", "차도");
//140
  graph.addEdge("동대입구 앞", "동대입구", 47, 47, "평지", "도보",
      node2X: 2587,
      node2Y: 2426,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구", "동대입구 앞", 47, 47, "평지", "도보");
//141
  graph.addEdge("동대입구 앞", "동대입구 혜화관1", 46, 46, "평지", "차도",
      node2X: 2527,
      node2Y: 2445,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 혜화관1", "동대입구 앞", 46, 46, "평지", "차도");
//142
  graph.addEdge("동대입구 혜화관1", "동대입구 혜화관2", 468, 468, "오르막", "차도",
      node2X: 2290,
      node2Y: 2648,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 혜화관2", "동대입구 혜화관1", 250, 250, "내리막", "차도");
//143
  graph.addEdge("동대입구 혜화관2", "혜화관 사회과학관 갈림길", 210, 210, "오르막", "차도");
  graph.addEdge("혜화관 사회과학관 갈림길", "동대입구 혜화관2", 112, 112, "내리막", "차도");
//144
  graph.addEdge("혜화관 사회과학관 갈림길", "혜화관 팔정도 계단 아래", 311, 311, "오르막", "차도",
      node2X: 2017,
      node2Y: 2694,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 팔정도 계단 아래", "혜화관 사회과학관 갈림길", 166, 166, "내리막", "차도");
//145
  graph.addEdge("혜화관 팔정도 계단 아래", "혜화관 팔정도 계단 위", 218, 218, "오르막", "도보",
      node2X: 1872,
      node2Y: 2705,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 팔정도 계단 위", "혜화관 팔정도 계단 아래", 116, 116, "내리막", "도보");
//146
  graph.addEdge("혜화관 팔정도 계단 위", "법학관 뒷길1", 59, 59, "평지", "차도",
      node2X: 1870,
      node2Y: 2764,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 뒷길1", "혜화관 팔정도 계단 위", 59, 59, "평지", "차도");
//147
  graph.addEdge("법학관 뒷길1", "법학관 뒷길2", 73, 73, "평지", "차도",
      node2X: 1827,
      node2Y: 2823,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 뒷길2", "법학관 뒷길1", 73, 73, "평지", "차도");
//148
  graph.addEdge("법학관 뒷길2", "법학관 뒷길3", 58, 58, "평지", "차도",
      node2X: 1775,
      node2Y: 2848,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 뒷길3", "법학관 뒷길2", 58, 58, "평지", "차도");
//149
  graph.addEdge("법학관 뒷길2", "혜화관 만해관 중간", 82, 82, "평지", "도보",
      node2X: 1805,
      node2Y: 2902,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 만해관 중간", "법학관 뒷길2", 82, 82, "평지", "도보");
//150
  graph.addEdge("혜화관 만해관 중간", "혜화관 4층 입구", 103, 103, "평지", "도보",
      node2X: 1905,
      node2Y: 2925,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 4층 입구", "혜화관 만해관 중간", 103, 103, "평지", "도보");
//151
  graph.addEdge("혜화관 만해관 중간", "만해관 2층 입구 앞", 93, 93, "평지", "도보",
      node2X: 1715,
      node2Y: 2879,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 2층 입구 앞", "혜화관 만해관 중간", 93, 93, "평지", "도보");
//152
  graph.addEdge("만해관 2층 입구 앞", "만해관 2층 입구", 22, 22, "계단위", "도보",
      node2X: 1701,
      node2Y: 2874,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 2층 입구", "만해관 2층 입구 앞", 12, 12, "계단아래", "도보");
//153
  graph.addEdge("만해관 2층 입구 앞", "만해관 정각원 갈림길", 188, 188, "평지", "도보",
      node2X: 1660,
      node2Y: 3059,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 정각원 갈림길", "만해관 2층 입구 앞", 188, 188, "평지", "도보");
//154
  graph.addEdge("만해관 정각원 갈림길", "정각원 입구 앞", 78, 78, "평지", "도보",
      node2X: 1737,
      node2Y: 3072,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원 입구 앞", "만해관 정각원 갈림길", 78, 78, "평지", "도보");
//155
  graph.addEdge("정각원 입구 앞", "정각원 입구", 31, 31, "계단위", "도보",
      node2X: 1742,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원 입구", "정각원 입구 앞", 16, 16, "계단아래", "도보");
//156
  graph.addEdge("정각원 입구 앞", "정각원 계단 아래", 41, 41, "계단아래", "도보");
  graph.addEdge("정각원 계단 아래", "정각원 입구 앞", 76, 76, "계단위", "도보");
//157
  graph.addEdge("만해관 정각원 갈림길", "만해관 우측 하단", 21, 21, "평지", "도보",
      node2X: 1654,
      node2Y: 3079,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 우측 하단", "만해관 정각원 갈림길", 21, 21, "평지", "도보");
//158
  graph.addEdge("만해관 우측 하단", "만해관 옆입구 앞", 52, 52, "평지", "도보",
      node2X: 1605,
      node2Y: 3063,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 옆입구 앞", "만해관 우측 하단", 52, 52, "평지", "도보");
//159
  graph.addEdge("만해관 옆입구 앞", "만해관 옆입구", 12, 12, "평지", "도보",
      node2X: 1609,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 옆입구", "만해관 옆입구 앞", 12, 12, "평지", "도보");
//160
  graph.addEdge("만해관 옆입구 앞", "만해관 내려가는 길1", 81, 81, "평지", "도보");
  graph.addEdge("만해관 내려가는 길1", "만해관 옆입구 앞", 81, 81, "평지", "도보");
//119
  graph.addEdge("과학관 차도 입구", "만해관 입구", 87, 87, "평지", "도보",
      node2X: 1624,
      node2Y: 2860,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 입구", "과학관 차도 입구", 87, 87, "평지", "도보");
//161
  graph.addEdge("팔정도 좌측 하단", "명진관 중앙 계단 아래", 145, 145, "평지", "차도");
  graph.addEdge("명진관 중앙 계단 아래", "팔정도 좌측 하단", 145, 145, "평지", "차도");
//162
  graph.addEdge("명진관 중앙 계단 아래", "명진관 오른쪽 계단 아래", 180, 180, "평지", "차도");
  graph.addEdge("명진관 오른쪽 계단 아래", "명진관 중앙 계단 아래", 180, 180, "평지", "차도");
//163
  graph.addEdge("명진관 오른쪽 계단 아래", "팔정도 오른쪽", 140, 140, "평지", "차도",
      node2X: 1562,
      node2Y: 2713,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 오른쪽", "명진관 오른쪽 계단 아래", 140, 140, "평지", "차도");
//164
  graph.addEdge("팔정도 오른쪽", "법학관 1층 입구 앞", 29, 29, "평지", "차도",
      node2X: 1571,
      node2Y: 2685,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 1층 입구 앞", "팔정도 오른쪽", 29, 29, "평지", "차도");
//165
  graph.addEdge("법학관 1층 입구 앞", "법학관 1층 입구", 29, 29, "평지", "도보",
      node2X: 1598,
      node2Y: 2696,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 1층 입구", "법학관 1층 입구 앞", 29, 29, "평지", "도보");
//166
  graph.addEdge("법학관 1층 입구 앞", "팔정도 우측 상단1", 97, 97, "평지", "차도",
      node2X: 1588,
      node2Y: 2589,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 우측 상단1", "법학관 1층 입구 앞", 97, 97, "평지", "차도");
//167
  graph.addEdge("팔정도 우측 상단1", "팔정도 우측 상단2", 27, 27, "평지", "차도",
      node2X: 1576,
      node2Y: 2565,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 우측 상단2", "팔정도 우측 상단1", 27, 27, "평지", "차도");
//168
  graph.addEdge("팔정도 우측 상단2", "팔정도 혜화관1", 34, 34, "평지", "차도",
      node2X: 1605,
      node2Y: 2547,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 혜화관1", "팔정도 우측 상단2", 34, 34, "평지", "차도");
//169
  graph.addEdge("팔정도 혜화관1", "팔정도 혜화관2", 105, 105, "내리막", "차도",
      node2X: 1729,
      node2Y: 2589,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 혜화관2", "팔정도 혜화관1", 196, 196, "오르막", "차도");
//170
  graph.addEdge("팔정도 혜화관2", "팔정도 혜화관3", 69, 69, "평지", "차도",
      node2X: 1751,
      node2Y: 2654,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 혜화관3", "팔정도 혜화관2", 69, 69, "평지", "차도");
//171
  graph.addEdge("팔정도 혜화관3", "혜화관 팔정도 계단 위", 131, 131, "평지", "차도");
  graph.addEdge("혜화관 팔정도 계단 위", "팔정도 혜화관3", 131, 131, "평지", "차도");
//172
  graph.addEdge("팔정도 우측 상단2", "다향관 3층 오른쪽 입구 앞", 17.4929, 17.4929, "평지", "차도",
      node2X: 1567,
      node2Y: 2550,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 3층 오른쪽 입구 앞", "팔정도 우측 상단2", 17.4929, 17.4929, "평지", "차도");
//173
  graph.addEdge("다향관 3층 오른쪽 입구 앞", "다향관 3층 오른쪽 입구", 16.7631, 16.7631, "평지", "도보",
      node2X: 1572,
      node2Y: 2534,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 3층 오른쪽 입구", "다향관 3층 오른쪽 입구 앞", 16.7631, 16.7631, "평지", "도보");
//174
  graph.addEdge("다향관 3층 오른쪽 입구 앞", "팔정도 위", 130.648, 130.648, "평지", "차도",
      node2X: 1442,
      node2Y: 2512,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 위", "다향관 3층 오른쪽 입구 앞", 130.648, 130.648, "평지", "차도");
//175
  graph.addEdge("팔정도 위", "다향관 3층 왼쪽 계단 입구 앞", 108, 108, "평지", "차도",
      node2X: 1339,
      node2Y: 2478,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 3층 왼쪽 계단 입구 앞", "팔정도 위", 108, 108, "평지", "차도");
//202
  graph.addEdge("다향관 3층 왼쪽 계단 입구 앞", "다향관 3층 왼쪽 계단 입구", 35, 35, "평지", "도보",
      node2X: 1353,
      node2Y: 2446,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 3층 왼쪽 계단 입구", "다향관 3층 왼쪽 계단 입구 앞", 35, 35, "평지", "도보");
//176
  graph.addEdge("다향관 3층 왼쪽 계단 입구 앞", "팔정도 좌측 상단", 35, 35, "평지", "차도",
      node2X: 1305,
      node2Y: 2469,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 좌측 상단", "다향관 3층 왼쪽 계단 입구 앞", 35, 35, "평지", "차도");
//177
  graph.addEdge("팔정도 좌측 상단", "본관 3층 오른쪽 입구 앞", 10, 10, "평지", "차도",
      node2X: 1300,
      node2Y: 2478,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 입구 앞", "팔정도 좌측 상단", 10, 10, "평지", "차도");
//178
  graph.addEdge("본관 3층 오른쪽 입구 앞", "본관 3층 오른쪽 입구", 47, 47, "평지", "도보",
      node2X: 1255,
      node2Y: 2463,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 입구", "본관 3층 오른쪽 입구 앞", 47, 47, "평지", "도보");
//179
  graph.addEdge("본관 3층 오른쪽 입구 앞", "팔정도 왼쪽", 142, 142, "평지", "차도",
      node2X: 1257,
      node2Y: 2613,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 왼쪽", "본관 3층 오른쪽 입구 앞", 142, 142, "평지", "차도");
//180
  graph.addEdge("팔정도 왼쪽", "본관 3층 왼쪽 입구 앞", 23, 23, "평지", "차도",
      node2X: 1250,
      node2Y: 2635,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 입구 앞", "팔정도 왼쪽", 23, 23, "평지", "차도");
//181
  graph.addEdge("본관 3층 왼쪽 입구 앞", "본관 3층 왼쪽 입구", 46.8188, 46.8188, "평지", "도보",
      node2X: 1206,
      node2Y: 2619,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 입구", "본관 3층 왼쪽 입구 앞", 46.8188, 46.8188, "평지", "도보");
//182
  graph.addEdge("본관 3층 왼쪽 입구 앞", "팔정도 좌측 하단", 120, 120, "평지", "차도");
  graph.addEdge("팔정도 좌측 하단", "본관 3층 왼쪽 입구 앞", 120, 120, "평지", "차도");
//183
  graph.addEdge("팔정도 좌측 하단", "팔정도1", 127, 127, "평지", "도보",
      node2X: 1327,
      node2Y: 2695,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도1", "팔정도 좌측 하단", 127, 127, "평지", "도보");
//184
  graph.addEdge("팔정도1", "팔정도 중앙", 83, 83, "평지", "도보",
      node2X: 1403,
      node2Y: 2661,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 중앙", "팔정도1", 83, 83, "평지", "도보");
//185
  graph.addEdge("팔정도1", "팔정도2", 46, 46, "평지", "도보",
      node2X: 1342,
      node2Y: 2738,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도2", "팔정도1", 46, 46, "평지", "도보");
//186
  graph.addEdge("팔정도2", "팔정도3", 30, 30, "평지", "도보",
      node2X: 1364,
      node2Y: 2759,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도3", "팔정도2", 30, 30, "평지", "도보");
//187
  graph.addEdge("팔정도3", "명진관 중앙 계단 아래", 35, 35, "평지", "도보");
  graph.addEdge("명진관 중앙 계단 아래", "팔정도3", 35, 35, "평지", "도보");
//188
  graph.addEdge("팔정도3", "팔정도4", 39, 39, "평지", "도보",
      node2X: 1402,
      node2Y: 2752,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도4", "팔정도3", 39, 39, "평지", "도보");
//189
  graph.addEdge("팔정도4", "팔정도5", 49, 49, "평지", "도보",
      node2X: 1437,
      node2Y: 2717,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도5", "팔정도4", 49, 49, "평지", "도보");
//190
  graph.addEdge("팔정도5", "명진관 오른쪽 계단 아래", 155, 155, "평지", "도보");
  graph.addEdge("명진관 오른쪽 계단 아래", "팔정도5", 155, 155, "평지", "도보");
//191
  graph.addEdge("팔정도5", "팔정도 중앙", 66, 66, "평지", "도보");
  graph.addEdge("팔정도 중앙", "팔정도5", 66, 66, "평지", "도보");
//192
  graph.addEdge("팔정도 중앙", "팔정도 오른쪽", 167, 167, "평지", "도보");
  graph.addEdge("팔정도 오른쪽", "팔정도 중앙", 167, 167, "평지", "도보");
//193
  graph.addEdge("팔정도 중앙", "팔정도6", 73, 73, "평지", "도보",
      node2X: 1466,
      node2Y: 2625,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도6", "팔정도 중앙", 73, 73, "평지", "도보");
//194
  graph.addEdge("팔정도6", "팔정도 우측 상단2", 125, 125, "평지", "도보");
  graph.addEdge("팔정도 우측 상단2", "팔정도6", 125, 125, "평지", "도보");
//195
  graph.addEdge("팔정도6", "팔정도7", 48, 48, "평지", "도보",
      node2X: 1455,
      node2Y: 2578,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도7", "팔정도6", 48, 48, "평지", "도보");
//196
  graph.addEdge("팔정도7", "팔정도8", 35, 35, "평지", "도보",
      node2X: 1429,
      node2Y: 2555,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도8", "팔정도7", 35, 35, "평지", "도보");
//197
  graph.addEdge("팔정도8", "팔정도 위", 45, 45, "평지", "도보");
  graph.addEdge("팔정도 위", "팔정도8", 45, 45, "평지", "도보");
//198
  graph.addEdge("팔정도8", "팔정도9", 35, 35, "평지", "도보",
      node2X: 1394,
      node2Y: 2560,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도9", "팔정도8", 35, 35, "평지", "도보");
//199
  graph.addEdge("팔정도9", "팔정도10", 38, 38, "평지", "도보",
      node2X: 1362,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도10", "팔정도9", 38, 38, "평지", "도보");
//200
  graph.addEdge("팔정도10", "팔정도 좌측 상단", 126, 126, "평지", "도보");
  graph.addEdge("팔정도 좌측 상단", "팔정도10", 126, 126, "평지", "도보");
//201
  graph.addEdge("팔정도10", "팔정도 중앙", 90, 90, "평지", "도보");
  graph.addEdge("팔정도 중앙", "팔정도10", 90, 90, "평지", "도보");
//202 다향관에 씀
//203
  graph.addEdge("팔정도 중앙", "팔정도 왼쪽", 154, 154, "평지", "도보");
  graph.addEdge("팔정도 왼쪽", "팔정도 중앙", 154, 154, "평지", "도보");
//204 문화관에 씀
//205 문화관에 씀
//206
  graph.addEdge("팔정도 좌측 상단", "팔정도 본관 계단 위", 48, 48, "평지", "차도",
      node2X: 1320,
      node2Y: 2423,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 본관 계단 위", "팔정도 좌측 상단", 48, 48, "평지", "차도");
//207
  graph.addEdge("팔정도 본관 계단 위", "다향관 2층 입구 앞", 21.8358, 21.8358, "내리막", "차도",
      node2X: 1324,
      node2Y: 2396,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 2층 입구 앞", "팔정도 본관 계단 위", 40.942, 40.942, "오르막", "차도");
//208
  graph.addEdge("다향관 2층 입구 앞", "다향관 2층 왼쪽 계단 입구 앞", 41.7612, 41.7612, "평지", "도보",
      node2X: 1364,
      node2Y: 2408,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 2층 왼쪽 계단 입구 앞", "다향관 2층 입구 앞", 41.7612, 41.7612, "평지", "도보");
  //630
  graph.addEdge("다향관 2층 왼쪽 계단 입구 앞", "다향관 2층 왼쪽 계단 입구", 4.12311, 4.12311, "평지", "도보",
      node2X: 1363,
      node2Y: 2412,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 2층 왼쪽 계단 입구", "다향관 2층 왼쪽 계단 입구 앞", 4.12311, 4.12311, "평지", "도보");
//209
  graph.addEdge("다향관 2층 입구 앞", "다향관 1층 입구 앞", 33.6856, 33.6856, "내리막", "차도",
      node2X: 1321,
      node2Y: 2354,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 앞", "다향관 2층 입구 앞", 63.1605, 63.1605, "오르막", "차도");
//210
  graph.addEdge("다향관 1층 입구 앞", "다향관 1층 입구 앞2", 30, 30, "내리막", "도보",
      node2X: 1357,
      node2Y: 2364,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 앞2", "다향관 1층 입구 앞", 56, 56, "오르막", "도보");
  //211
  graph.addEdge("다향관 1층 입구 앞2", "다향관 1층 입구 앞3", 15.284, 15.284, "내리막", "도보",
      node2X: 1370,
      node2Y: 2378,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 앞3", "다향관 1층 입구 앞2", 28.6575, 28.6575, "오르막", "도보");
  //629
  graph.addEdge("다향관 1층 입구 앞3", "다향관 1층 왼쪽 계단 입구", 34.7131, 34.7131, "평지", "도보",
      node2X: 1363,
      node2Y: 2412,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 왼쪽 계단 입구", "다향관 1층 입구 앞3", 34.7131, 34.7131, "평지", "도보");
//212
  graph.addEdge("다향관 1층 입구 앞", "팔정도 후문 차도1", 80, 80, "내리막", "차도",
      node2X: 1283,
      node2Y: 2262,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도1", "다향관 1층 입구 앞", 149, 149, "오르막", "차도");
//213
  graph.addEdge("팔정도 후문 차도1", "팔정도 후문 차도2", 24, 24, "내리막", "차도",
      node2X: 1258,
      node2Y: 2245,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도2", "팔정도 후문 차도1", 45, 45, "오르막", "차도");
//214
  graph.addEdge("팔정도 후문 차도2", "헐떡고개 위", 22, 22, "내리막", "차도",
      node2X: 1231,
      node2Y: 2248,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("헐떡고개 위", "팔정도 후문 차도2", 41, 41, "오르막", "차도");
//215
  graph.addEdge("헐떡고개 위", "만해광장 입구", 75, 75, "내리막", "차도",
      node2X: 1138,
      node2Y: 2264,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 입구", "헐떡고개 위", 142, 142, "오르막", "차도");
//216
  graph.addEdge("만해광장 입구", "팔정도 후문 차도3", 64, 64, "내리막", "차도",
      node2X: 1059,
      node2Y: 2278,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도3", "만해광장 입구", 120, 120, "오르막", "차도");
//217
  graph.addEdge("팔정도 후문 차도3", "지하주차장 가는길1", 33, 33, "평지", "차도",
      node2X: 1046,
      node2Y: 2308,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 가는길1", "팔정도 후문 차도3", 33, 33, "평지", "차도");
//218
  graph.addEdge("지하주차장 가는길1", "지하주차장 가는길2", 81, 81, "평지", "차도",
      node2X: 1078,
      node2Y: 2382,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 가는길2", "지하주차장 가는길1", 81, 81, "평지", "차도");
//219
  graph.addEdge("지하주차장 가는길2", "팔정도 본관 계단 아래", 160, 160, "평지", "도보",
      node2X: 1235,
      node2Y: 2349,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 본관 계단 아래", "지하주차장 가는길2", 160, 160, "평지", "도보");
//220
  graph.addEdge("팔정도 본관 계단 아래", "팔정도 본관 계단 중간", 102, 102, "계단위", "도보",
      node2X: 1255,
      node2Y: 2414,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 본관 계단 중간", "팔정도 본관 계단 아래", 54, 54, "계단아래", "도보");
//221
  graph.addEdge("팔정도 본관 계단 중간", "팔정도 본관 계단 위", 98, 98, "계단위", "도보");
  graph.addEdge("팔정도 본관 계단 위", "팔정도 본관 계단 중간", 52, 52, "계단아래", "도보");
//222 본관 1층인지 불확실
  graph.addEdge("지하주차장 가는길2", "본관 1층 입구", 44, 44, "평지", "도보",
      node2X: 1113,
      node2Y: 2409,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 1층 입구", "지하주차장 가는길2", 44, 44, "평지", "도보");
//223
  graph.addEdge("지하주차장 가는길2", "원흥관 4층 입구", 82.6075, 82.6075, "평지", "도보",
      node2X: 996,
      node2Y: 2392,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 4층 입구", "지하주차장 가는길2", 82.6075, 82.6075, "평지", "도보");
  //224
  graph.addEdge("지하주차장 가는길2", "지하주차장 가는길3", 195.205, 195.205, "평지", "차도",
      node2X: 1022,
      node2Y: 2569,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 가는길3", "지하주차장 가는길2", 195.205, 195.205, "평지", "차도");
  //225
  graph.addEdge("지하주차장 가는길3", "본관 1층 쪽문 앞", 26.5707, 26.5707, "평지", "도보",
      node2X: 1047,
      node2Y: 2578,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 1층 쪽문 앞", "지하주차장 가는길3", 26.5707, 26.5707, "평지", "도보");
  //586
  graph.addEdge("본관 1층 쪽문 앞", "본관 1층 쪽문", 5.38516, 5.38516, "평지", "도보",
      node2X: 1045,
      node2Y: 2583,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 1층 쪽문", "본관 1층 쪽문 앞", 5.38516, 5.38516, "평지", "도보");
//226
  graph.addEdge("지하주차장 가는길3", "지하주차장 앞", 34, 34, "평지", "차도");
  graph.addEdge("지하주차장 앞", "지하주차장 가는길3", 34, 34, "평지", "차도");
//227
  graph.addEdge("지하주차장 앞", "지하주차장 입구", 64, 64, "평지", "차도",
      node2X: 939,
      node2Y: 2624,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 입구", "지하주차장 앞", 64, 64, "평지", "차도");
//228
  graph.addEdge("헐떡고개 위", "헐떡고개 아래", 180, 180, "내리막", "도보",
      node2X: 1282,
      node2Y: 2029,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("헐떡고개 아래", "헐떡고개 위", 337, 337, "오르막", "도보");
//229
  graph.addEdge("헐떡고개 아래", "체육관 옆문 앞", 24, 24, "내리막", "도보",
      node2X: 1288,
      node2Y: 1999,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("체육관 옆문 앞", "헐떡고개 아래", 46, 46, "오르막", "도보");
//230
  graph.addEdge("체육관 옆문 앞", "체육관 옆문", 52, 52, "평지", "도보",
      node2X: 1338,
      node2Y: 2012,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("체육관 옆문", "체육관 옆문 앞", 52, 52, "평지", "도보");
//231
  graph.addEdge("체육관 옆문 앞", "듀이카 가는길1", 128, 128, "내리막", "차도",
      node2X: 1322,
      node2Y: 1843,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길1", "체육관 옆문 앞", 239, 239, "오르막", "차도");
//232
  graph.addEdge("듀이카 가는길1", "듀이카 가는길2", 22, 22, "평지", "도보",
      node2X: 1344,
      node2Y: 1841,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길2", "듀이카 가는길1", 22, 22, "평지", "도보");
//233
  graph.addEdge("듀이카 가는길2", "학림관 우측 앞문", 27, 27, "평지", "도보",
      node2X: 1354,
      node2Y: 1816,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 우측 앞문", "듀이카 가는길2", 27, 27, "평지", "도보");
//234
  graph.addEdge("듀이카 가는길2", "듀이카 가는길3", 42, 42, "평지", "도보",
      node2X: 1386,
      node2Y: 1839,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길3", "듀이카 가는길2", 42, 42, "평지", "도보");
//235
  graph.addEdge("듀이카 가는길3", "듀이카 가는길4", 70, 70, "평지", "도보",
      node2X: 1455,
      node2Y: 1851,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길4", "듀이카 가는길3", 70, 70, "평지", "도보");
//236
  graph.addEdge("듀이카 가는길4", "체육관 정문", 9, 9, "평지", "도보",
      node2X: 1453,
      node2Y: 1860,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("체육관 정문", "듀이카 가는길4", 9, 9, "평지", "도보");
//237
  graph.addEdge("듀이카 가는길4", "반야관 입구 앞", 26, 26, "평지", "도보",
      node2X: 1480,
      node2Y: 1859,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 입구 앞", "듀이카 가는길4", 26, 26, "평지", "도보");
//238
  graph.addEdge("반야관 입구 앞", "반야관 입구", 31, 31, "평지", "도보",
      node2X: 1495,
      node2Y: 1832,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 입구", "반야관 입구 앞", 31, 31, "평지", "도보");
//239
  graph.addEdge("반야관 입구 앞", "듀이카 앞 계단 위", 40, 40, "평지", "도보",
      node2X: 1517,
      node2Y: 1873,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 위", "반야관 입구 앞", 40, 40, "평지", "도보");
//240
  graph.addEdge("듀이카 앞 계단 위", "듀이카 앞 계단 중간1", 22, 22, "계단아래", "도보",
      node2X: 1541,
      node2Y: 1886,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 중간1", "듀이카 앞 계단 위", 41, 41, "계단위", "도보");
//241
  graph.addEdge("듀이카 앞 계단 중간1", "듀이카 옆 입구", 11, 11, "평지", "도보",
      node2X: 1550,
      node2Y: 1892,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 옆 입구", "듀이카 앞 계단 중간1", 11, 11, "평지", "도보");
//242
  graph.addEdge("듀이카 앞 계단 중간1", "듀이카 앞 계단 중간2", 15, 15, "계단아래", "도보",
      node2X: 1541,
      node2Y: 1905,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 중간2", "듀이카 앞 계단 중간1", 29, 29, "계단위", "도보");
//243
  graph.addEdge("듀이카 앞 계단 중간2", "듀이카 앞 계단 중간3", 35, 35, "계단아래", "도보",
      node2X: 1582,
      node2Y: 1920,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 중간3", "듀이카 앞 계단 중간2", 65, 65, "계단위", "도보");
//346
  graph.addEdge("듀이카 앞 계단 중간3", "듀이카쪽 학교 입구", 37, 37, "계단아래", "도보",
      node2X: 1625,
      node2Y: 1936,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카쪽 학교 입구", "듀이카 앞 계단 중간3", 69, 69, "계단위", "도보");
//345
  graph.addEdge("듀이카 앞 계단 중간3", "듀이카 쪽문", 6, 6, "평지", "도보",
      node2X: 1583,
      node2Y: 1914,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 쪽문", "듀이카 앞 계단 중간3", 6, 6, "평지", "도보");
//244
  graph.addEdge("듀이카 가는길4", "학림관 뒷길1", 101, 101, "평지", "도보",
      node2X: 1482,
      node2Y: 1754,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길1", "듀이카 가는길4", 101, 101, "평지", "도보");
//245
  graph.addEdge("학림관 뒷길1", "반야관 편의점 가는길1", 51, 51, "계단아래", "도보",
      node2X: 1541,
      node2Y: 1731,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 편의점 가는길1", "학림관 뒷길1", 95, 95, "계단위", "도보");
//246
  graph.addEdge("반야관 편의점 가는길1", "반야관 편의점 가는길2", 59, 59, "계단아래", "도보",
      node2X: 1600,
      node2Y: 1775,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 편의점 가는길2", "반야관 편의점 가는길1", 110, 110, "계단위", "도보");
//247
  graph.addEdge("반야관 편의점 가는길2", "반야관 편의점 입구", 42, 42, "계단아래", "도보",
      node2X: 1626,
      node2Y: 1821,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 편의점 입구", "반야관 편의점 가는길2", 79, 79, "계단위", "도보");
//248
  graph.addEdge("학림관 뒷길1", "학림관 뒷길2", 63, 63, "평지", "도보",
      node2X: 1497,
      node2Y: 1693,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길2", "학림관 뒷길1", 63, 63, "평지", "도보");
//249
  graph.addEdge("학림관 뒷길2", "학림관 뒷길3", 125, 125, "평지", "도보",
      node2X: 1374,
      node2Y: 1714,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길3", "학림관 뒷길2", 125, 125, "평지", "도보");
//250
  graph.addEdge("학림관 뒷길3", "학림관 오른쪽 뒷문", 57, 57, "평지", "도보",
      node2X: 1357,
      node2Y: 1768,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 오른쪽 뒷문", "학림관 뒷길3", 57, 57, "평지", "도보");
//251
  graph.addEdge("학림관 뒷길3", "학림관 뒷길4", 74, 74, "계단아래", "도보",
      node2X: 1282,
      node2Y: 1705,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길4", "학림관 뒷길3", 139, 139, "계단위", "도보");
//252
  graph.addEdge("학림관 뒷길4", "학림관 뒷문", 30, 30, "계단위", "도보",
      node2X: 1276,
      node2Y: 1724,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷문", "학림관 뒷길4", 16, 16, "계단아래", "도보");
//253
  graph.addEdge("학림관 뒷길4", "학림관 뒷길5", 77, 77, "계단위", "도보",
      node2X: 1215,
      node2Y: 1667,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길5", "학림관 뒷길4", 77, 77, "계단아래", "도보");
//254
  graph.addEdge("학림관 뒷길5", "학림관 왼쪽 뒷문", 87, 87, "계단위", "도보",
      node2X: 1197,
      node2Y: 1722,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 왼쪽 뒷문", "학림관 뒷길5", 46, 46, "계단아래", "도보");
//255
  graph.addEdge("학림관 뒷길5", "후문", 123, 123, "내리막", "도보",
      node2X: 1114,
      node2Y: 1576,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문", "학림관 뒷길5", 231, 231, "오르막", "도보");
//256
  graph.addEdge("후문", "후문 학생회관1", 188, 188, "오르막", "도보",
      node2X: 993,
      node2Y: 1608,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문 학생회관1", "후문", 100, 100, "내리막", "도보");
//257
  graph.addEdge("후문 학생회관1", "후문 학생회관2", 67, 67, "평지", "도보",
      node2X: 936,
      node2Y: 1643,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문 학생회관2", "후문 학생회관1", 67, 67, "평지", "도보");
//258
  graph.addEdge("후문 학생회관2", "후문 학생회관3", 98, 98, "평지", "도보",
      node2X: 882,
      node2Y: 1725,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문 학생회관3", "후문 학생회관2", 98, 98, "평지", "도보");
//259
  graph.addEdge("후문 학생회관3", "학생회관 학림관 계단 아래", 66, 66, "평지", "도보",
      node2X: 869,
      node2Y: 1790,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 학림관 계단 아래", "후문 학생회관3", 66, 66, "평지", "도보");
//260
  graph.addEdge("학생회관 학림관 계단 아래", "학생회관 계단 입구", 69, 69, "계단위", "도보",
      node2X: 832,
      node2Y: 1817,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 계단 입구", "학생회관 학림관 계단 아래", 37, 37, "계단아래", "도보");
//261
  graph.addEdge("학생회관 학림관 계단 아래", "학생회관 학림관 계단 중간", 68, 68, "계단위", "도보",
      node2X: 913,
      node2Y: 1780,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 학림관 계단 중간", "학생회관 학림관 계단 아래", 36, 36, "계단아래", "도보");
//262
  graph.addEdge("학생회관 학림관 계단 중간", "학생회관 학림관 계단 위", 57, 57, "계단위", "도보",
      node2X: 951,
      node2Y: 1783,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 학림관 계단 위", "학생회관 학림관 계단 중간", 30, 30, "계단아래", "도보");
//263
  graph.addEdge("학생회관 학림관 계단 아래", "학생회관 옆 계단 위", 50, 50, "계단위", "도보",
      node2X: 861,
      node2Y: 1833,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 옆 계단 위", "학생회관 학림관 계단 아래", 26, 26, "계단아래", "도보");
//264
  graph.addEdge("학생회관 옆 계단 위", "팔정도 후문 차도6", 61, 61, "평지", "도보",
      node2X: 879,
      node2Y: 1891,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도6", "학생회관 옆 계단 위", 61, 61, "평지", "도보");
//265
  graph.addEdge("듀이카 가는길1", "학림관 입구 앞", 82, 82, "평지", "차도",
      node2X: 1244,
      node2Y: 1819,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 입구 앞", "듀이카 가는길1", 82, 82, "평지", "차도");
//266
  graph.addEdge("학림관 입구 앞", "학림관 입구", 34, 34, "평지", "도보",
      node2X: 1255,
      node2Y: 1787,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 입구", "학림관 입구 앞", 34, 34, "평지", "도보");
//267
  graph.addEdge("학림관 입구 앞", "학림관 좌측 앞문 앞", 93, 93, "평지", "차도",
      node2X: 1154,
      node2Y: 1795,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 좌측 앞문 앞", "학림관 입구 앞", 93, 93, "평지", "차도");
  //368
  graph.addEdge("학림관 좌측 앞문 앞", "학림관 좌측 앞문", 39, 39, "평지", "차도",
      node2X: 1166,
      node2Y: 1758,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 좌측 앞문", "학림관 좌측 앞문 앞", 39, 39, "평지", "차도");
  //369
  graph.addEdge("학림관 좌측 앞문 앞", "계산관B 입구 앞", 51, 51, "평지", "차도",
      node2X: 1105,
      node2Y: 1782,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관B 입구 앞", "학림관 좌측 앞문 앞", 51, 51, "평지", "차도");
//268
  graph.addEdge("계산관B 입구 앞", "계산관B 입구 앞2", 34, 34, "평지", "도보",
      node2X: 1097,
      node2Y: 1815,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관B 입구 앞2", "계산관B 입구 앞", 34, 34, "평지", "도보");
//269
  graph.addEdge("계산관B 입구 앞2", "계산관B 입구", 26, 26, "평지", "도보",
      node2X: 1071,
      node2Y: 1810,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관B 입구", "계산관B 입구 앞2", 26, 26, "평지", "도보");
//270
  graph.addEdge("계산관B 입구 앞", "계산관A 계단 위", 71, 71, "평지", "차도",
      node2X: 1037,
      node2Y: 1762,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 계단 위", "계산관B 입구 앞", 71, 71, "평지", "차도");
//271
  graph.addEdge("계산관A 계단 위", "계산관A 계단 아래", 18, 18, "계단아래", "도보",
      node2X: 1044,
      node2Y: 1740,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 계단 아래", "계산관A 계단 위", 35, 35, "계단위", "도보");
//272
  graph.addEdge("계산관A 계단 아래", "계산관A 학림관 갈림길", 32, 32, "평지", "도보",
      node2X: 1053,
      node2Y: 1709,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 학림관 갈림길", "계산관A 계단 아래", 32, 32, "평지", "도보");
//273
  graph.addEdge("계산관A 학림관 갈림길", "학림관 편의점 입구", 31, 31, "계단아래", "도보",
      node2X: 1090,
      node2Y: 1721,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 편의점 입구", "계산관A 학림관 갈림길", 58, 58, "계단위", "도보");
//274
  graph.addEdge("계산관A 학림관 갈림길", "계산관A 입구", 17, 17, "평지", "도보",
      node2X: 1058,
      node2Y: 1693,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 입구", "계산관A 학림관 갈림길", 17, 17, "평지", "도보");
//275
  graph.addEdge("계산관A 계단 위", "팔정도 후문 차도8", 43, 43, "평지", "차도",
      node2X: 995,
      node2Y: 1751,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도8", "계산관A 계단 위", 43, 43, "평지", "차도");
//276
  graph.addEdge("팔정도 후문 차도8", "팔정도 후문 차도7", 28, 28, "평지", "차도",
      node2X: 968,
      node2Y: 1757,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도7", "팔정도 후문 차도8", 28, 28, "평지", "차도");
//277
  graph.addEdge("팔정도 후문 차도7", "학생회관 학림관 계단 위", 31, 31, "평지", "차도");
  graph.addEdge("학생회관 학림관 계단 위", "팔정도 후문 차도7", 31, 31, "평지", "차도");
//278
  graph.addEdge("학생회관 학림관 계단 위", "팔정도 후문 차도6", 130, 130, "평지", "차도");
  graph.addEdge("팔정도 후문 차도6", "학생회관 학림관 계단 위", 130, 130, "평지", "차도");
//279
  graph.addEdge("팔정도 후문 차도6", "학생회관 입구 앞", 41, 41, "평지", "도보",
      node2X: 840,
      node2Y: 1904,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 입구 앞", "팔정도 후문 차도6", 41, 41, "평지", "도보");
//280
  graph.addEdge("학생회관 입구 앞", "학생회관 입구", 38, 38, "평지", "도보",
      node2X: 806,
      node2Y: 1888,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 입구", "학생회관 입구 앞", 38, 38, "평지", "도보");
//281
  graph.addEdge("학생회관 입구 앞", "정P 3층 입구 앞", 38, 38, "평지", "도보",
      node2X: 841,
      node2Y: 1942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 입구 앞", "학생회관 입구 앞", 38, 38, "평지", "도보");
//282
  graph.addEdge("정P 3층 입구 앞", "정P 밖 3층 계단", 29, 29, "평지", "도보",
      node2X: 812,
      node2Y: 1946,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 밖 3층 계단", "정P 3층 입구 앞", 29, 29, "평지", "도보");
//283
  graph.addEdge("정P 3층 입구 앞", "정P 3층 입구", 32, 32, "평지", "도보",
      node2X: 842,
      node2Y: 1974,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 입구", "정P 3층 입구 앞", 32, 32, "평지", "도보");
//284
  graph.addEdge("정P 3층 입구 앞", "팔정도 후문 차도5", 49, 49, "평지", "도보",
      node2X: 888,
      node2Y: 1928,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도5", "정P 3층 입구 앞", 49, 49, "평지", "도보");
//285
  graph.addEdge("팔정도 후문 차도5", "팔정도 후문 차도6", 38, 38, "평지", "차도");
  graph.addEdge("팔정도 후문 차도6", "팔정도 후문 차도5", 38, 38, "평지", "차도");
//286
  graph.addEdge("팔정도 후문 차도5", "만해광장 계단 아래", 153, 153, "오르막", "차도",
      node2X: 913,
      node2Y: 2027,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 계단 아래", "팔정도 후문 차도5", 82, 82, "내리막", "차도");
//287
  graph.addEdge("만해광장 계단 아래", "만해광장 계단 위", 130, 130, "오르막", "도보",
      node2X: 999,
      node2Y: 2038,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 계단 위", "만해광장 계단 아래", 69, 69, "내리막", "도보");
//288
  graph.addEdge("만해광장 계단 위", "만해광장", 103, 103, "평지", "도보",
      node2X: 1101,
      node2Y: 2051,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장", "만해광장 계단 위", 103, 103, "평지", "도보");
//289
  graph.addEdge("만해광장", "만해광장 입구", 216, 216, "평지", "도보");
  graph.addEdge("만해광장 입구", "만해광장", 216, 216, "평지", "도보");
//290
  graph.addEdge("만해광장 계단 아래", "팔정도 후문 차도4", 72, 72, "오르막", "차도",
      node2X: 924,
      node2Y: 2074,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도4", "만해광장 계단 아래", 39, 39, "내리막", "차도");
//291
  graph.addEdge("팔정도 후문 차도4", "팔정도 후문 차도3", 367, 367, "오르막", "차도");
  graph.addEdge("팔정도 후문 차도3", "팔정도 후문 차도4", 196, 196, "내리막", "차도");
//292
  graph.addEdge("팔정도 후문 차도4", "원흥관 앞 계단 아래", 92, 92, "내리막", "차도",
      node2X: 880,
      node2Y: 2180,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 아래", "팔정도 후문 차도4", 172, 172, "오르막", "차도");
//293
  graph.addEdge("원흥관 앞 계단 아래", "원흥관 앞 계단 중간1", 98.704, 98.704, "계단위", "도보",
      node2X: 943,
      node2Y: 2161,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 중간1", "원흥관 앞 계단 아래", 52.642, 52.642, "계단아래", "도보");
//294
  graph.addEdge("원흥관 앞 계단 중간1", "원흥관 앞 계단 중간2", 258.992, 258.992, "계단위", "도보",
      node2X: 1017,
      node2Y: 2317,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 중간2", "원흥관 앞 계단 중간1", 138.129, 138.129, "계단아래", "도보");
//295
  graph.addEdge("원흥관 앞 계단 중간2", "원흥관 앞 계단 위", 21.319, 21.319, "계단위", "도보",
      node2X: 1037,
      node2Y: 2319,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 위", "원흥관 앞 계단 중간2", 11.370, 11.370, "계단아래", "도보");
//296
  graph.addEdge("원흥관 앞 계단 위", "지하주차장 가는길1", 14.213, 14.213, "평지", "도보");
  graph.addEdge("지하주차장 가는길1", "원흥관 앞 계단 위", 14.213, 14.213, "평지", "도보");
//297
  graph.addEdge("원흥관 앞 계단 아래", "원흥관 1층 정문 앞", 91, 91, "평지", "차도",
      node2X: 926,
      node2Y: 2259,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 1층 정문 앞", "원흥관 앞 계단 아래", 91, 91, "평지", "차도");
//298
  graph.addEdge("원흥관 1층 정문 앞", "원흥관 1층 정문", 26, 26, "평지", "도보",
      node2X: 912,
      node2Y: 2281,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 1층 정문", "원흥관 1층 정문 앞", 26, 26, "평지", "도보");
//299
  graph.addEdge("원흥관 1층 정문 앞", "정P 3층 후문 앞", 118, 118, "평지", "차도",
      node2X: 832,
      node2Y: 2188,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 후문 앞", "원흥관 1층 정문 앞", 118, 118, "평지", "차도");
//300
  graph.addEdge("정P 3층 후문 앞", "원흥관 앞 계단 아래", 66, 66, "평지", "차도");
  graph.addEdge("원흥관 앞 계단 아래", "정P 3층 후문 앞", 66, 66, "평지", "차도");
//301
  graph.addEdge("정P 3층 후문 앞", "정P 3층 후문", 14, 14, "평지", "도보",
      node2X: 833,
      node2Y: 2174,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 후문", "정P 3층 후문 앞", 14, 14, "평지", "도보");
//302
  graph.addEdge("정P 3층 후문 앞", "정P 뒷길1", 38, 38, "평지", "도보",
      node2X: 794,
      node2Y: 2188,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길1", "정P 3층 후문 앞", 38, 38, "평지", "도보");
//303
  graph.addEdge("정P 뒷길1", "원흥관 1층 쪽문", 11, 11, "평지", "도보",
      node2X: 784,
      node2Y: 2193,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 1층 쪽문", "정P 뒷길1", 11, 11, "평지", "도보");
//304
  graph.addEdge("정P 뒷길1", "정P 뒷길 계단 위", 76, 76, "평지", "도보",
      node2X: 785,
      node2Y: 2111,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길 계단 위", "정P 뒷길1", 76, 76, "평지", "도보");
//305
  graph.addEdge("정P 뒷길 계단 위", "정P 뒷길 계단 아래", 23, 23, "계단아래", "도보",
      node2X: 780,
      node2Y: 2083,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길 계단 아래", "정P 뒷길 계단 위", 43, 43, "계단위", "도보");
//306
  graph.addEdge("정P 뒷길 계단 아래", "자취촌 학교 입구", 72, 72, "계단아래", "도보",
      node2X: 691,
      node2Y: 2095,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("자취촌 학교 입구", "정P 뒷길 계단 아래", 135, 135, "계단위", "도보");
//307
  graph.addEdge("정P 뒷길 계단 아래", "정P 뒷길2", 72, 72, "평지", "도보",
      node2X: 774,
      node2Y: 2011,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길2", "정P 뒷길 계단 아래", 72, 72, "평지", "도보");
//308
  graph.addEdge("정P 뒷길2", "정P 뒷길3", 30, 30, "계단아래", "도보",
      node2X: 774,
      node2Y: 1974,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길3", "정P 뒷길2", 56, 56, "계단위", "도보");
//309
  graph.addEdge("정P 뒷길3", "정P 뒷길4", 22, 22, "평지", "도보",
      node2X: 793,
      node2Y: 1963,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길4", "정P 뒷길3", 22, 22, "평지", "도보");
//310
  graph.addEdge("정P 뒷길4", "정Q 입구 앞", 21, 21, "평지", "도보",
      node2X: 792,
      node2Y: 1942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정Q 입구 앞", "정P 뒷길4", 21, 21, "평지", "도보");
//311
  graph.addEdge("정Q 입구 앞", "정Q 입구", 16, 16, "평지", "도보",
      node2X: 776,
      node2Y: 1942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정Q 입구", "정Q 입구 앞", 16, 16, "평지", "도보");
//312
  graph.addEdge("정Q 입구 앞", "정P 밖 2층 계단", 20, 20, "평지", "도보",
      node2X: 812,
      node2Y: 1946,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 밖 2층 계단", "정Q 입구 앞", 20, 20, "평지", "도보");
//313
  graph.addEdge("정P 밖 2층 계단", "정P 2층 입구", 32, 32, "평지", "도보",
      node2X: 814,
      node2Y: 1978,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 2층 입구", "정P 밖 2층 계단", 32, 32, "평지", "도보");
//314
  graph.addEdge("원흥관 1층 후문", "원흥관 신공학관1", 22.671, 22.671, "평지", "도보",
      node1X: 852,
      node1Y: 2356,
      isInside1: 0,
      building1: "실외",
      showRoute1: true,
      node2X: 835,
      node2Y: 2371,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 신공학관1", "원흥관 1층 후문", 20, 20, "평지", "도보");
//315
  graph.addEdge("원흥관 신공학관1", "원흥관 신공학관2", 146.617, 146.617, "계단위", "도보",
      node2X: 908,
      node2Y: 2436,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 신공학관2", "원흥관 신공학관1", 78.196, 78.196, "계단아래", "도보");
//316
  graph.addEdge("원흥관 신공학관2", "원흥관 3층 후문", 51, 51, "평지", "도보",
      node2X: 956,
      node2Y: 2452,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 3층 후문", "원흥관 신공학관2", 51, 51, "평지", "도보");
//317
  graph.addEdge("원흥관 신공학관2", "원흥별관 후문", 36, 36, "평지", "도보",
      node2X: 873,
      node2Y: 2442,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 후문", "원흥관 신공학관2", 36, 36, "평지", "도보");
//318
  graph.addEdge("원흥관 신공학관2", "원흥별관 정문 앞", 126, 126, "평지", "도보",
      node2X: 867,
      node2Y: 2555,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 정문 앞", "원흥관 신공학관2", 126, 126, "평지", "도보");
//319
  graph.addEdge("원흥별관 정문 앞", "원흥별관 정문", 45, 45, "평지", "도보",
      node2X: 843,
      node2Y: 2517,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 정문", "원흥별관 정문 앞", 45, 45, "평지", "도보");
//320
  graph.addEdge("원흥별관 정문 앞", "108계단 중간1", 16, 16, "평지", "도보",
      node2X: 863,
      node2Y: 2571,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 중간1", "원흥별관 정문 앞", 16, 16, "평지", "도보");
//321
  graph.addEdge("108계단 중간1", "신공 7층 입구 앞", 37, 37, "평지", "도보",
      node2X: 898,
      node2Y: 2584,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 7층 입구 앞", "108계단 중간1", 37, 37, "평지", "도보");
//322   단면도 적용하면 실내로 빼야함
  graph.addEdge("신공 7층 입구 앞", "신공 7층 입구", 47, 47, "평지", "도보",
      node2X: 881,
      node2Y: 2628,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 7층 입구", "신공 7층 입구 앞", 47, 47, "평지", "도보");
//323
  graph.addEdge("신공 7층 입구 앞", "108계단 중간2", 51.5461, 51.5461, "평지", "도보",
      node2X: 947,
      node2Y: 2600,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 중간2", "신공 7층 입구 앞", 51.5461, 51.5461, "평지", "도보");
//324
  graph.addEdge("지하주차장 앞", "108계단 위", 35.4683, 35.4683, "평지", "도보",
      node2X: 975,
      node2Y: 2592,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 위", "지하주차장 앞", 35.4683, 35.4683, "평지", "도보");
  //583
  graph.addEdge("108계단 위", "원흥관 3층 야외 계단 앞", 10.8812, 10.8812, "계단아래", "도보",
      node2X: 962,
      node2Y: 2588,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단 앞", "108계단 위", 20.4022, 20.4022, "계단위", "도보");
  //584
  graph.addEdge("원흥관 3층 야외 계단 앞", "원흥관 3층 야외 계단", 10.8812, 10.8812, "계단아래", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단", "원흥관 3층 야외 계단 앞", 20.4022, 20.4022, "계단위", "도보");
  //585
  graph.addEdge("108계단 위", "108계단 중간2", 23.2964, 23.2964, "계단아래", "도보");
  graph.addEdge("108계단 중간2", "108계단 위", 43.6807, 43.6807, "계단위", "도보");
//325
  graph.addEdge("신공 9층 입구 앞", "원흥관 신공학관 계단 통로", 57.28, 571.28, "평지", "도보",
      node2X: 949,
      node2Y: 2590,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 신공학관 계단 통로", "신공 9층 입구 앞", 57.28, 57.28, "평지", "도보");
//326
  graph.addEdge("원흥관 신공학관 계단 통로", "원흥관 5층 야외 계단", 9.05539, 9.05539, "평지", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 5층 야외 계단", "원흥관 신공학관 계단 통로", 9.05539, 9.05539, "평지", "도보");
//327
  graph.addEdge("108계단 중간1", "원흥별관 쪽문 앞", 13, 13, "계단아래", "도보",
      node2X: 825,
      node2Y: 2558,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 쪽문 앞", "108계단 중간1", 24, 24, "계단위", "도보");
//328
  graph.addEdge("원흥별관 쪽문 앞", "원흥별관 쪽문", 16, 16, "평지", "도보",
      node2X: 830,
      node2Y: 2543,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 쪽문", "원흥별관 쪽문 앞", 16, 16, "평지", "도보");
//329
  graph.addEdge("원흥별관 쪽문 앞", "108계단 아래", 55, 55, "계단아래", "도보",
      node2X: 760,
      node2Y: 2536,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 아래", "원흥별관 쪽문 앞", 103, 103, "계단위", "도보");
//330
  graph.addEdge("108계단 아래", "신공 3층 입구 앞", 17, 17, "평지", "도보",
      node2X: 753,
      node2Y: 2552,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 앞", "108계단 아래", 17, 17, "평지", "도보");
//331
  graph.addEdge("신공 3층 입구 앞", "신공 3층 입구 계단 앞", 26.4008, 26.4008, "평지", "도보",
      node2X: 742,
      node2Y: 2576,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단 앞", "신공 3층 입구 앞", 26.4008, 26.4008, "평지", "도보");
  //651
  graph.addEdge("신공 3층 입구 계단 앞", "신공 3층 입구 계단 문", 6.32456, 6.32456, "평지", "도보",
      node2X: 748,
      node2Y: 2578,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단 문", "신공 3층 입구 계단 앞", 6.32456, 6.32456, "평지", "도보");
  //652
  graph.addEdge("신공 3층 입구 계단 앞", "신공 3층 입구", 6.32456, 6.32456, "평지", "도보",
      node2X: 739,
      node2Y: 2583,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 3층 입구", "신공 3층 입구 계단 앞", 6.32456, 6.32456, "평지", "도보");
//332
  graph.addEdge("신공 3층 입구 앞", "신공 오르막", 94, 94, "내리막", "도보",
      node2X: 636,
      node2Y: 2538,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 오르막", "신공 3층 입구 앞", 177, 177, "오르막", "도보");
//333
  graph.addEdge("신공 오르막", "충무로쪽 입구", 51, 51, "내리막", "도보",
      node2X: 574,
      node2Y: 2552,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("충무로쪽 입구", "신공 오르막", 95, 95, "오르막", "도보");

  //----------------------------실내 노드------------------------------
  //정P(입구: 2층 입구, 3층 입구(3층), 3층 후문)
  //후문
  graph.addEdge("정P 3층 후문", "정보문화관p", 100000, 100000, "평지", "도보",
      node2X: 857,
      node2Y: 2058,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정보문화관p", "정P 3층 후문", 100000, 100000, "평지", "도보");
  //입구
  graph.addEdge("정P 3층 입구", "정보문화관p", 100000, 100000, "평지", "도보");
  graph.addEdge("정보문화관p", "정P 3층 입구", 100000, 100000, "평지", "도보");
  //2층 입구
  graph.addEdge("정P 2층 입구", "정보문화관p", 100000, 100000, "평지", "도보");
  graph.addEdge("정보문화관p", "정P 2층 입구", 100000, 100000, "평지", "도보");
  //352
  graph.addEdge("정P 3층 후문", "정P 3층 엘베 갈림길", 18, 18, "평지", "도보",
      node2X: 830,
      node2Y: 2156,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 엘베 갈림길", "정P 3층 후문", 18, 18, "평지", "도보");
  //353
  graph.addEdge("정P 3층 엘베 갈림길", "정P 3층 계단 앞", 9, 9, "평지", "도보",
      node2X: 821,
      node2Y: 2155,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 계단 앞", "정P 3층 엘베 갈림길", 9, 9, "평지", "도보");
  //354
  graph.addEdge("정P 3층 계단 앞", "정P 내 3층 계단", 7, 7, "평지", "도보",
      node2X: 821,
      node2Y: 2162,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 내 3층 계단", "정P 3층 계단 앞", 7, 7, "평지", "도보");
  //355
  graph.addEdge("정P 3층 계단 앞", "정P 3층 엘베 앞", 12, 12, "평지", "도보",
      node2X: 809,
      node2Y: 2156,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 엘베 앞", "정P 3층 계단 앞", 12, 12, "평지", "도보");
  //356
  graph.addEdge("정P 3층 엘베 앞", "정P 3층 엘베", 6, 6, "평지", "도보",
      node2X: 810,
      node2Y: 2162,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 엘베", "정P 3층 엘베 앞", 6, 6, "평지", "도보");
  //357
  graph.addEdge("정P 3층 엘베 갈림길", "정P 3층 정문 갈림길", 150, 150, "평지", "도보",
      node2X: 816,
      node2Y: 2006,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 정문 갈림길", "정P 3층 엘베 갈림길", 150, 150, "평지", "도보");
  //358
  graph.addEdge("정P 3층 정문 갈림길", "정P 3층 입구", 41, 41, "평지", "도보");
  graph.addEdge("정P 3층 입구", "정P 3층 정문 갈림길", 41, 41, "평지", "도보");

  //정P 내 계단 2층 - 3층 이동
  graph.addEdge("정P 내 3층 계단", "정P 내 2층 계단", 30, 30, "계단아래", "도보",
      node2X: 821,
      node2Y: 2162,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 내 2층 계단", "정P 내 3층 계단", 16, 16, "계단위", "도보");
  //정P 엘베 2층 - 3층 이동
  graph.addEdge("정P 3층 엘베", "정P 2층 엘베", 30, 0, "엘베", "도보",
      node2X: 810,
      node2Y: 2162,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 엘베", "정P 3층 엘베", 30, 0, "엘베", "도보");
  //361
  graph.addEdge("정P 2층 엘베", "정P 2층 엘베 앞", 6, 6, "평지", "도보",
      node2X: 809,
      node2Y: 2156,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 엘베 앞", "정P 2층 엘베", 6, 6, "평지", "도보");
  //362
  graph.addEdge("정P 2층 엘베 앞", "정P 내 2층 계단 앞", 12, 12, "평지", "도보",
      node2X: 821,
      node2Y: 2155,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 내 2층 계단 앞", "정P 2층 엘베 앞", 12, 12, "평지", "도보");
  //363
  graph.addEdge("정P 내 2층 계단 앞", "정P 내 2층 계단", 7, 7, "평지", "도보");
  graph.addEdge("정P 내 2층 계단", "정P 내 2층 계단 앞", 7, 7, "평지", "도보");
  //364
  graph.addEdge("정P 내 2층 계단 앞", "정P 2층 엘베 갈림길", 9, 9, "평지", "도보",
      node2X: 830,
      node2Y: 2156,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 엘베 갈림길", "정P 내 2층 계단 앞", 9, 9, "평지", "도보");
  //365
  graph.addEdge("정P 2층 엘베 갈림길", "정P 2층 정문 갈림길", 150, 150, "평지", "도보",
      node2X: 816,
      node2Y: 2006,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 정문 갈림길", "정P 2층 엘베 갈림길", 150, 150, "평지", "도보");
  //366
  graph.addEdge("정P 2층 정문 갈림길", "정P 2층 입구", 28, 28, "평지", "도보");
  graph.addEdge("정P 2층 입구", "정P 2층 정문 갈림길", 28, 28, "평지", "도보");

  //정P 밖 계단 2층 - 3층 이동
  graph.addEdge("정P 밖 2층 계단", "정P 밖 3층 계단", 150, 150, "계단위", "도보");
  graph.addEdge("정P 밖 3층 계단", "정P 밖 2층 계단", 80, 80, "계단아래", "도보");
  //**************************************************************************
  //신공학관
  //입구: 1층 입구, 1층 옆문, 3층 입구, 7층 입구, 9층 입구)
  //334
  graph.addEdge("충무로쪽 입구", "남산학사 계단 위", 31, 31, "평지", "도보",
      node2X: 593,
      node2Y: 2576,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 계단 위", "충무로쪽 입구", 31, 31, "평지", "도보");
//335
  graph.addEdge("남산학사 계단 위", "남산학사 계단 아래", 16, 16, "계단아래", "도보",
      node2X: 598,
      node2Y: 2595,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 계단 아래", "남산학사 계단 위", 29, 29, "계단위", "도보");
//336
  graph.addEdge("남산학사 계단 아래", "남산학사 식당 앞2", 31, 31, "평지", "도보",
      node2X: 614,
      node2Y: 2622,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 식당 앞2", "남산학사 계단 아래", 31, 31, "평지", "도보");
//337
  graph.addEdge("남산학사 식당 앞2", "남산학사 식당 앞", 45, 45, "평지", "도보",
      node2X: 657,
      node2Y: 2636,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 식당 앞", "남산학사 식당 앞2", 45, 45, "평지", "도보");
//338
  graph.addEdge("남산학사 식당 앞", "남산학사 식당 입구", 56, 56, "평지", "도보",
      node2X: 618,
      node2Y: 2676,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 식당 입구", "남산학사 식당 앞", 56, 56, "평지", "도보");
//339
  graph.addEdge("남산학사 식당 앞", "남산학사 입구 앞", 19, 19, "평지", "도보",
      node2X: 675,
      node2Y: 2641,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 입구 앞", "남산학사 식당 앞", 19, 19, "평지", "도보");
//340
  graph.addEdge("남산학사 입구 앞", "남산학사 카페 입구", 74, 74, "평지", "도보",
      node2X: 655,
      node2Y: 2712,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 카페 입구", "남산학사 입구 앞", 74, 74, "평지", "도보");
//341
  graph.addEdge("남산학사 입구 앞", "남산학사 입구", 18, 18, "평지", "도보",
      node2X: 681,
      node2Y: 2624,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 입구", "남산학사 입구 앞", 18, 18, "평지", "도보");
//342
  graph.addEdge("남산학사 입구 앞", "남산학사 편의점 앞", 20, 20, "평지", "도보",
      node2X: 694,
      node2Y: 2648,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 편의점 앞", "남산학사 입구 앞", 20, 20, "평지", "도보");
//343
  graph.addEdge("남산학사 편의점 앞", "남산학사 편의점 입구", 72, 72, "평지", "도보",
      node2X: 671,
      node2Y: 2716,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 편의점 입구", "남산학사 편의점 앞", 72, 72, "평지", "도보");
//344
  graph.addEdge("남산학사 편의점 앞", "신공 1층 입구 갈림길", 17, 17, "평지", "도보",
      node2X: 710,
      node2Y: 2653,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 입구 갈림길", "남산학사 편의점 앞", 17, 17, "평지", "도보");
//347
  graph.addEdge("신공 1층 입구 갈림길", "신공 1층 옆문", 72, 72, "평지", "도보",
      node2X: 688,
      node2Y: 2722,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 옆문", "신공 1층 입구 갈림길", 72, 72, "평지", "도보");
//348
  graph.addEdge("신공 1층 입구 갈림길", "신공 1층 입구", 91, 91, "평지", "도보",
      node2X: 797,
      node2Y: 2681,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 입구", "신공 1층 입구 갈림길", 91, 91, "평지", "도보");
  //370
  graph.addEdge("신공 1층 옆문", "신공 1층 옆문 앞", 48, 48, "평지", "도보",
      node2X: 673,
      node2Y: 2768,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 옆문 앞", "신공 1층 옆문", 48, 48, "평지", "도보");
  //371
  graph.addEdge("신공 1층 옆문 앞", "신공 1층 뒷계단 앞1", 26, 26, "평지", "도보",
      node2X: 697,
      node2Y: 2777,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단 앞1", "신공 1층 옆문 앞", 26, 26, "평지", "도보");
  //372
  graph.addEdge("신공 1층 뒷계단 앞1", "신공 1층 뒷계단 앞2", 10, 10, "평지", "도보",
      node2X: 707,
      node2Y: 2780,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단 앞2", "신공 1층 뒷계단 앞1", 10, 10, "평지", "도보");
  //373
  graph.addEdge("신공 1층 뒷계단 앞2", "신공 1층 뒷계단 앞3", 16, 16, "평지", "도보",
      node2X: 712,
      node2Y: 2765,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단 앞3", "신공 1층 뒷계단 앞2", 16, 16, "평지", "도보");
  //374
  graph.addEdge("신공 1층 뒷계단 앞1", "신공 1층 뒷엘베 앞", 16, 16, "평지", "도보",
      node2X: 701,
      node2Y: 2762,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷엘베 앞", "신공 1층 뒷계단 앞1", 16, 16, "평지", "도보");
  //375
  graph.addEdge("신공 1층 뒷엘베 앞", "신공 1층 뒷계단", 6, 6, "평지", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단", "신공 1층 뒷엘베 앞", 6, 6, "평지", "도보");
  //신공 뒷계단 1층 - 3층 이동
  graph.addEdge("신공 1층 뒷계단", "신공 3층 뒷계단", 60, 60, "계단위", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒷계단", "신공 1층 뒷계단", 32, 32, "계단아래", "도보");
  //신공 뒷계단 3층 - 7층 이동
  graph.addEdge("신공 3층 뒷계단", "신공 7층 뒷계단", 120, 120, "계단위", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒷계단", "신공 3층 뒷계단", 64, 64, "계단아래", "도보");
  //신공 뒷계단 7층 - 9층 이동
  graph.addEdge("신공 7층 뒷계단", "신공 9층 뒷계단", 60, 60, "계단위", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒷계단", "신공 7층 뒷계단", 32, 32, "계단아래", "도보");
  //376
  graph.addEdge("신공 1층 뒷엘베 앞", "신공 1층 뒷엘베", 5, 5, "평지", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷엘베", "신공 1층 뒷엘베 앞", 5, 5, "평지", "도보");
  //신공 뒷엘베 1층 - 3층 이동
  graph.addEdge("신공 1층 뒷엘베", "신공 3층 뒷엘베", 60, 0, "엘베", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒷엘베", "신공 1층 뒷엘베", 60, 0, "엘베", "도보");
  //신공 뒷엘베 3층 - 7층 이동
  graph.addEdge("신공 3층 뒷엘베", "신공 7층 뒷엘베", 120, 0, "엘베", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒷엘베", "신공 3층 뒷엘베", 120, 0, "엘베", "도보");
  //신공 뒷엘베 7층 - 9층 이동
  graph.addEdge("신공 7층 뒷엘베", "신공 9층 뒷엘베", 120, 0, "엘베", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒷엘베", "신공 7층 뒷엘베", 120, 0, "엘베", "도보");
  //377
  graph.addEdge("신공 1층 뒷엘베 앞", "신공 1층 뒷계단 앞3", 12, 12, "평지", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단 앞3", "신공 1층 뒷엘베 앞", 12, 12, "평지", "도보");
  //378
  graph.addEdge("신공 1층 뒷계단 앞3", "신공 1층 뒷계단 앞4", 12, 12, "평지", "도보",
      node2X: 716,
      node2Y: 2754,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단 앞4", "신공 1층 뒷계단 앞3", 12, 12, "평지", "도보");
  //379
  graph.addEdge("신공 1층 뒷계단 앞4", "신공 1층 뒤편1", 72, 72, "평지", "도보",
      node2X: 783,
      node2Y: 2779,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒤편1", "신공 1층 뒷계단 앞4", 72, 72, "평지", "도보");
  //380
  graph.addEdge("신공 1층 뒤편1", "신공 1층 뒤편2", 35, 35, "평지", "도보",
      node2X: 816,
      node2Y: 2792,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒤편2", "신공 1층 뒤편1", 35, 35, "평지", "도보");
  //395
  graph.addEdge("신공 1층 뒤편2", "신공 1층 뒤편3", 13, 13, "평지", "도보",
      node2X: 827,
      node2Y: 2786,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒤편3", "신공 1층 뒤편2", 13, 13, "평지", "도보");
  //381
  graph.addEdge("신공 1층 뒤편3", "신공 1층 화장실 오른쪽", 51, 51, "평지", "도보",
      node2X: 843,
      node2Y: 2738,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 화장실 오른쪽", "신공 1층 뒤편3", 51, 51, "평지", "도보");
  //382
  graph.addEdge("신공 1층 뒤편1", "신공 1층 화장실 왼쪽", 59, 59, "평지", "도보",
      node2X: 804,
      node2Y: 2724,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 화장실 왼쪽", "신공 1층 뒤편1", 59, 59, "평지", "도보");
  //383
  graph.addEdge("신공 1층 화장실 왼쪽", "신공 1층 화장실 오른쪽", 41, 41, "평지", "도보");
  graph.addEdge("신공 1층 화장실 오른쪽", "신공 1층 화장실 왼쪽", 41, 41, "평지", "도보");
  //384
  graph.addEdge("신공 1층 화장실 왼쪽", "신공 1층 입구 앞", 39, 39, "평지", "도보",
      node2X: 817,
      node2Y: 2687,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 입구 앞", "신공 1층 화장실 왼쪽", 39, 39, "평지", "도보");
  //385
  graph.addEdge("신공 1층 입구 앞", "신공 1층 입구", 21, 21, "평지", "도보");
  graph.addEdge("신공 1층 입구", "신공 1층 입구 앞", 21, 21, "평지", "도보");
  //386
  graph.addEdge("신공 1층 입구 앞", "신공 1층 왼쪽 위", 61, 61, "평지", "도보",
      node2X: 840,
      node2Y: 2630,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 왼쪽 위", "신공 1층 입구 앞", 61, 61, "평지", "도보");
  //387
  graph.addEdge("신공 1층 왼쪽 위", "신공 1층 9층 엘베 앞", 12, 12, "평지", "도보",
      node2X: 851,
      node2Y: 2634,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 9층 엘베 앞", "신공 1층 왼쪽 위", 12, 12, "평지", "도보");
  //388
  graph.addEdge("신공 1층 9층 엘베 앞", "신공 1층 9층 엘베", 12, 12, "평지", "도보",
      node2X: 847,
      node2Y: 2645,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 9층 엘베", "신공 1층 9층 엘베 앞", 12, 12, "평지", "도보");
  //신공 9층 엘베 1층 - 9층 이동
  graph.addEdge("신공 1층 9층 엘베", "신공 9층 9층 엘베", 180, 0, "엘베", "도보",
      node2X: 847,
      node2Y: 2645,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 9층 엘베", "신공 1층 9층 엘베", 180, 0, "엘베", "도보");
  //389
  graph.addEdge("신공 1층 9층 엘베 앞", "신공 1층 전층 엘베 앞", 19, 19, "평지", "도보",
      node2X: 865,
      node2Y: 2639,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 전층 엘베 앞", "신공 1층 9층 엘베 앞", 19, 19, "평지", "도보");
  //390
  graph.addEdge("신공 1층 전층 엘베 앞", "신공 1층 전층 엘베", 12, 12, "평지", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 전층 엘베", "신공 1층 전층 엘베 앞", 12, 12, "평지", "도보");
  //신공 전층 엘베 1층 - 3층
  graph.addEdge("신공 1층 전층 엘베", "신공 3층 전층 엘베", 60, 0, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 전층 엘베", "신공 1층 전층 엘베", 60, 0, "엘베", "도보");
  //신공 전층 엘베 3층 - 7층
  graph.addEdge("신공 3층 전층 엘베", "신공 7층 전층 엘베", 120, 0, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 전층 엘베", "신공 3층 전층 엘베", 120, 0, "엘베", "도보");
  //신공 전층 엘베 7층 - 9층
  graph.addEdge("신공 7층 전층 엘베", "신공 9층 전층 엘베", 60, 0, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 전층 엘베", "신공 7층 전층 엘베", 60, 0, "엘베", "도보");
  //391
  graph.addEdge("신공 1층 전층 엘베 앞", "신공 1층 오른쪽 위", 11, 11, "평지", "도보",
      node2X: 875,
      node2Y: 2643,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 오른쪽 위", "신공 1층 전층 엘베 앞", 11, 11, "평지", "도보");
  //392
  graph.addEdge("신공 1층 오른쪽 위", "신공 1층 계단 앞", 34, 34, "평지", "도보",
      node2X: 864,
      node2Y: 2675,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 계단 앞", "신공 1층 오른쪽 위", 34, 34, "평지", "도보");
  //393
  graph.addEdge("신공 1층 계단 앞", "신공 1층 계단", 5, 5, "평지", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 계단", "신공 1층 계단 앞", 5, 5, "평지", "도보");
  //신공 계단 1층 - 3층 이동
  graph.addEdge("신공 1층 계단", "신공 3층 계단", 60, 60, "계단위", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 계단", "신공 1층 계단", 32, 32, "계단아래", "도보");
  //신공 계단 3층 - 7층 이동
  graph.addEdge("신공 3층 계단", "신공 7층 계단", 120, 120, "계단위", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 계단", "신공 3층 계단", 64, 64, "계단아래", "도보");
  //신공 계단 7층 - 9층 이동
  graph.addEdge("신공 7층 계단", "신공 9층 계단", 60, 60, "계단위", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 계단", "신공 7층 계단", 32, 32, "계단아래", "도보");
  //394
  graph.addEdge("신공 1층 계단 앞", "신공 1층 화장실 오른쪽", 66, 66, "평지", "도보");
  graph.addEdge("신공 1층 화장실 오른쪽", "신공 1층 계단 앞", 66, 66, "평지", "도보");
  //653
  graph.addEdge("신공 3층 입구", "신공 3층 입구 안", 5.38516, 5.38516, "평지", "도보",
      node2X: 737,
      node2Y: 2588,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 안", "신공 3층 입구", 5.38516, 5.38516, "평지", "도보");
  //657
  graph.addEdge("신공 3층 입구 계단 문", "신공 3층 입구 계단", 6.7082, 6.7082, "평지", "도보",
      node2X: 754,
      node2Y: 2581,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단", "신공 3층 입구 계단 문", 6.7082, 6.7082, "평지", "도보");
  //675
  graph.addEdge("신공 3층 입구 계단", "신공 3층 입구 계단 안쪽 문", 5.09902, 5.09902, "평지", "도보",
      node2X: 753,
      node2Y: 2586,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단 안쪽 문", "신공 3층 입구 계단", 5.09902, 5.09902, "평지", "도보");
  //656
  graph.addEdge("신공 3층 입구 안", "신공 3층 입구 계단 안쪽 문 앞", 16.1245, 16.1245, "평지", "도보",
      node2X: 753,
      node2Y: 2586,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단 안쪽 문 앞", "신공 3층 입구 안", 16.1245, 16.1245, "평지", "도보");
  //654
  graph.addEdge("신공 3층 입구 계단 안쪽 문 앞", "신공 3층 왼쪽 위", 95.2733, 95.2733, "평지", "도보",
      node2X: 839,
      node2Y: 2627,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 왼쪽 위", "신공 3층 입구 계단 안쪽 문 앞", 95.2733, 95.2733, "평지", "도보");
  //655
  graph.addEdge("신공 3층 왼쪽 위", "신공 3층 전층 엘베 앞", 26.5707, 26.5707, "평지", "도보",
      node2X: 864,
      node2Y: 2636,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 전층 엘베 앞", "신공 3층 왼쪽 위", 26.5707, 26.5707, "평지", "도보");
  //658
  graph.addEdge("신공 3층 전층 엘베 앞", "신공 3층 전층 엘베", 14.3178, 14.3178, "평지", "도보",
      node2X: 851,
      node2Y: 2631,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 전층 엘베", "신공 3층 전층 엘베 앞", 14.3178, 14.3178, "평지", "도보");
  //659
  graph.addEdge("신공 3층 전층 엘베 앞", "신공 3층 오른쪽 위", 13, 13, "평지", "도보",
      node2X: 876,
      node2Y: 2641,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 오른쪽 위", "신공 3층 전층 엘베 앞", 13, 13, "평지", "도보");
  //660
  graph.addEdge("신공 3층 오른쪽 위", "신공 3층 화장실 오른쪽", 102.786, 102.786, "평지", "도보",
      node2X: 842,
      node2Y: 2738,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 화장실 오른쪽", "신공 3층 오른쪽 위", 102.786, 102.786, "평지", "도보");
  //661
  graph.addEdge("신공 3층 화장실 오른쪽", "신공 3층 화장실 왼쪽", 40.8534, 40.8534, "평지", "도보",
      node2X: 842,
      node2Y: 2738,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 화장실 왼쪽", "신공 3층 화장실 오른쪽", 40.8534, 40.8534, "평지", "도보");
  //662
  graph.addEdge("신공 3층 화장실 오른쪽", "신공 3층 뒤편3", 50.9215, 50.9215, "평지", "도보",
      node2X: 825,
      node2Y: 2786,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편3", "신공 3층 화장실 오른쪽", 50.9215, 50.9215, "평지", "도보");
  //663
  graph.addEdge("신공 3층 뒤편3", "신공 3층 뒤편2", 11.1803, 11.1803, "평지", "도보",
      node2X: 815,
      node2Y: 2791,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편2", "신공 3층 뒤편3", 11.1803, 11.1803, "평지", "도보");
  //664
  graph.addEdge("신공 3층 뒤편2", "신공 3층 뒤편1", 33.2415, 33.2415, "평지", "도보",
      node2X: 784,
      node2Y: 2779,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편1", "신공 3층 뒤편2", 33.2415, 33.2415, "평지", "도보");
  //665
  graph.addEdge("신공 3층 왼쪽 위", "신공 3층 화장실 왼쪽", 111.041, 111.041, "평지", "도보");
  graph.addEdge("신공 3층 화장실 왼쪽", "신공 3층 왼쪽 위", 111.041, 111.041, "평지", "도보");
  //666
  graph.addEdge("신공 3층 뒤편1", "신공 3층 화장실 왼쪽", 71.0282, 71.0282, "평지", "도보");
  graph.addEdge("신공 3층 화장실 왼쪽", "신공 3층 뒤편1", 71.0282, 71.0282, "평지", "도보");
  //667
  graph.addEdge("신공 3층 뒤편1", "신공 3층 뒤편4", 27.313, 27.313, "평지", "도보",
      node2X: 773,
      node2Y: 2804,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편4", "신공 3층 뒤편1", 27.313, 27.313, "평지", "도보");
  //668
  graph.addEdge("신공 3층 뒤편4", "신공 3층 뒷엘베 앞", 82.28, 82.28, "평지", "도보",
      node2X: 696,
      node2Y: 2775,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒷엘베 앞", "신공 3층 뒤편4", 82.28, 82.28, "평지", "도보");
  //669
  graph.addEdge("신공 3층 뒷엘베 앞", "신공 3층 뒷계단 앞", 12.6491, 12.6491, "평지", "도보",
      node2X: 700,
      node2Y: 2763,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒷계단 앞", "신공 3층 뒷엘베 앞", 12.6491, 12.6491, "평지", "도보");
  //670
  graph.addEdge("신공 3층 뒷계단 앞", "신공 3층 뒷엘베", 6.7082, 6.7082, "평지", "도보");
  graph.addEdge("신공 3층 뒷엘베", "신공 3층 뒷계단 앞", 6.7082, 6.7082, "평지", "도보");
  //671
  graph.addEdge("신공 3층 뒷계단 앞", "신공 3층 뒷계단", 5.38516, 5.38516, "평지", "도보");
  graph.addEdge("신공 3층 뒷계단", "신공 3층 뒷계단 앞", 5.38516, 5.38516, "평지", "도보");
  //672
  graph.addEdge("신공 3층 뒷엘베 앞", "신공 3층 뒤편5", 24.6982, 24.6982, "평지", "도보",
      node2X: 673,
      node2Y: 2766,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편5", "신공 3층 뒷엘베 앞", 24.6982, 24.6982, "평지", "도보");
  //673
  graph.addEdge("신공 3층 입구 안", "신공 3층 뒤편5", 189.156, 189.156, "평지", "도보");
  graph.addEdge("신공 3층 뒤편5", "신공 3층 입구 안", 189.156, 189.156, "평지", "도보");













//1층 입구
  graph.addEdge("신공 1층 입구", "신공학관", 100000, 100000, "평지", "도보",
      node2X: 714,
      node2Y: 2657,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공학관", "신공 1층 입구", 100000, 100000, "평지", "도보");
//1층 옆문
  graph.addEdge("신공 1층 옆문", "신공학관", 100000, 100000, "평지", "도보");
  graph.addEdge("신공학관", "신공 1층 옆문", 100000, 100000, "평지", "도보");
//9층 입구
  graph.addEdge("신공 9층 입구", "신공학관", 100000, 100000, "평지", "도보");
  graph.addEdge("신공학관", "신공 9층 입구", 100000, 100000, "평지", "도보");
//7층 입구
  graph.addEdge("신공 7층 입구", "신공학관", 100000, 100000, "평지", "도보");
  graph.addEdge("신공학관", "신공 7층 입구", 100000, 100000, "평지", "도보");
//3층 입구
  graph.addEdge("신공 3층 입구", "신공학관", 100000, 100000, "평지", "도보");
  graph.addEdge("신공학관", "신공 3층 입구", 100000, 100000, "평지", "도보");

  //신공학관 각층 출입구만 임시로 찍은 노드들
  //신공 9층 계단 - 신공 9층 입구
  graph.addEdge("신공 9층 계단", "신공 9층 입구", 57, 57, "평지", "도보");
  graph.addEdge("신공 9층 입구", "신공 9층 계단", 57, 57, "평지", "도보");
  //신공 9층 9층 엘베 - 신공 9층 입구
  graph.addEdge("신공 9층 9층 엘베", "신공 9층 입구", 54, 54, "평지", "도보");
  graph.addEdge("신공 9층 입구", "신공 9층 9층 엘베", 54, 54, "평지", "도보");
  //신공 9층 전층 엘베 - 신공 9층 입구
  graph.addEdge("신공 9층 9층 엘베", "신공 9층 입구", 42, 42, "평지", "도보");
  graph.addEdge("신공 9층 입구", "신공 9층 9층 엘베", 42, 42, "평지", "도보");
  //신공 9층 전층 엘베 - 신공 9층 입구
  graph.addEdge("신공 9층 9층 엘베", "신공 9층 입구", 42, 42, "평지", "도보");
  graph.addEdge("신공 9층 입구", "신공 9층 9층 엘베", 42, 42, "평지", "도보");
  //**************************************************************************
  //법학관_만해관(입구: 만해관 입구, 만해관 옆입구, 만해관 2층 입구, 법학관 1층 입구)
  //359
  graph.addEdge("법학관 1층 입구", "법학관 1층 입구 안", 52, 52, "평지", "도보",
      node2X: 1646,
      node2Y: 2715,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("법학관 1층 입구 안", "법학관 1층 입구", 52, 52, "평지", "도보");
  //360
  graph.addEdge("법학관 1층 입구 안", "법학관 1층 만해관 앞", 137, 137, "평지", "도보",
      node2X: 1607,
      node2Y: 2846,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("법학관 1층 만해관 앞", "법학관 1층 입구 안", 137, 137, "평지", "도보");
  //367
  graph.addEdge("법학관 1층 만해관 앞", "만해관 입구 안", 20, 20, "평지", "도보",
      node2X: 1626,
      node2Y: 2852,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("만해관 입구 안", "법학관 1층 만해관 앞", 20, 20, "평지", "도보");
  //395
  graph.addEdge("만해관 입구 안", "만해관 입구", 8, 8, "평지", "도보");
  graph.addEdge("만해관 입구", "만해관 입구 안", 8, 8, "평지", "도보");
  //396
  graph.addEdge("만해관 입구 안", "만해관 2층 입구 안", 47, 47, "평지", "도보",
      node2X: 1671,
      node2Y: 2866,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("만해관 2층 입구 안", "만해관 입구 안", 47, 47, "평지", "도보");
  //397
  graph.addEdge("만해관 2층 입구 안", "만해관 2층 입구", 31, 31, "평지", "도보");
  graph.addEdge("만해관 2층 입구", "만해관 2층 입구 안", 31, 31, "평지", "도보");
  //398
  graph.addEdge("만해관 2층 입구 안", "만해관 옆입구", 196, 196, "평지", "도보");
  graph.addEdge("만해관 옆입구", "만해관 2층 입구 안", 196, 196, "평지", "도보");

  //만해관 입구
  graph.addEdge("만해관 입구", "법학관_만해관", 100000, 100000, "평지", "도보",
      node2X: 1672,
      node2Y: 2801,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관_만해관", "만해관 입구", 100000, 100000, "평지", "도보");
  //만해관 옆입구
  graph.addEdge("만해관 옆입구", "법학관_만해관", 100000, 100000, "평지", "도보");
  graph.addEdge("법학관_만해관", "만해관 옆입구", 100000, 100000, "평지", "도보");
  //만해관 2층 입구
  graph.addEdge("만해관 2층 입구", "법학관_만해관", 100000, 100000, "평지", "도보");
  graph.addEdge("법학관_만해관", "만해관 2층 입구", 100000, 100000, "평지", "도보");
  //법학관 1층 입구
  graph.addEdge("법학관 1층 입구", "법학관_만해관", 100000, 100000, "평지", "도보");
  graph.addEdge("법학관_만해관", "법학관 1층 입구", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //학림관(입구: 편의점 입구, 입구, 우측 앞문, 오른쪽 뒷문, 뒷문, 왼쪽 뒷문, 좌측 앞문)
  //399
  graph.addEdge("학림관 좌측 앞문", "학림관 1층 엘베 앞", 36, 36, "평지", "도보",
      node2X: 1179,
      node2Y: 1724,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 1층 엘베 앞", "학림관 좌측 앞문", 36, 36, "평지", "도보");
  //400
  graph.addEdge("학림관 1층 엘베 앞", "학림관 1층 엘베", 7, 7, "평지", "도보",
      node2X: 1181,
      node2Y: 1717,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 1층 엘베", "학림관 1층 엘베 앞", 7, 7, "평지", "도보");
  //401
  graph.addEdge("학림관 1층 엘베 앞", "학림관 입구 안", 93, 93, "평지", "도보",
      node2X: 1268,
      node2Y: 1751,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 입구 안", "학림관 1층 엘베 앞", 93, 93, "평지", "도보");
  //402
  graph.addEdge("학림관 입구 안", "학림관 뒷문", 28, 28, "평지", "도보");
  graph.addEdge("학림관 뒷문", "학림관 입구 안", 28, 28, "평지", "도보");
  //403
  graph.addEdge("학림관 입구 안", "학림관 입구", 38, 38, "평지", "도보");
  graph.addEdge("학림관 입구", "학림관 입구 안", 38, 38, "평지", "도보");
  //404
  graph.addEdge("학림관 입구 안", "학림관 우측 앞문 앞", 101, 101, "평지", "도보",
      node2X: 1365,
      node2Y: 1780,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 우측 앞문 앞", "학림관 입구 안", 101, 101, "평지", "도보");
  //405
  graph.addEdge("학림관 우측 앞문 앞", "학림관 우측 앞문", 38, 38, "평지", "도보");
  graph.addEdge("학림관 우측 앞문", "학림관 우측 앞문 앞", 38, 38, "평지", "도보");
  //406
  graph.addEdge("학림관 우측 앞문 앞", "학림관 오른쪽 뒷문", 14, 14, "평지", "도보");
  graph.addEdge("학림관 오른쪽 뒷문", "학림관 우측 앞문 앞", 14, 14, "평지", "도보");
  //407
  graph.addEdge("학림관 우측 앞문 앞", "학림관 중앙 계단 앞", 17, 17, "평지", "도보",
      node2X: 1381,
      node2Y: 1786,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 중앙 계단 앞", "학림관 우측 앞문 앞", 17, 17, "평지", "도보");
  //408
  graph.addEdge("학림관 중앙 계단 앞", "학림관 중앙 계단", 7, 7, "평지", "도보",
      node2X: 1378,
      node2Y: 1792,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 중앙 계단", "학림관 중앙 계단 앞", 7, 7, "평지", "도보");
  //409
  graph.addEdge("학림관 중앙 계단 앞", "학림관 우측 계단 앞", 73, 73, "평지", "도보",
      node2X: 1451,
      node2Y: 1807,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 우측 계단 앞", "학림관 중앙 계단 앞", 73, 73, "평지", "도보");
  //410
  graph.addEdge("학림관 우측 계단 앞", "학림관 우측 계단", 6, 6, "평지", "도보",
      node2X: 1449,
      node2Y: 1813,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 우측 계단", "학림관 우측 계단 앞", 6, 6, "평지", "도보");
  //411
  graph.addEdge("학림관 편의점 입구", "학림관 편의점 입구 안", 6.082, 6.082, "평지", "도보",
      node2X: 1096,
      node2Y: 1722,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 편의점 입구 안", "학림관 편의점 입구", 6.082, 6.082, "평지", "도보");
  //412
  graph.addEdge("학림관 편의점 입구 안", "학림관 B1 왼쪽 끝", 21.587, 21.587, "평지", "도보",
      node2X: 1101,
      node2Y: 1701,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 B1 왼쪽 끝", "학림관 편의점 입구 안", 21.587, 21.587, "평지", "도보");
  //413
  graph.addEdge("학림관 B1 왼쪽 끝", "학림관 B1 엘베 앞", 81, 81, "평지", "도보",
      node2X: 1179,
      node2Y: 1723,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 B1 엘베 앞", "학림관 B1 왼쪽 끝", 81, 81, "평지", "도보");
  //414
  graph.addEdge("학림관 B1 엘베 앞", "학림관 B1 엘베", 6, 6, "평지", "도보",
      node2X: 1181,
      node2Y: 1717,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 B1 엘베", "학림관 B1 엘베 앞", 6, 6, "평지", "도보");
  //학림관 B1 - 1F 엘베 이동
  graph.addEdge("학림관 B1 엘베", "학림관 1층 엘베", 30, 0, "엘베", "도보");
  graph.addEdge("학림관 1층 엘베", "학림관 B1 엘베", 30, 0, "엘베", "도보");
  //415
  graph.addEdge("학림관 B1 엘베 앞", "학림관 왼쪽 뒷문 안", 14, 14, "계단아래", "도보",
      node2X: 1195,
      node2Y: 1729,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 왼쪽 뒷문 안", "학림관 B1 엘베 앞", 26, 26, "계단위", "도보");
  //416
  graph.addEdge("학림관 왼쪽 뒷문 안", "학림관 왼쪽 뒷문", 7, 7, "평지", "도보");
  graph.addEdge("학림관 왼쪽 뒷문", "학림관 왼쪽 뒷문 안", 7, 7, "평지", "도보");
  //편의점 입구
  graph.addEdge("학림관 편의점 입구", "학림관", 100000, 100000, "평지", "도보",
      node2X: 1265,
      node2Y: 1758,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  //입구
  graph.addEdge("학림관 입구", "학림관", 100000, 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 입구", 100000, 100000, "평지", "도보");
  //우측 앞문
  graph.addEdge("학림관 우측 앞문", "학림관", 100000, 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 우측 앞문", 100000, 100000, "평지", "도보");
  //오른쪽 뒷문
  graph.addEdge("학림관 오른쪽 뒷문", "학림관", 100000, 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 오른쪽 뒷문", 100000, 100000, "평지", "도보");
  //뒷문
  graph.addEdge("학림관 뒷문", "학림관", 100000, 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 뒷문", 100000, 100000, "평지", "도보");
  //좌측 앞문
  graph.addEdge("학림관 좌측 앞문", "학림관", 100000, 100000, "평지", "도보");
  graph.addEdge("학림관", "학림관 좌측 앞문", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //과학관(입구: 좌측 입구, 정문, 우측 입구)
  //417
  graph.addEdge("과학관 좌측 입구", "과학관 정문 안", 139, 139, "평지", "도보",
      node2X: 1295,
      node2Y: 3076,
      isInside2: 1,
      building2: "과학관",
      showRoute2: false);
  graph.addEdge("과학관 정문 안", "과학관 좌측 입구", 139, 139, "평지", "도보");
  //418
  graph.addEdge("과학관 정문 안", "과학관 정문", 33, 33, "평지", "도보");
  graph.addEdge("과학관 정문", "과학관 정문 안", 33, 33, "평지", "도보");
  //419
  graph.addEdge("과학관 정문 안", "과학관 우측 입구", 133, 133, "평지", "도보");
  graph.addEdge("과학관 우측 입구", "과학관 정문 안", 133, 133, "평지", "도보");
  //과학관 좌측 입구
  graph.addEdge("과학관 좌측 입구", "과학관", 100000, 100000, "평지", "도보",
      node2X: 1250,
      node2Y: 3070,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관", "과학관 좌측 입구", 100000, 100000, "평지", "도보");
  //과학관 정문
  graph.addEdge("과학관 정문", "과학관", 100000, 100000, "평지", "도보");
  graph.addEdge("과학관", "과학관 정문", 100000, 100000, "평지", "도보");
  //과학관 우측 입구
  graph.addEdge("과학관 우측 입구", "과학관", 100000, 100000, "평지", "도보");
  graph.addEdge("과학관", "과학관 우측 입구", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //혜화관(입구: 입구, 4층 입구)
  //420
  graph.addEdge("혜화관 4층 입구", "혜화관 4층 입구 안", 62, 62, "평지", "도보",
      node2X: 1963,
      node2Y: 2946,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 입구 안", "혜화관 4층 입구", 62, 62, "평지", "도보");
  //421
  graph.addEdge("혜화관 4층 입구 안", "혜화관 4층 엘베 앞", 11, 11, "평지", "도보",
      node2X: 1960,
      node2Y: 2957,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 엘베 앞", "혜화관 4층 입구 안", 11, 11, "평지", "도보");
  //422
  graph.addEdge("혜화관 4층 엘베 앞", "혜화관 4층 엘베", 8, 8, "평지", "도보",
      node2X: 1952,
      node2Y: 2955,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 엘베", "혜화관 4층 엘베 앞", 8, 8, "평지", "도보");
  //423
  graph.addEdge("혜화관 4층 엘베 앞", "혜화관 4층 계단 옆", 27, 27, "평지", "도보",
      node2X: 1987,
      node2Y: 2953,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 옆", "혜화관 4층 엘베 앞", 27, 27, "평지", "도보");
  //424
  graph.addEdge("혜화관 4층 입구 안", "혜화관 4층 계단 옆", 25, 25, "평지", "도보");
  graph.addEdge("혜화관 4층 계단 옆", "혜화관 4층 입구 안", 25, 25, "평지", "도보");
  //425
  graph.addEdge("혜화관 4층 계단 옆", "혜화관 4층 계단 앞", 12, 12, "평지", "도보",
      node2X: 1990,
      node2Y: 2941,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 앞", "혜화관 4층 계단 옆", 12, 12, "평지", "도보");
  //426
  graph.addEdge("혜화관 4층 계단 앞", "혜화관 4층 계단", 14, 14, "평지", "도보",
      node2X: 1977,
      node2Y: 2936,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단", "혜화관 4층 계단 앞", 14, 14, "평지", "도보");
  //427
  graph.addEdge("혜화관 4층 계단", "혜화관 4층 계단 중간1", 19, 19, "계단아래", "도보",
      node2X: 1954,
      node2Y: 2928,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 중간1", "혜화관 4층 계단", 37, 37, "계단위", "도보");
  //428
  graph.addEdge("혜화관 4층 계단 중간1", "혜화관 4층 계단 중간2", 15, 15, "평지", "도보",
      node2X: 1959,
      node2Y: 2914,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 중간2", "혜화관 4층 계단 중간1", 15, 15, "평지", "도보");
  //429
  graph.addEdge("혜화관 4층 계단 중간2", "혜화관 3층 계단", 19, 19, "계단아래", "도보",
      node2X: 1981,
      node2Y: 2922,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 3층 계단", "혜화관 4층 계단 중간2", 35, 35, "계단위", "도보");
  //혜화관 계단 1층 - 3층 이동
  graph.addEdge("혜화관 3층 계단", "혜화관 1층 계단", 32, 32, "계단아래", "도보",
      node2X: 1981,
      node2Y: 2922,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 계단", "혜화관 3층 계단", 60, 60, "계단위", "도보");
  //430
  graph.addEdge("혜화관 1층 계단", "혜화관 1층 계단 앞", 14, 14, "평지", "도보",
      node2X: 1994,
      node2Y: 2927,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 계단 앞", "혜화관 1층 계단", 14, 14, "평지", "도보");
  //431
  graph.addEdge("혜화관 1층 계단 앞", "혜화관 입구", 36, 36, "평지", "도보");
  graph.addEdge("혜화관 입구", "혜화관 1층 계단 앞", 36, 36, "평지", "도보");
  //432
  graph.addEdge("혜화관 1층 계단 앞", "혜화관 1층 엘베 앞", 39, 39, "평지", "도보",
      node2X: 1983,
      node2Y: 2964,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 엘베 앞", "혜화관 1층 계단 앞", 39, 39, "평지", "도보");
  //433
  graph.addEdge("혜화관 1층 엘베 앞", "혜화관 1층 엘베", 32, 32, "평지", "도보",
      node2X: 1952,
      node2Y: 2955,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 엘베", "혜화관 1층 엘베 앞", 32, 32, "평지", "도보");
  //혜화관 엘베 1층 - 4층 이동
  graph.addEdge("혜화관 4층 엘베", "혜화관 1층 엘베", 90, 0, "엘베", "도보");
  graph.addEdge("혜화관 1층 엘베", "혜화관 4층 엘베", 90, 0, "엘베", "도보");

  //혜화관 입구
  graph.addEdge("혜화관 입구", "혜화관", 100000, 100000, "평지", "도보",
      node2X: 1993,
      node2Y: 2884,
      isInside2: 0,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관", "혜화관 입구", 100000, 100000, "평지", "도보");
  //혜화관 4층 입구
  graph.addEdge("혜화관 4층 입구", "혜화관", 100000, 100000, "평지", "도보");
  graph.addEdge("혜화관", "혜화관 4층 입구", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //사회과학관_경영관
  //(사회과학관 입구: 3층 입구, 2층 쪽문, B1 엘베, 2층 옆문)
  //(경영관 입구: 2층 입구, 2층 뒷문, 2층 쪽문)
  //438
  graph.addEdge("경영관 2층 쪽문", "경영관 2층 쪽문 안", 86, 86, "평지", "도보",
      node2X: 2338,
      node2Y: 3274,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문 안", "경영관 2층 쪽문", 86, 86, "평지", "도보");
  //439
  graph.addEdge("경영관 2층 쪽문 안", "경영관 2층 입구 안", 103, 103, "평지", "도보",
      node2X: 2369,
      node2Y: 3176,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 쪽문 안", 103, 103, "평지", "도보");
  //440
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 입구", 42, 42, "평지", "도보");
  graph.addEdge("경영관 2층 입구", "경영관 2층 입구 안", 42, 42, "평지", "도보");
  //441
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 계단", 14, 14, "평지", "도보",
      node2X: 2382,
      node2Y: 3180,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 계단", "경영관 2층 입구 안", 14, 14, "평지", "도보");
  //경영관 계단 2층 - 3층 이동
  graph.addEdge("경영관 2층 계단", "경영관 3층 계단", 30, 30, "계단위", "도보",
      node2X: 2382,
      node2Y: 3180,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 계단", "경영관 2층 계단", 16, 16, "계단아래", "도보");
  //442
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 뒷문 안", 48, 48, "평지", "도보",
      node2X: 2383,
      node2Y: 3130,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 뒷문 안", "경영관 2층 입구 안", 48, 48, "평지", "도보");
  //443
  graph.addEdge("경영관 2층 뒷문 안", "경영관 2층 뒷문", 27, 27, "평지", "도보");
  graph.addEdge("경영관 2층 뒷문", "경영관 2층 뒷문 안", 27, 27, "평지", "도보");
  //444
  graph.addEdge("경영관 2층 뒷문 안", "경영관 문화관 구름다리 앞", 46, 46, "평지", "도보",
      node2X: 2340,
      node2Y: 3115,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 문화관 구름다리 앞", "경영관 2층 뒷문 안", 46, 46, "평지", "도보");
  //445
  graph.addEdge("경영관 문화관 구름다리 앞", "경영관 문화관 구름다리 입구", 38, 38, "평지", "도보",
      node2X: 2350,
      node2Y: 3078,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 문화관 구름다리 입구", "경영관 문화관 구름다리 앞", 38, 38, "평지", "도보");
  //경영관 문화관 구름다리 이동
  graph.addEdge("경영관 문화관 구름다리 입구", "문화관 경영관 구름다리 입구", 11, 11, "계단아래", "도보",
      node2X: 2354,
      node2Y: 3065,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 경영관 구름다리 입구", "경영관 문화관 구름다리 입구", 20, 20, "계단위", "도보");
  //446
  graph.addEdge("경영관 문화관 구름다리 앞", "사회과학관 2층 옆문 안", 107, 107, "평지", "도보",
      node2X: 2238,
      node2Y: 3082,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 옆문 안", "경영관 문화관 구름다리 앞", 107, 107, "평지", "도보");
  //447
  graph.addEdge("사회과학관 2층 옆문 안", "사회과학관 2층 옆문", 39, 39, "평지", "도보");
  graph.addEdge("사회과학관 2층 옆문", "사회과학관 2층 옆문 안", 39, 39, "평지", "도보");
  //448
  graph.addEdge("사회과학관 2층 옆문 안", "사회과학관 2층 계단 앞", 17, 17, "평지", "도보",
      node2X: 2242,
      node2Y: 3065,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 옆문 안", 17, 17, "평지", "도보");
  //449
  graph.addEdge("사회과학관 2층 옆문 안", "사회과학관 2층 쪽문 방향", 43, 43, "평지", "도보",
      node2X: 2222,
      node2Y: 3042,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 옆문 안", 43, 43, "평지", "도보");
  //450
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 계단", 9, 9, "평지", "도보",
      node2X: 2250,
      node2Y: 3069,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 계단", "사회과학관 2층 계단 앞", 9, 9, "평지", "도보");
  //사회과학관 계단 2층 - 3층 이동
  graph.addEdge("사회과학관 2층 계단", "사회과학관 3층 계단", 30, 30, "계단위", "도보",
      node2X: 2250,
      node2Y: 3069,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단", "사회과학관 2층 계단", 16, 16, "계단아래", "도보");
  //451
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 계단 옆", 15, 15, "평지", "도보",
      node2X: 2246,
      node2Y: 3051,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 계단 옆", "사회과학관 2층 계단 앞", 15, 15, "평지", "도보");
  //452
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 쪽문 방향", 30, 30, "평지", "도보");
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 계단 앞", 30, 30, "평지", "도보");
  //453
  graph.addEdge("사회과학관 2층 계단 옆", "사회과학관 2층 쪽문 방향", 26, 26, "평지", "도보");
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 계단 옆", 26, 26, "평지", "도보");
  //454
  graph.addEdge("사회과학관 2층 계단 옆", "사회과학관 2층 엘베 앞", 19, 19, "평지", "도보",
      node2X: 2264,
      node2Y: 3056,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 엘베 앞", "사회과학관 2층 계단 옆", 19, 19, "평지", "도보");
  //455
  graph.addEdge("사회과학관 2층 엘베 앞", "사회과학관 2층 엘베", 27, 27, "평지", "도보",
      node2X: 2272,
      node2Y: 3030,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 엘베", "사회과학관 2층 엘베 앞", 27, 27, "평지", "도보");
  //사회과학관 엘베 B1 - 2층 이동
  graph.addEdge("사회과학관 2층 엘베", "사회과학관 B1 엘베", 60, 0, "엘베", "도보");
  graph.addEdge("사회과학관 B1 엘베", "사회과학관 2층 엘베", 60, 0, "엘베", "도보");
  //사회과학관 엘베 2층 - 3층 이동
  graph.addEdge("사회과학관 2층 엘베", "사회과학관 3층 엘베", 30, 0, "엘베", "도보",
      node2X: 2272,
      node2Y: 3030,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 엘베", "사회과학관 2층 엘베", 30, 0, "엘베", "도보");
  //456
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 쪽문 계단 앞", 242, 242, "평지", "도보",
      node2X: 2298,
      node2Y: 2812,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 계단 앞", "사회과학관 2층 쪽문 방향", 242, 242, "평지", "도보");
  //457
  graph.addEdge("사회과학관 2층 쪽문 계단 앞", "사회과학관 2층 쪽문 계단", 12, 12, "평지", "도보",
      node2X: 2309,
      node2Y: 2808,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 계단", "사회과학관 2층 쪽문 계단 앞", 12, 12, "평지", "도보");
  //458
  graph.addEdge("사회과학관 2층 쪽문 계단", "사회과학관 2층 쪽문", 13, 13, "평지", "도보");
  graph.addEdge("사회과학관 2층 쪽문", "사회과학관 2층 쪽문 계단", 13, 13, "평지", "도보");
  //사회과학관 쪽문 계단 2층 - 3층 이동
  graph.addEdge("사회과학관 2층 쪽문 계단", "사회과학관 3층 쪽문 계단", 30, 30, "계단위", "도보",
      node2X: 2309,
      node2Y: 2808,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 쪽문 계단", "사회과학관 2층 쪽문 계단", 16, 16, "계단아래", "도보");
  //경영관 쪽문 계단 2층 - 3층 이동
  graph.addEdge("경영관 2층 쪽문 계단", "경영관 3층 쪽문 계단", 30, 30, "계단위", "도보",
      node2X: 2246,
      node2Y: 3300,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 쪽문 계단", "경영관 2층 쪽문 계단", 16, 16, "계단아래", "도보");
  //459
  graph.addEdge("경영관 3층 쪽문 계단", "경영관 3층 쪽문", 11, 11, "평지", "도보",
      node2X: 2338,
      node2Y: 3274,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 쪽문", "경영관 3층 쪽문 계단", 11, 11, "평지", "도보");
  //460
  graph.addEdge("경영관 3층 쪽문", "경영관 3층 쪽문 안", 86, 86, "평지", "도보",
      node2X: 2338,
      node2Y: 3274,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 쪽문 안", "경영관 3층 쪽문", 86, 86, "평지", "도보");
  //461
  graph.addEdge("경영관 3층 쪽문 안", "경영관 3층 계단 앞", 103, 103, "평지", "도보",
      node2X: 2369,
      node2Y: 3176,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 계단 앞", "경영관 3층 쪽문 안", 103, 103, "평지", "도보");
  //462
  graph.addEdge("경영관 3층 계단 앞", "경영관 3층 계단", 14, 14, "평지", "도보");
  graph.addEdge("경영관 3층 계단", "경영관 3층 계단 앞", 14, 14, "평지", "도보");
  //463
  graph.addEdge("경영관 3층 계단 앞", "경영관 3층 계단 옆", 48, 48, "평지", "도보",
      node2X: 2383,
      node2Y: 3130,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 계단 옆", "경영관 3층 계단 앞", 48, 48, "평지", "도보");
  //464
  graph.addEdge("경영관 3층 계단 옆", "사회과학관 3층 계단 오른쪽", 153, 153, "평지", "도보",
      node2X: 2238,
      node2Y: 3082,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단 오른쪽", "경영관 3층 계단 옆", 153, 153, "평지", "도보");
  //465
  graph.addEdge("사회과학관 3층 계단 오른쪽", "사회과학관 3층 입구 안", 34, 34, "평지", "도보",
      node2X: 2204,
      node2Y: 3081,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 입구 안", "사회과학관 3층 계단 오른쪽", 34, 34, "평지", "도보");
  //466
  graph.addEdge("사회과학관 3층 입구 안", "사회과학관 3층 입구", 35, 35, "평지", "도보");
  graph.addEdge("사회과학관 3층 입구", "사회과학관 3층 입구 안", 35, 35, "평지", "도보");
  //467
  graph.addEdge("사회과학관 3층 계단 오른쪽", "사회과학관 3층 계단 앞", 17, 17, "평지", "도보",
      node2X: 2242,
      node2Y: 3065,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 계단 오른쪽", 17, 17, "평지", "도보");
  //468
  graph.addEdge("사회과학관 3층 계단 오른쪽", "사회과학관 3층 쪽문 방향", 43, 43, "평지", "도보",
      node2X: 2222,
      node2Y: 3042,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 계단 오른쪽", 43, 43, "평지", "도보");
  //469
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 계단", 9, 9, "평지", "도보");
  graph.addEdge("사회과학관 3층 계단", "사회과학관 3층 계단 앞", 9, 9, "평지", "도보");
  //470
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 계단 왼쪽", 15, 15, "평지", "도보",
      node2X: 2246,
      node2Y: 3051,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단 왼쪽", "사회과학관 3층 계단 앞", 15, 15, "평지", "도보");
  //471
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 쪽문 방향", 30, 30, "평지", "도보");
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 계단 앞", 30, 30, "평지", "도보");
  //472
  graph.addEdge("사회과학관 3층 계단 왼쪽", "사회과학관 3층 쪽문 방향", 26, 26, "평지", "도보");
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 계단 왼쪽", 26, 26, "평지", "도보");
  //473
  graph.addEdge("사회과학관 3층 계단 왼쪽", "사회과학관 3층 엘베 앞", 19, 19, "평지", "도보",
      node2X: 2264,
      node2Y: 3056,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 엘베 앞", "사회과학관 3층 계단 왼쪽", 19, 19, "평지", "도보");
  //474
  graph.addEdge("사회과학관 3층 엘베 앞", "사회과학관 3층 엘베", 27, 27, "평지", "도보");
  graph.addEdge("사회과학관 3층 엘베", "사회과학관 3층 엘베 앞", 27, 27, "평지", "도보");
  //475
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 쪽문 계단 앞", 242, 242, "평지", "도보",
      node2X: 2298,
      node2Y: 2812,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 쪽문 계단 앞", "사회과학관 3층 쪽문 방향", 242, 242, "평지", "도보");
  //476
  graph.addEdge("사회과학관 3층 쪽문 계단 앞", "사회과학관 3층 쪽문 계단", 12, 12, "평지", "도보");
  graph.addEdge("사회과학관 3층 쪽문 계단", "사회과학관 3층 쪽문 계단 앞", 12, 12, "평지", "도보");
  //사회과학관 3층 입구
  graph.addEdge("사회과학관 3층 입구", "사회과학관_경영관", 100000, 100000, "평지", "도보",
      node2X: 2295,
      node2Y: 3098,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관_경영관", "사회과학관 3층 입구", 100000, 100000, "평지", "도보");
  //사회과학관 2층 옆문
  graph.addEdge("사회과학관 2층 옆문", "사회과학관_경영관", 100000, 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "사회과학관 2층 옆문", 100000, 100000, "평지", "도보");
  //사회과학관 2층 쪽문
  graph.addEdge("사회과학관 2층 쪽문", "사회과학관_경영관", 100000, 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "사회과학관 2층 쪽문", 100000, 100000, "평지", "도보");
  //사회과학관 B1 엘베
  graph.addEdge("사회과학관 B1 엘베", "사회과학관_경영관", 100000, 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "사회과학관 B1 엘베", 100000, 100000, "평지", "도보");
  //경영관 2층 뒷문
  graph.addEdge("경영관 2층 뒷문", "사회과학관_경영관", 100000, 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "경영관 2층 뒷문", 100000, 100000, "평지", "도보");
  //경영관 2층 쪽문
  graph.addEdge("경영관 2층 쪽문", "사회과학관_경영관", 100000, 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "경영관 2층 쪽문", 100000, 100000, "평지", "도보");
  //경영관 2층 입구
  graph.addEdge("경영관 2층 입구", "사회과학관_경영관", 100000, 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "경영관 2층 입구", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //명진관
  //입구: 정문, 좌측 입구, 왼쪽 후문, 후문, 오른쪽 후문, 우측 입구
  //477
  graph.addEdge("명진관 좌측 입구", "명진관 좌측 입구 안", 30, 30, "평지", "도보",
      node2X: 1181,
      node2Y: 2886,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구 안", "명진관 좌측 입구", 30, 30, "평지", "도보");
  //478
  graph.addEdge("명진관 좌측 입구 안", "명진관 왼쪽 후문 안", 22, 22, "평지", "도보",
      node2X: 1174,
      node2Y: 2907,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 후문 안", "명진관 좌측 입구 안", 22, 22, "평지", "도보");
  //479
  graph.addEdge("명진관 왼쪽 후문 안", "명진관 왼쪽 후문", 9, 9, "평지", "도보");
  graph.addEdge("명진관 왼쪽 후문", "명진관 왼쪽 후문 안", 9, 9, "평지", "도보");
  //480
  graph.addEdge("명진관 좌측 입구 안", "명진관 왼쪽", 34, 34, "평지", "도보",
      node2X: 1191,
      node2Y: 2854,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽", "명진관 좌측 입구 안", 34, 34, "평지", "도보");
  //481
  graph.addEdge("명진관 왼쪽", "명진관 정문 안 왼쪽", 122, 122, "평지", "도보",
      node2X: 1307,
      node2Y: 2892,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 정문 안 왼쪽", "명진관 왼쪽", 122, 122, "평지", "도보");
  //482
  graph.addEdge("명진관 정문 안 왼쪽", "명진관 후문 안 왼쪽", 38, 38, "평지", "도보",
      node2X: 1293,
      node2Y: 2927,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 후문 안 왼쪽", "명진관 정문 안 왼쪽", 38, 38, "평지", "도보");
  //483
  graph.addEdge("명진관 정문 안 왼쪽", "명진관 정문 안", 15, 15, "평지", "도보",
      node2X: 1321,
      node2Y: 2896,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 정문 안", "명진관 정문 안 왼쪽", 15, 15, "평지", "도보");
  //484
  graph.addEdge("명진관 정문 안", "명진관 정문", 23, 23, "평지", "도보");
  graph.addEdge("명진관 정문", "명진관 정문 안", 23, 23, "평지", "도보");
  //485
  graph.addEdge("명진관 정문 안", "명진관 정문 안 오른쪽", 15, 15, "평지", "도보",
      node2X: 1335,
      node2Y: 2901,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 정문 안 오른쪽", "명진관 정문 안", 15, 15, "평지", "도보");
  //486
  graph.addEdge("명진관 정문 안 오른쪽", "명진관 후문 안 오른쪽", 38, 38, "평지", "도보",
      node2X: 1322,
      node2Y: 2937,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 후문 안 오른쪽", "명진관 정문 안 오른쪽", 38, 38, "평지", "도보");
  //487
  graph.addEdge("명진관 후문 안 왼쪽", "명진관 후문 안", 13, 13, "평지", "도보",
      node2X: 1305,
      node2Y: 2932,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 후문 안", "명진관 후문 안 왼쪽", 13, 13, "평지", "도보");
  //488
  graph.addEdge("명진관 후문 안", "명진관 후문 안 오른쪽", 18, 18, "평지", "도보");
  graph.addEdge("명진관 후문 안 오른쪽", "명진관 후문 안", 18, 18, "평지", "도보");
  //489
  graph.addEdge("명진관 후문 안", "명진관 후문", 4, 4, "평지", "도보");
  graph.addEdge("명진관 후문", "명진관 후문 안", 4, 4, "평지", "도보");
  //490
  graph.addEdge("명진관 정문 안 오른쪽", "명진관 오른쪽", 122, 122, "평지", "도보",
      node2X: 1451,
      node2Y: 2940,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽", "명진관 정문 안 오른쪽", 122, 122, "평지", "도보");
  //491
  graph.addEdge("명진관 오른쪽", "명진관 우측 입구 안", 16, 16, "평지", "도보",
      node2X: 1447,
      node2Y: 2955,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 우측 입구 안", "명진관 오른쪽", 16, 16, "평지", "도보");
  //492
  graph.addEdge("명진관 우측 입구 안", "명진관 우측 입구", 23, 23, "평지", "도보");
  graph.addEdge("명진관 우측 입구", "명진관 우측 입구 안", 23, 23, "평지", "도보");
  //493
  graph.addEdge("명진관 우측 입구 안", "명진관 오른쪽 후문 안", 39, 39, "평지", "도보",
      node2X: 1434,
      node2Y: 2992,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 후문 안", "명진관 우측 입구 안", 39, 39, "평지", "도보");
  //494
  graph.addEdge("명진관 오른쪽 후문 안", "명진관 오른쪽 후문", 9, 9, "평지", "도보");
  graph.addEdge("명진관 오른쪽 후문", "명진관 오른쪽 후문 안", 9, 9, "평지", "도보");
//명진관 정문
  graph.addEdge("명진관 정문", "명진관", 100000, 100000, "평지", "도보",
      node2X: 1323,
      node2Y: 2901,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관", "명진관 정문", 100000, 100000, "평지", "도보");
//명진관 좌측 입구
  graph.addEdge("명진관 좌측 입구", "명진관", 100000, 100000, "평지", "도보");
  graph.addEdge("명진관", "명진관 좌측 입구", 100000, 100000, "평지", "도보");
//명진관 왼쪽 후문
  graph.addEdge("명진관 왼쪽 후문", "명진관", 100000, 100000, "평지", "도보");
  graph.addEdge("명진관", "명진관 왼쪽 후문", 100000, 100000, "평지", "도보");
//명진관 후문
  graph.addEdge("명진관 후문", "명진관", 100000, 100000, "평지", "도보");
  graph.addEdge("명진관", "명진관 후문", 100000, 100000, "평지", "도보");
//명진관 오른쪽 후문
  graph.addEdge("명진관 오른쪽 후문", "명진관", 100000, 100000, "평지", "도보");
  graph.addEdge("명진관", "명진관 오른쪽 후문", 100000, 100000, "평지", "도보");
//명진관 우측 입구
  graph.addEdge("명진관 우측 입구", "명진관", 100000, 100000, "평지", "도보");
  graph.addEdge("명진관", "명진관 우측 입구", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //문화관
  //입구: 쪽문, 1층 입구, 후문, , 가든쿡 입구 ,가든쿡 문화관 입구, 예술극장 입구
  //495
  graph.addEdge("문화관 1층 입구", "문화관 1층 입구 안", 53, 53, "평지", "도보",
      node2X: 2442,
      node2Y: 2800,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 1층 입구 안", "문화관 1층 입구", 53, 53, "평지", "도보");
  //496
  graph.addEdge("문화관 1층 입구 안", "문화관 후문", 42, 42, "평지", "도보");
  graph.addEdge("문화관 후문", "문화관 1층 입구 안", 42, 42, "평지", "도보");
  //497
  graph.addEdge("문화관 1층 입구 안", "문화관 1층 계단 앞", 18, 18, "평지", "도보",
      node2X: 2436,
      node2Y: 2817,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 1층 계단 앞", "문화관 1층 입구 안", 18, 18, "평지", "도보");
  //498
  graph.addEdge("문화관 1층 계단 앞", "문화관 1층 계단", 9, 9, "평지", "도보",
      node2X: 2427,
      node2Y: 2814,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 1층 계단", "문화관 1층 계단 앞", 9, 9, "평지", "도보");
  //문화관 계단 1층 - 3층 이동
  graph.addEdge("문화관 1층 계단", "문화관 3층 계단", 60, 60, "계단위", "도보",
      node2X: 2427,
      node2Y: 2814,
      isInside2: 3,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 3층 계단", "문화관 1층 계단", 32, 32, "계단아래", "도보");
  //문화관 계단 1층 - B1 이동
  graph.addEdge("문화관 1층 계단", "문화관 B1 계단", 16, 16, "계단아래", "도보",
      node2X: 2427,
      node2Y: 2814,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 B1 계단", "문화관 1층 계단", 30, 30, "계단위", "도보");
  //문화관 계단 3층 - 4층 이동
  graph.addEdge("문화관 3층 계단", "문화관 4층 계단", 30, 30, "계단위", "도보",
      node2X: 2427,
      node2Y: 2814,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 4층 계단", "문화관 3층 계단", 16, 16, "계단아래", "도보");
  //499
  graph.addEdge("문화관 1층 계단 앞", "문화관 쪽문 안", 226, 226, "평지", "도보",
      node2X: 2366,
      node2Y: 3032,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 쪽문 안", "문화관 1층 계단 앞", 226, 226, "평지", "도보");
  //500
  graph.addEdge("문화관 쪽문 안", "문화관 1층 쪽문 계단", 25, 25, "평지", "도보",
      node2X: 2342,
      node2Y: 3025,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 1층 쪽문 계단", "문화관 쪽문 안", 25, 25, "평지", "도보");
  //문화관 쪽문 계단 1층 - 3층
  graph.addEdge("문화관 1층 쪽문 계단", "문화관 3층 쪽문 계단", 60, 60, "계단위", "도보",
      node2X: 2342,
      node2Y: 3025,
      isInside2: 3,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 3층 쪽문 계단", "문화관 1층 쪽문 계단", 32, 32, "계단아래", "도보");
  //문화관 쪽문 계단 1층 - B1
  graph.addEdge("문화관 1층 쪽문 계단", "문화관 B1 쪽문 계단", 16, 16, "계단아래", "도보",
      node2X: 2342,
      node2Y: 3025,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 B1 쪽문 계단", "문화관 1층 쪽문 계단", 30, 30, "계단위", "도보");
  //문화관 쪽문 계단 3층 - 4층
  graph.addEdge("문화관 3층 쪽문 계단", "문화관 4층 쪽문 계단", 30, 30, "계단위", "도보",
      node2X: 2342,
      node2Y: 3025,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 4층 쪽문 계단", "문화관 3층 쪽문 계단", 16, 16, "계단아래", "도보");

  //501
  graph.addEdge("문화관 쪽문 안", "문화관 쪽문", 15, 15, "평지", "도보");
  graph.addEdge("문화관 쪽문", "문화관 쪽문 안", 15, 15, "평지", "도보");
  //502
  graph.addEdge("문화관 3층 계단", "문화관 3층 계단 앞", 9, 9, "평지", "도보",
      node2X: 2436,
      node2Y: 2817,
      isInside2: 3,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 3층 계단 앞", "문화관 3층 계단", 9, 9, "평지", "도보");
  //503
  graph.addEdge("문화관 3층 계단 앞", "문화관 경영관 구름다리 앞", 226, 226, "평지", "도보",
      node2X: 2366,
      node2Y: 3032,
      isInside2: 3,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 경영관 구름다리 앞", "문화관 3층 계단 앞", 226, 226, "평지", "도보");
  //504
  graph.addEdge("문화관 경영관 구름다리 앞", "문화관 3층 쪽문 계단", 25, 25, "평지", "도보");
  graph.addEdge("문화관 3층 쪽문 계단", "문화관 경영관 구름다리 앞", 25, 25, "평지", "도보");
  //505
  graph.addEdge("문화관 경영관 구름다리 앞", "문화관 경영관 구름다리 입구", 35, 35, "평지", "도보");
  graph.addEdge("문화관 경영관 구름다리 입구", "문화관 경영관 구름다리 앞", 35, 35, "평지", "도보");
  //506
  graph.addEdge("문화관 4층 계단", "문화관 4층 계단 앞", 9, 9, "평지", "도보",
      node2X: 2436,
      node2Y: 2817,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 4층 계단 앞", "문화관 4층 계단", 9, 9, "평지", "도보");
  //507
  graph.addEdge("문화관 4층 계단 앞", "문화관 4층 쪽문 계단 앞", 226, 226, "평지", "도보",
      node2X: 2366,
      node2Y: 3032,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 4층 쪽문 계단 앞", "문화관 4층 계단 앞", 226, 226, "평지", "도보");
  //508
  graph.addEdge("문화관 4층 쪽문 계단 앞", "문화관 4층 쪽문 계단", 25, 25, "평지", "도보");
  graph.addEdge("문화관 4층 쪽문 계단", "문화관 4층 쪽문 계단 앞", 25, 25, "평지", "도보");
  //509
  graph.addEdge("문화관 4층 계단 앞", "문화관 학술관 구름다리 앞", 83, 83, "평지", "도보",
      node2X: 2463,
      node2Y: 2738,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 학술관 구름다리 앞", "문화관 4층 계단 앞", 83, 83, "평지", "도보");
  //510
  graph.addEdge("문화관 학술관 구름다리 앞", "문화관 학술관 구름다리 입구", 42, 42, "평지", "도보",
      node2X: 2503,
      node2Y: 2751,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 학술관 구름다리 입구", "문화관 학술관 구름다리 앞", 42, 42, "평지", "도보");
  //문화관 - 학술관 구름다리 이동
  graph.addEdge("문화관 학술관 구름다리 입구", "학술관 문화관 구름다리 입구", 48, 48, "평지", "도보",
      node2X: 2550,
      node2Y: 2761,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관 문화관 구름다리 입구", "문화관 학술관 구름다리 입구", 48, 48, "평지", "도보");
  //511
  graph.addEdge("문화관 B1 계단", "문화관 B1 계단 앞", 9, 9, "평지", "도보",
      node2X: 2436,
      node2Y: 2817,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 B1 계단 앞", "문화관 B1 계단", 9, 9, "평지", "도보");
  //512
  graph.addEdge("문화관 B1 계단 앞", "문화관 B1 쪽문 계단 앞", 226, 226, "평지", "도보",
      node2X: 2366,
      node2Y: 3032,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 B1 쪽문 계단 앞", "문화관 B1 계단 앞", 226, 226, "평지", "도보");
  //513
  graph.addEdge("문화관 B1 쪽문 계단 앞", "문화관 B1 쪽문 계단", 25, 25, "평지", "도보");
  graph.addEdge("문화관 B1 쪽문 계단", "문화관 B1 쪽문 계단 앞", 25, 25, "평지", "도보");
  //137
  graph.addEdge("가든쿡 입구", "가든쿡 갈림길", 63, 63, "평지", "도보",
      node2X: 2519,
      node2Y: 2803,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("가든쿡 갈림길", "가든쿡 입구", 63, 63, "평지", "도보");
  //138
  graph.addEdge("가든쿡 갈림길", "가든쿡 학술관 입구", 32, 32, "평지", "도보",
      node2X: 2551,
      node2Y: 2804,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("가든쿡 학술관 입구", "가든쿡 갈림길", 32, 32, "평지", "도보");
  //514
  graph.addEdge("가든쿡 갈림길", "가든쿡 문화관 입구", 41, 41, "평지", "도보",
      node2X: 2483,
      node2Y: 2783,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("가든쿡 문화관 입구", "가든쿡 갈림길", 41, 41, "평지", "도보");
  //515
  graph.addEdge("가든쿡 문화관 입구", "가든쿡 문화관 입구 안", 33, 33, "평지", "도보",
      node2X: 2451,
      node2Y: 2774,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("가든쿡 문화관 입구 안", "가든쿡 문화관 입구", 33, 33, "평지", "도보");
  //516
  graph.addEdge("문화관 B1 계단 앞", "가든쿡 문화관 입구 안", 46, 46, "평지", "도보");
  graph.addEdge("가든쿡 문화관 입구 안", "문화관 B1 계단 앞", 46, 46, "평지", "도보");
  //517
  graph.addEdge("가든쿡 문화관 입구 안", "이해랑 학술관 가는길1", 18, 18, "평지", "도보",
      node2X: 2456,
      node2Y: 2757,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("이해랑 학술관 가는길1", "가든쿡 문화관 입구 안", 18, 18, "평지", "도보");
  //518
  graph.addEdge("이해랑 학술관 가는길1", "이해랑 학술관 가는길2", 52, 52, "평지", "도보",
      node2X: 2506,
      node2Y: 2772,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("이해랑 학술관 가는길2", "이해랑 학술관 가는길1", 52, 52, "평지", "도보");
  //519
  graph.addEdge("이해랑 학술관 가는길2", "이해랑 학술관 가는길3", 117, 117, "평지", "도보",
      node2X: 2540,
      node2Y: 2660,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("이해랑 학술관 가는길3", "이해랑 학술관 가는길2", 117, 117, "평지", "도보");
  //520
  graph.addEdge("이해랑 학술관 가는길3", "문화관 학술관 B1 경계", 12, 12, "평지", "도보",
      node2X: 2551,
      node2Y: 2655,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 학술관 B1 경계", "이해랑 학술관 가는길3", 12, 12, "평지", "도보");
  //문화관 쪽문
  graph.addEdge("문화관 쪽문", "문화관", 100000, 100000, "평지", "도보",
      node2X: 2422,
      node2Y: 2841,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관", "문화관 쪽문", 100000, 100000, "평지", "도보");
  //문화관 1층 입구
  graph.addEdge("문화관 1층 입구", "문화관", 100000, 100000, "평지", "도보");
  graph.addEdge("문화관", "문화관 1층 입구", 100000, 100000, "평지", "도보");
  //문화관 후문
  graph.addEdge("문화관 후문", "문화관", 100000, 100000, "평지", "도보");
  graph.addEdge("문화관", "문화관 후문", 100000, 100000, "평지", "도보");
  //가든쿡 문화관 입구
  graph.addEdge("가든쿡 문화관 입구", "문화관", 100000, 100000, "평지", "도보");
  graph.addEdge("문화관", "가든쿡 문화관 입구", 100000, 100000, "평지", "도보");
  //문화관 학술관 B1 경계
  graph.addEdge("문화관 학술관 B1 경계", "문화관", 100000, 100000, "평지", "도보");
  graph.addEdge("문화관", "문화관 학술관 B1 경계", 100000, 100000, "평지", "도보");
  //문화관 학술관 구름다리 입구
  graph.addEdge("문화관 학술관 구름다리 입구", "문화관", 100000, 100000, "평지", "도보");
  graph.addEdge("문화관", "문화관 학술관 구름다리 입구", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //학술관
  //입구: 학술관 입구, 가든쿡 학술관 입구, 가든쿡 학술관 옆문
  //521
  graph.addEdge("문화관 학술관 B1 경계", "학술관 B1 계단 앞", 100, 100, "평지", "도보",
      node2X: 2591,
      node2Y: 2655,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 B1 계단 앞", "문화관 학술관 B1 경계", 100, 100, "평지", "도보");
  //522
  graph.addEdge("학술관 B1 계단 앞", "학술관 B1 계단", 30, 30, "평지", "도보",
      node2X: 2591,
      node2Y: 2625,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 B1 계단", "학술관 B1 계단 앞", 30, 30, "평지", "도보");
  //학술관 계단 B1 - 1층 이동
  graph.addEdge("학술관 B1 계단", "학술관 1층 계단", 30, 30, "계단위", "도보",
      node2X: 2591,
      node2Y: 2625,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 1층 계단", "학술관 B1 계단", 16, 16, "계단아래", "도보");
  //학술관 계단 1층 - 4층 이동
  graph.addEdge("학술관 1층 계단", "학술관 4층 계단", 90, 90, "계단위", "도보",
      node2X: 2591,
      node2Y: 2625,
      isInside2: 4,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 4층 계단", "학술관 1층 계단", 48, 48, "계단아래", "도보");
  //523
  graph.addEdge("학술관 B1 계단 앞", "학술관 B1 뒷계단 앞", 141, 141, "평지", "도보",
      node2X: 2591,
      node2Y: 2766,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 B1 뒷계단 앞", "학술관 B1 계단 앞", 141, 141, "평지", "도보");
  //524
  graph.addEdge("학술관 B1 뒷계단 앞", "학술관 B1 뒷계단", 12, 12, "평지", "도보",
      node2X: 2602,
      node2Y: 2770,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 B1 뒷계단", "학술관 B1 뒷계단 앞", 12, 12, "평지", "도보");
  //학술관 뒷계단 B1 - 1층 이동
  graph.addEdge("학술관 B1 뒷계단", "학술관 1층 뒷계단", 30, 30, "평지", "도보",
      node2X: 2602,
      node2Y: 2770,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 1층 뒷계단", "학술관 B1 뒷계단", 16, 16, "평지", "도보");
  //학술관 뒷계단 1층 - 4층 이동
  graph.addEdge("학술관 1층 뒷계단", "학술관 4층 뒷계단", 90, 90, "평지", "도보",
      node2X: 2602,
      node2Y: 2770,
      isInside2: 4,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 4층 뒷계단", "학술관 1층 뒷계단", 48, 48, "평지", "도보");
  //525
  graph.addEdge("학술관 B1 뒷계단 앞", "가든쿡 학술관 입구 안", 37, 37, "평지", "도보",
      node2X: 2589,
      node2Y: 2803,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("가든쿡 학술관 입구 안", "학술관 B1 뒷계단 앞", 37, 37, "평지", "도보");
  //526
  graph.addEdge("가든쿡 학술관 입구 안", "가든쿡 학술관 입구", 38, 38, "평지", "도보");
  graph.addEdge("가든쿡 학술관 입구", "가든쿡 학술관 입구 안", 38, 38, "평지", "도보");
  //527
  graph.addEdge("학술관 입구", "학술관 입구 안", 11, 11, "평지", "도보",
      node2X: 2569,
      node2Y: 2670,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 입구 안", "학술관 입구", 11, 11, "평지", "도보");
  //528
  graph.addEdge("학술관 입구 안", "학술관 1층 계단 앞", 22, 22, "평지", "도보",
      node2X: 2591,
      node2Y: 2670,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 1층 계단 앞", "학술관 입구 안", 22, 22, "평지", "도보");
  //529
  graph.addEdge("학술관 1층 계단 앞", "학술관 1층 계단", 45, 45, "평지", "도보");
  graph.addEdge("학술관 1층 계단", "학술관 1층 계단 앞", 45, 45, "평지", "도보");
  //530
  graph.addEdge("학술관 1층 계단 앞", "학술관 1층 뒷계단 앞", 96, 96, "평지", "도보",
      node2X: 2591,
      node2Y: 2766,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 1층 뒷계단 앞", "학술관 1층 계단 앞", 96, 96, "평지", "도보");
  //531
  graph.addEdge("학술관 1층 뒷계단 앞", "학술관 1층 뒷계단", 12, 12, "평지", "도보");
  graph.addEdge("학술관 1층 뒷계단", "학술관 1층 뒷계단 앞", 12, 12, "평지", "도보");
  //532
  graph.addEdge("학술관 1층 뒷계단 앞", "학술관 옆문 안", 60, 60, "평지", "도보",
      node2X: 2589,
      node2Y: 2826,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 옆문 안", "학술관 1층 뒷계단 앞", 60, 60, "평지", "도보");
  //533
  graph.addEdge("학술관 옆문 안", "학술관 옆문", 40, 40, "평지", "도보");
  graph.addEdge("학술관 옆문", "학술관 옆문 안", 40, 40, "평지", "도보");
  //534
  graph.addEdge("학술관 4층 계단", "학술관 4층 뒷계단 앞", 139, 139, "평지", "도보",
      node2X: 2591,
      node2Y: 2764,
      isInside2: 4,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 4층 뒷계단 앞", "학술관 4층 계단", 139, 139, "평지", "도보");
  //535
  graph.addEdge("학술관 4층 뒷계단 앞", "학술관 4층 뒷계단", 13, 13, "평지", "도보",
      node2X: 2591,
      node2Y: 2764,
      isInside2: 4,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 4층 뒷계단", "학술관 4층 뒷계단 앞", 13, 13, "평지", "도보");
  //536
  graph.addEdge("학술관 4층 뒷계단 앞", "학술관 문화관 구름다리 입구", 40, 40, "평지", "도보");
  graph.addEdge("학술관 문화관 구름다리 입구", "학술관 4층 뒷계단 앞", 40, 40, "평지", "도보");
  //학술관 입구
  graph.addEdge("학술관 입구", "학술관", 100000, 100000, "평지", "도보",
      node2X: 2597,
      node2Y: 2719,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관", "학술관 입구", 100000, 100000, "평지", "도보");
  //가든쿡 학술관 입구
  graph.addEdge("가든쿡 학술관 입구", "학술관", 100000, 100000, "평지", "도보");
  graph.addEdge("학술관", "가든쿡 학술관 입구", 100000, 100000, "평지", "도보");
  //가든쿡 학술관 옆문
  graph.addEdge("학술관 옆문", "학술관", 100000, 100000, "평지", "도보");
  graph.addEdge("학술관", "학술관 옆문", 100000, 100000, "평지", "도보");
  //문화관 학술관 B1 경계
  graph.addEdge("문화관 학술관 B1 경계", "학술관", 100000, 100000, "평지", "도보");
  graph.addEdge("학술관", "문화관 학술관 B1 경계", 100000, 100000, "평지", "도보");
  //학술관 문화관 구름다리 입구
  graph.addEdge("학술관 문화관 구름다리 입구", "학술관", 100000, 100000, "평지", "도보");
  graph.addEdge("학술관", "학술관 문화관 구름다리 입구", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //원흥관
  //입구: 원흥관 3층 후문, 원흥관2 4층 입구, 원흥관 1층 후문, 원흥관 1층 정문, 원흥관 1층 쪽문
  //537
  graph.addEdge("원흥관 1층 쪽문", "원흥관 1층 쪽문 안", 30.806, 30.806, "평지", "도보",
      node2X: 766,
      node2Y: 2218,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 쪽문 안", "원흥관 1층 쪽문", 30.806, 30.806, "평지", "도보");
  //538
  graph.addEdge("원흥관 1층 쪽문 안", "원흥관 1층 쪽문 계단", 10.630, 10.630, "평지", "도보",
      node2X: 759,
      node2Y: 2226,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 쪽문 계단", "원흥관 1층 쪽문 안", 10.630, 10.630, "평지", "도보");
  //원흥관 1층 쪽문 계단 1층 - 2층 이동
  graph.addEdge("원흥관 1층 쪽문 계단", "원흥관 2층 쪽문 계단", 30, 30, "계단위", "도보",
      node2X: 759,
      node2Y: 2226,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 쪽문 계단", "원흥관 1층 쪽문 계단", 16, 16, "계단아래", "도보");
  //원흥관 1층 쪽문 계단 2층 - 3층 이동
  graph.addEdge("원흥관 2층 쪽문 계단", "원흥관 3층 쪽문 계단", 30, 30, "계단위", "도보",
      node2X: 759,
      node2Y: 2226,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 쪽문 계단", "원흥관 2층 쪽문 계단", 16, 16, "계단아래", "도보");
  //원흥관 1층 쪽문 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 쪽문 계단", "원흥관 4층 쪽문 계단", 30, 30, "계단위", "도보",
      node2X: 759,
      node2Y: 2226,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 쪽문 계단", "원흥관 3층 쪽문 계단", 16, 16, "계단아래", "도보");
  //539
  graph.addEdge("원흥관 1층 쪽문 안", "원흥관 1층 정문 안", 152.434, 152.434, "평지", "도보",
      node2X: 886,
      node2Y: 2312,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 정문 안", "원흥관 1층 쪽문 안", 152.434, 152.434, "평지", "도보");
  //540
  graph.addEdge("원흥관 1층 정문 안", "원흥관 1층 정문", 40.460, 40.460, "평지", "도보");
  graph.addEdge("원흥관 1층 정문", "원흥관 1층 정문 안", 40.460, 40.460, "평지", "도보");
  //541
  graph.addEdge("원흥관 1층 정문 안", "원흥관 1층 중앙", 80.604, 80.604, "평지", "도보",
      node2X: 950,
      node2Y: 2361,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 중앙", "원흥관 1층 정문 안", 80.604, 80.604, "평지", "도보");
  //542
  graph.addEdge("원흥관 1층 중앙", "원흥관 1층 중앙 계단 앞", 11.314, 11.314, "평지", "도보",
      node2X: 958,
      node2Y: 2353,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 중앙 계단 앞", "원흥관 1층 중앙", 11.314, 11.314, "평지", "도보");
  //543
  graph.addEdge("원흥관 1층 중앙 계단 앞", "원흥관 1층 중앙 계단", 13.602, 13.602, "평지", "도보",
      node2X: 947,
      node2Y: 2345,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 중앙 계단", "원흥관 1층 중앙 계단 앞", 13.602, 13.602, "평지", "도보");
  //원흥관 중앙 계단 1층 - 2층 이동
  graph.addEdge("원흥관 1층 중앙 계단", "원흥관 2층 중앙 계단", 30, 30, "계단위", "도보",
      node2X: 947,
      node2Y: 2345,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 중앙 계단", "원흥관 1층 중앙 계단", 16, 16, "계단아래", "도보");
  //원흥관 중앙 계단 2층 - 3층 이동
  graph.addEdge("원흥관 2층 중앙 계단", "원흥관 3층 중앙 계단", 30, 30, "계단위", "도보",
      node2X: 947,
      node2Y: 2345,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 중앙 계단", "원흥관 2층 중앙 계단", 16, 16, "계단아래", "도보");
  //원흥관 중앙 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 중앙 계단", "원흥관 4층 중앙 계단", 30, 30, "계단위", "도보",
      node2X: 947,
      node2Y: 2345,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 중앙 계단", "원흥관 3층 중앙 계단", 16, 16, "계단아래", "도보");
  //544
  graph.addEdge("원흥관 1층 정문 안", "원흥관 1층 후문 안", 35.805, 35.805, "평지", "도보",
      node2X: 865,
      node2Y: 2341,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 후문 안", "원흥관 1층 정문 안", 35.805, 35.805, "평지", "도보");
  //545
  graph.addEdge("원흥관 1층 후문 안", "원흥관 1층 후문 계단 앞", 5.657, 5.657, "평지", "도보",
      node2X: 861,
      node2Y: 2337,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 후문 계단 앞", "원흥관 1층 후문 안", 5.657, 5.657, "평지", "도보");
  //546
  graph.addEdge("원흥관 1층 후문 계단 앞", "원흥관 1층 후문 계단", 6.403, 6.403, "평지", "도보",
      node2X: 856,
      node2Y: 2341,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 후문 계단", "원흥관 1층 후문 계단 앞", 6.403, 6.403, "평지", "도보");
  //원흥관 후문 계단 1층 - 2층 이동
  graph.addEdge("원흥관 1층 후문 계단", "원흥관 2층 후문 계단", 30, 30, "계단위", "도보",
      node2X: 861,
      node2Y: 2342,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 후문 계단", "원흥관 1층 후문 계단", 16, 16, "계단아래", "도보");
  //원흥관 후문 계단 2층 - 3층 이동
  graph.addEdge("원흥관 2층 후문 계단", "원흥관 3층 후문 계단", 30, 30, "계단위", "도보",
      node2X: 861,
      node2Y: 2342,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 후문 계단", "원흥관 2층 후문 계단", 16, 16, "계단아래", "도보");
  //원흥관 후문 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 후문 계단", "원흥관 4층 후문 계단", 30, 30, "계단위", "도보",
      node2X: 861,
      node2Y: 2342,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 후문 계단", "원흥관 3층 후문 계단", 16, 16, "계단아래", "도보");
  //547
  graph.addEdge("원흥관 1층 후문 안", "원흥관 1층 후문", 19.8494, 19.8494, "평지", "도보",
      node2X: 852,
      node2Y: 2356,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 후문", "원흥관 1층 후문 안", 19.8494, 19.8494, "평지", "도보");
  //548
  graph.addEdge("원흥관 2층 쪽문 계단", "원흥관 2층 쪽문 계단 앞", 30.806, 30.806, "평지", "도보",
      node2X: 766,
      node2Y: 2218,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 쪽문 계단 앞", "원흥관 2층 쪽문 계단", 30.806, 30.806, "평지", "도보");
  //549
  graph.addEdge("원흥관 2층 쪽문 계단 앞", "원흥관 2층 왼쪽", 152.434, 152.434, "평지", "도보",
      node2X: 886,
      node2Y: 2312,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 왼쪽", "원흥관 2층 쪽문 계단 앞", 152.434, 152.434, "평지", "도보");
  //550
  graph.addEdge("원흥관 2층 왼쪽", "원흥관 2층 후문 계단", 39.0512, 39.0512, "평지", "도보");
  graph.addEdge("원흥관 2층 후문 계단", "원흥관 2층 왼쪽", 39.0512, 39.0512, "평지", "도보");
  //551
  graph.addEdge("원흥관 2층 왼쪽", "원흥관 2층 중앙", 94.6414, 94.6414, "평지", "도보",
      node2X: 960,
      node2Y: 2371,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 중앙", "원흥관 2층 왼쪽", 94.6414, 94.6414, "평지", "도보");
  //552
  graph.addEdge("원흥관 2층 중앙", "원흥관 2층 중앙 계단 앞", 12.0416, 12.0416, "평지", "도보",
      node2X: 968,
      node2Y: 2362,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 중앙 계단 앞", "원흥관 2층 중앙", 12.0416, 12.0416, "평지", "도보");
  //553
  graph.addEdge("원흥관 2층 중앙 계단 앞", "원흥관 2층 중앙 계단", 27.0185, 27.0185, "평지", "도보");
  graph.addEdge("원흥관 2층 중앙 계단", "원흥관 2층 중앙 계단 앞", 27.0185, 27.0185, "평지", "도보");
  //554
  graph.addEdge("원흥관 2층 중앙 계단 앞", "원흥관 2층 엘베", 5.8309, 5.8309, "평지", "도보",
      node2X: 971,
      node2Y: 2357,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 엘베", "원흥관 2층 중앙 계단 앞", 5.8309, 5.8309, "평지", "도보");
  //원흥관 엘베 2층 - 3층 이동
  graph.addEdge("원흥관 2층 엘베", "원흥관 3층 엘베", 30, 0, "엘베", "도보",
      node2X: 971,
      node2Y: 2357,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 엘베", "원흥관 2층 엘베", 30, 0, "엘베", "도보");
  //원흥관 엘베 3층 - 4층 이동
  graph.addEdge("원흥관 3층 엘베", "원흥관 4층 엘베", 30, 0, "엘베", "도보",
      node2X: 971,
      node2Y: 2357,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 엘베", "원흥관 3층 엘베", 30, 0, "엘베", "도보");
  //555
  graph.addEdge("원흥관 3층 쪽문 계단", "원흥관 3층 쪽문 계단 앞", 30.806, 30.806, "평지", "도보",
      node2X: 766,
      node2Y: 2218,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 쪽문 계단 앞", "원흥관 3층 쪽문 계단", 30.806, 30.806, "평지", "도보");
  //556
  graph.addEdge("원흥관 3층 쪽문 계단 앞", "원흥관 3층 왼쪽", 152.434, 152.434, "평지", "도보",
      node2X: 886,
      node2Y: 2312,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 왼쪽", "원흥관 3층 쪽문 계단 앞", 152.434, 152.434, "평지", "도보");
  //557
  graph.addEdge("원흥관 3층 왼쪽", "원흥관 3층 후문 계단", 39.0512, 39.0512, "평지", "도보");
  graph.addEdge("원흥관 3층 후문 계단", "원흥관 3층 왼쪽", 39.0512, 39.0512, "평지", "도보");
  //558
  graph.addEdge("원흥관 3층 왼쪽", "원흥관 3층 중앙", 94.6414, 94.6414, "평지", "도보",
      node2X: 960,
      node2Y: 2371,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 중앙", "원흥관 3층 왼쪽", 94.6414, 94.6414, "평지", "도보");
  //559
  graph.addEdge("원흥관 3층 중앙", "원흥관 3층 중앙 계단 앞", 12.0416, 12.0416, "평지", "도보",
      node2X: 968,
      node2Y: 2362,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 중앙 계단 앞", "원흥관 3층 중앙", 12.0416, 12.0416, "평지", "도보");
  //560
  graph.addEdge("원흥관 3층 중앙 계단 앞", "원흥관 3층 중앙 계단", 27.0185, 27.0185, "평지", "도보");
  graph.addEdge("원흥관 3층 중앙 계단", "원흥관 3층 중앙 계단 앞", 27.0185, 27.0185, "평지", "도보");
  //561
  graph.addEdge("원흥관 3층 중앙 계단 앞", "원흥관 3층 엘베", 5.8309, 5.8309, "평지", "도보");
  graph.addEdge("원흥관 3층 엘베", "원흥관 3층 중앙 계단 앞", 5.8309, 5.8309, "평지", "도보");
  //562
  graph.addEdge("원흥관 3층 중앙", "원흥관 3층 오른쪽 계단 앞", 50.9117, 50.9117, "평지", "도보",
      node2X: 986,
      node2Y: 2397,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 오른쪽 계단 앞", "원흥관 3층 중앙", 50.9117, 50.9117, "평지", "도보");
  //563
  graph.addEdge("원흥관 3층 오른쪽 계단 앞", "원흥관 3층 오른쪽 계단", 37.6431, 37.6431, "평지", "도보",
      node2X: 957,
      node2Y: 2421,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 오른쪽 계단", "원흥관 3층 오른쪽 계단 앞", 37.6431, 37.6431, "평지", "도보");
  //원흥관 오른쪽 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 오른쪽 계단", "원흥관 4층 오른쪽 계단", 30, 30, "계단위", "도보",
      node2X: 957,
      node2Y: 2433,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 오른쪽 계단", "원흥관 3층 오른쪽 계단", 16, 16, "계단아래", "도보");
  //564
  graph.addEdge("원흥관 3층 오른쪽 계단 앞", "원흥관 3층 후문 안", 60.7289, 60.7289, "평지", "도보",
      node2X: 968,
      node2Y: 2455,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 후문 안", "원흥관 3층 오른쪽 계단 앞", 60.7289, 60.7289, "평지", "도보");
  //565
  graph.addEdge("원흥관 3층 후문 안", "원흥관 3층 후문", 12.3693, 12.3693, "평지", "도보");
  graph.addEdge("원흥관 3층 후문", "원흥관 3층 후문 안", 60.7289, 12.3693, "평지", "도보");
  //566
  graph.addEdge("원흥관 3층 후문 안", "원흥관 3층 야외 계단문 안", 127.781, 127.781, "평지", "도보",
      node2X: 930,
      node2Y: 2577,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단문 안", "원흥관 3층 후문 안", 127.781, 127.781, "평지", "도보");
  //567
  graph.addEdge("원흥관 3층 야외 계단문 안", "원흥관 3층 야외 계단문", 10.4403, 10.4403, "평지", "도보",
      node2X: 940,
      node2Y: 2580,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단문", "원흥관 3층 야외 계단문 안", 10.4403, 10.4403, "평지", "도보");
  //568
  graph.addEdge("원흥관 3층 야외 계단문", "원흥관 3층 야외 계단", 15.0748, 15.0748, "계단위", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단", "원흥관 3층 야외 계단문", 8.0399, 8.0399, "계단아래", "도보");
  //원흥관 야외 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 야외 계단", "원흥관 4층 야외 계단", 30, 30, "계단위", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 4층 야외 계단", "원흥관 3층 야외 계단", 16, 16, "계단아래", "도보");
  //원흥관 야외 계단 4층 - 5층 이동
  graph.addEdge("원흥관 4층 야외 계단", "원흥관 5층 야외 계단", 30, 30, "계단위", "도보");
  graph.addEdge("원흥관 5층 야외 계단", "원흥관 4층 야외 계단", 16, 16, "계단아래", "도보");
  //569
  graph.addEdge("원흥관 4층 쪽문 계단", "원흥관 4층 쪽문 계단 앞", 30.806, 30.806, "평지", "도보",
      node2X: 766,
      node2Y: 2218,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 쪽문 계단 앞", "원흥관 4층 쪽문 계단", 30.806, 30.806, "평지", "도보");
  //570
  graph.addEdge("원흥관 4층 쪽문 계단 앞", "원흥관 4층 왼쪽", 152.434, 152.434, "평지", "도보",
      node2X: 886,
      node2Y: 2312,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 왼쪽", "원흥관 4층 쪽문 계단 앞", 152.434, 152.434, "평지", "도보");
  //571
  graph.addEdge("원흥관 4층 왼쪽", "원흥관 4층 후문 계단", 39.0512, 39.0512, "평지", "도보");
  graph.addEdge("원흥관 4층 후문 계단", "원흥관 4층 왼쪽", 39.0512, 39.0512, "평지", "도보");
  //558
  graph.addEdge("원흥관 4층 왼쪽", "원흥관 4층 중앙", 94.6414, 94.6414, "평지", "도보",
      node2X: 960,
      node2Y: 2371,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 중앙", "원흥관 4층 왼쪽", 94.6414, 94.6414, "평지", "도보");
  //559
  graph.addEdge("원흥관 4층 중앙", "원흥관 4층 중앙 계단 앞", 12.0416, 12.0416, "평지", "도보",
      node2X: 968,
      node2Y: 2362,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 중앙 계단 앞", "원흥관 4층 중앙", 12.0416, 12.0416, "평지", "도보");
  //560
  graph.addEdge("원흥관 4층 중앙 계단 앞", "원흥관 4층 중앙 계단", 27.0185, 27.0185, "평지", "도보");
  graph.addEdge("원흥관 4층 중앙 계단", "원흥관 4층 중앙 계단 앞", 27.0185, 27.0185, "평지", "도보");
  //561
  graph.addEdge("원흥관 4층 중앙 계단 앞", "원흥관 4층 엘베", 5.8309, 5.8309, "평지", "도보");
  graph.addEdge("원흥관 4층 엘베", "원흥관 4층 중앙 계단 앞", 5.8309, 5.8309, "평지", "도보");
  //576
  graph.addEdge("원흥관 4층 중앙", "원흥관 4층 입구 안", 34.9285, 34.9285, "평지", "도보",
      node2X: 974,
      node2Y: 2403,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 입구 안", "원흥관 4층 중앙", 34.9285, 34.9285, "평지", "도보");
  //578
  graph.addEdge("원흥관 4층 입구 안", "원흥관 4층 입구", 24.5967, 24.5967, "평지", "도보");
  graph.addEdge("원흥관 4층 입구", "원흥관 4층 입구 안", 24.5967, 24.5967, "평지", "도보");
  //579
  graph.addEdge("원흥관 4층 입구 안", "원흥관 4층 입구 옆", 41.1947, 41.1947, "평지", "도보",
      node2X: 970,
      node2Y: 2444,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 입구 옆", "원흥관 4층 입구 안", 41.1947, 41.1947, "평지", "도보");
  //577
  graph.addEdge("원흥관 4층 입구 옆", "원흥관 4층 오른쪽 계단", 17.0294, 17.0294, "평지", "도보");
  graph.addEdge("원흥관 4층 오른쪽 계단", "원흥관 4층 입구 옆", 17.0294, 17.0294, "평지", "도보");
  //580
  graph.addEdge("원흥관 4층 입구 옆", "원흥관 4층 야외 계단문 안", 138.885, 138.885, "평지", "도보",
      node2X: 930,
      node2Y: 2577,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 야외 계단문 안", "원흥관 4층 입구 옆", 138.885, 138.885, "평지", "도보");
  //581
  graph.addEdge("원흥관 4층 야외 계단문 안", "원흥관 4층 야외 계단문", 10.4403, 10.4403, "평지", "도보",
      node2X: 940,
      node2Y: 2580,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 4층 야외 계단문", "원흥관 4층 야외 계단문 안", 10.4403, 10.4403, "평지", "도보");
  //582
  graph.addEdge("원흥관 4층 야외 계단문", "원흥관 4층 야외 계단", 15.0748, 15.0748, "계단위", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 4층 야외 계단", "원흥관 4층 야외 계단문", 8.0399, 8.0399, "계단아래", "도보");
  //원흥관 3층 후문
  graph.addEdge("원흥관 3층 후문", "원흥관", 100000, 100000, "평지", "도보",
      node2X: 953,
      node2Y: 2405,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관", "원흥관 3층 후문", 100000, 100000, "평지", "도보");
  //원흥관 4층 입구
  graph.addEdge("원흥관 4층 입구", "원흥관", 100000, 100000, "평지", "도보");
  graph.addEdge("원흥관", "원흥관 4층 입구", 100000, 100000, "평지", "도보");
  //원흥관 1층 후문
  graph.addEdge("원흥관 1층 후문", "원흥관", 100000, 100000, "평지", "도보");
  graph.addEdge("원흥관", "원흥관 1층 후문", 100000, 100000, "평지", "도보");
  //원흥관 1층 정문
  graph.addEdge("원흥관 1층 정문", "원흥관", 100000, 100000, "평지", "도보");
  graph.addEdge("원흥관", "원흥관 1층 정문", 100000, 100000, "평지", "도보");
  //원흥관 1층 쪽문
  graph.addEdge("원흥관 1층 쪽문", "원흥관", 100000, 100000, "평지", "도보");
  graph.addEdge("원흥관", "원흥관 1층 쪽문", 100000, 100000, "평지", "도보");
  //원흥관 3층 야외 계단문
  graph.addEdge("원흥관 3층 야외 계단문", "원흥관", 100000, 100000, "평지", "도보");
  graph.addEdge("원흥관", "원흥관 3층 야외 계단문", 100000, 100000, "평지", "도보");
  //원흥관 4층 야외 계단문
  graph.addEdge("원흥관 4층 야외 계단문", "원흥관", 100000, 100000, "평지", "도보");
  graph.addEdge("원흥관", "원흥관 4층 야외 계단문", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //본관
  //입구: 왼쪽 입구, 오른쪽 입구, 1층 입구, 쪽문
  //587
  graph.addEdge("본관 1층 입구", "본관 1층 입구 안", 14.3178, 14.3178, "평지", "도보",
      node2X: 1123,
      node2Y: 2415,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 입구 안", "본관 1층 입구", 14.3178, 14.3178, "평지", "도보");
  //588
  graph.addEdge("본관 1층 입구 안", "본관 1층 엘베 앞", 16.2788, 16.2788, "평지", "도보",
      node2X: 1120,
      node2Y: 2431,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 엘베 앞", "본관 1층 입구 안", 16.2788, 16.2788, "평지", "도보");
  //589
  graph.addEdge("본관 1층 엘베 앞", "본관 1층 엘베", 6.32456, 6.32456, "평지", "도보",
      node2X: 1114,
      node2Y: 2429,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 엘베", "본관 1층 엘베 앞", 6.32456, 6.32456, "평지", "도보");
  //본관 엘베 1층 - 2층 이동
  graph.addEdge("본관 1층 엘베", "본관 2층 엘베", 30, 0, "엘베", "도보",
      node2X: 1114,
      node2Y: 2429,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 엘베", "본관 1층 엘베", 30, 0, "엘베", "도보");
  //본관 엘베 2층 - 3층 이동
  graph.addEdge("본관 2층 엘베", "본관 3층 엘베", 30, 0, "엘베", "도보",
      node2X: 1114,
      node2Y: 2429,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 엘베", "본관 2층 엘베", 30, 0, "엘베", "도보");
  //590
  graph.addEdge("본관 1층 엘베 앞", "본관 1층 왼쪽 계단 앞", 5.09902, 5.09902, "평지", "도보",
      node2X: 1125,
      node2Y: 2432,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 왼쪽 계단 앞", "본관 1층 엘베 앞", 5.09902, 5.09902, "평지", "도보");
  //591
  graph.addEdge("본관 1층 왼쪽 계단 앞", "본관 1층 왼쪽 계단", 10.4403, 10.4403, "평지", "도보",
      node2X: 1128,
      node2Y: 2422,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 왼쪽 계단", "본관 1층 왼쪽 계단 앞", 10.4403, 10.4403, "평지", "도보");
  //본관 왼쪽 계단 1층 - 2층 이동
  graph.addEdge("본관 1층 왼쪽 계단", "본관 2층 왼쪽 계단", 30, 30, "계단위", "도보",
      node2X: 1128,
      node2Y: 2422,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 왼쪽 계단", "본관 1층 왼쪽 계단", 16, 16, "계단아래", "도보");
  //본관 왼쪽 계단 2층 - 3층 이동
  graph.addEdge("본관 2층 왼쪽 계단", "본관 3층 왼쪽 계단", 30, 30, "계단위", "도보",
      node2X: 1128,
      node2Y: 2422,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 계단", "본관 2층 왼쪽 계단", 16, 16, "계단아래", "도보");
  //592
  graph.addEdge("본관 1층 왼쪽 계단 앞", "본관 1층 갈림길", 27.5136, 27.5136, "평지", "도보",
      node2X: 1157,
      node2Y: 2443,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 갈림길", "본관 1층 왼쪽 계단 앞", 27.5136, 27.5136, "평지", "도보");
  //593
  graph.addEdge("본관 1층 갈림길", "본관 1층 중앙 계단 옆", 30.0832, 30.0832, "평지", "도보",
      node2X: 1186,
      node2Y: 2451,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 중앙 계단 옆", "본관 1층 갈림길", 30.0832, 30.0832, "평지", "도보");
  //594
  graph.addEdge("본관 1층 중앙 계단 옆", "본관 1층 중앙 계단 앞", 17.4642, 17.4642, "평지", "도보",
      node2X: 1182,
      node2Y: 2468,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 중앙 계단 앞", "본관 1층 중앙 계단 옆", 17.4642, 17.4642, "평지", "도보");
  //595
  graph.addEdge("본관 1층 중앙 계단 앞", "본관 1층 중앙 계단", 15.5242, 15.5242, "평지", "도보",
      node2X: 1197,
      node2Y: 2472,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 중앙 계단", "본관 1층 중앙 계단 앞", 15.5242, 15.5242, "평지", "도보");
  //본관 중앙 계단 1층 - 2층 이동
  graph.addEdge("본관 1층 중앙 계단", "본관 2층 중앙 계단", 30, 30, "계단위", "도보",
      node2X: 1197,
      node2Y: 2472,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중앙 계단", "본관 1층 중앙 계단", 16, 16, "계단아래", "도보");
  //596
  graph.addEdge("본관 1층 갈림길", "본관 1층 오른쪽", 174.614, 174.614, "평지", "도보",
      node2X: 1106,
      node2Y: 2610,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 오른쪽", "본관 1층 갈림길", 174.614, 174.614, "평지", "도보");
  //597
  graph.addEdge("본관 1층 오른쪽", "본관 1층 오른쪽 계단 앞", 50, 50, "평지", "도보",
      node2X: 1058,
      node2Y: 2596,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 오른쪽 계단 앞", "본관 1층 오른쪽", 50, 50, "평지", "도보");
  //598
  graph.addEdge("본관 1층 오른쪽 계단 앞", "본관 1층 오른쪽 계단", 8.24621, 8.24621, "평지", "도보",
      node2X: 1056,
      node2Y: 2604,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 오른쪽 계단", "본관 1층 오른쪽 계단 앞", 8.24621, 8.24621, "평지", "도보");
  //본관 오른쪽 계단 1층 - 2층 이동
  graph.addEdge("본관 1층 오른쪽 계단", "본관 2층 오른쪽 계단", 30, 30, "계단위", "도보",
      node2X: 1056,
      node2Y: 2604,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 오른쪽 계단", "본관 1층 오른쪽 계단", 16, 16, "계단아래", "도보");
  //본관 오른쪽 계단 2층 - 3층 이동
  graph.addEdge("본관 2층 오른쪽 계단", "본관 3층 오른쪽 계단", 30, 30, "계단위", "도보",
      node2X: 1056,
      node2Y: 2604,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 계단", "본관 2층 오른쪽 계단", 16, 16, "계단아래", "도보");
  //599
  graph.addEdge("본관 1층 오른쪽 계단 앞", "본관 1층 쪽문 안", 14.5602, 14.5602, "평지", "도보",
      node2X: 1044,
      node2Y: 2592,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 쪽문 안", "본관 1층 오른쪽 계단 앞", 14.5602, 14.5602, "평지", "도보");
  //600
  graph.addEdge("본관 1층 쪽문 안", "본관 1층 쪽문", 9.05539, 9.05539, "평지", "도보");
  graph.addEdge("본관 1층 쪽문", "본관 1층 쪽문 안", 9.05539, 9.05539, "평지", "도보");
  //601
  graph.addEdge("본관 2층 엘베", "본관 2층 엘베 앞", 12.3693, 12.3693, "평지", "도보",
      node2X: 1126,
      node2Y: 2432,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 엘베 앞", "본관 2층 엘베", 12.3693, 12.3693, "평지", "도보");
  //616
  graph.addEdge("본관 2층 엘베 앞", "본관 2층 왼쪽 계단", 10.198, 10.198, "평지", "도보",
      node2X: 1126,
      node2Y: 2432,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 왼쪽 계단", "본관 2층 엘베 앞", 10.198, 10.198, "평지", "도보");
  //602
  graph.addEdge("본관 2층 엘베 앞", "본관 2층 갈림길", 94.921, 94.921, "평지", "도보",
      node2X: 1217,
      node2Y: 2459,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 갈림길", "본관 2층 엘베 앞", 94.921, 94.921, "평지", "도보");
  //603
  graph.addEdge("본관 2층 갈림길", "본관 2층 구석 계단 옆", 23.4094, 23.4094, "평지", "도보",
      node2X: 1225,
      node2Y: 2437,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 구석 계단 옆", "본관 2층 갈림길", 23.4094, 23.4094, "평지", "도보");
  //604
  graph.addEdge("본관 2층 구석 계단 옆", "본관 2층 구석 계단 앞", 15.5242, 15.5242, "평지", "도보",
      node2X: 1240,
      node2Y: 2441,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 구석 계단 앞", "본관 2층 구석 계단 옆", 15.5242, 15.5242, "평지", "도보");
  //604
  graph.addEdge("본관 2층 구석 계단 앞", "본관 2층 구석 계단", 8.544, 8.544, "평지", "도보",
      node2X: 1243,
      node2Y: 2433,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 구석 계단", "본관 2층 구석 계단 앞", 8.544, 8.544, "평지", "도보");
  //본관 구석 계단 2층 - 3층 이동
  graph.addEdge("본관 2층 구석 계단", "본관 3층 구석 계단", 30, 30, "평지", "도보",
      node2X: 1235,
      node2Y: 2447,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 구석 계단", "본관 2층 구석 계단", 16, 16, "평지", "도보");
  //606
  graph.addEdge("본관 2층 갈림길", "본관 2층 중앙 계단 앞", 16.7631, 16.7631, "평지", "도보",
      node2X: 1212,
      node2Y: 2475,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중앙 계단 앞", "본관 2층 갈림길", 16.7631, 16.7631, "평지", "도보");
  //607
  graph.addEdge("본관 2층 중앙 계단 앞", "본관 2층 중앙 계단", 15.2971, 15.2971, "평지", "도보");
  graph.addEdge("본관 2층 중앙 계단", "본관 2층 중앙 계단 앞", 15.2971, 15.2971, "평지", "도보");
  //608
  graph.addEdge("본관 2층 중앙 계단 앞", "본관 2층 중도쪽", 161.012, 161.012, "평지", "도보",
      node2X: 1165,
      node2Y: 2629,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중도쪽", "본관 2층 중앙 계단 앞", 161.012, 161.012, "평지", "도보");
  //609
  graph.addEdge("본관 2층 중도쪽", "본관 2층 중도 쪽문 통로", 21.5407, 21.5407, "평지", "도보",
      node2X: 1185,
      node2Y: 2637,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중도 쪽문 통로", "본관 2층 중도쪽", 21.5407, 21.5407, "평지", "도보");
  //610
  graph.addEdge("본관 2층 중도 쪽문 통로", "본관 2층 중도 쪽문 안", 69.2604, 69.2604, "평지", "도보",
      node2X: 1164,
      node2Y: 2703,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중도 쪽문 안", "본관 2층 중도 쪽문 통로", 69.2604, 69.2604, "평지", "도보");
  //611
  graph.addEdge("본관 2층 중도 쪽문 안", "본관 2층 중도 쪽문", 6.08276, 6.08276, "평지", "도보");
  graph.addEdge("본관 2층 중도 쪽문", "본관 2층 중도 쪽문 안", 6.08276, 6.08276, "평지", "도보");
  //612
  graph.addEdge("본관 2층 중도쪽", "본관 2층 오른쪽", 95.5092, 95.5092, "평지", "도보",
      node2X: 1074,
      node2Y: 2600,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 오른쪽", "본관 2층 중도쪽", 95.5092, 95.5092, "평지", "도보");
  //613
  graph.addEdge("본관 2층 오른쪽", "본관 2층 엘베 앞", 175.864, 175.864, "평지", "도보");
  graph.addEdge("본관 2층 엘베 앞", "본관 2층 오른쪽", 175.864, 175.864, "평지", "도보");
  //614
  graph.addEdge("본관 2층 오른쪽", "본관 2층 오른쪽 계단 앞", 16.7631, 16.7631, "평지", "도보",
      node2X: 1058,
      node2Y: 2595,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 오른쪽 계단 앞", "본관 2층 오른쪽", 16.7631, 16.7631, "평지", "도보");
  //615
  graph.addEdge("본관 2층 오른쪽 계단 앞", "본관 2층 오른쪽 계단", 9.21954, 9.21954, "평지", "도보");
  graph.addEdge("본관 2층 오른쪽 계단", "본관 2층 오른쪽 계단 앞", 9.21954, 9.21954, "평지", "도보");
  //616
  graph.addEdge("본관 3층 엘베", "본관 3층 엘베 앞", 12.3693, 12.3693, "평지", "도보",
      node2X: 1126,
      node2Y: 2432,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 엘베 앞", "본관 3층 엘베", 12.3693, 12.3693, "평지", "도보");
  //617
  graph.addEdge("본관 3층 엘베 앞", "본관 3층 왼쪽 계단", 10.198, 10.198, "평지", "도보",
      node2X: 1126,
      node2Y: 2432,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 계단", "본관 3층 엘베 앞", 10.198, 10.198, "평지", "도보");
  //618
  graph.addEdge("본관 3층 엘베 앞", "본관 3층 오른쪽 갈림길", 99.7246, 99.7246, "평지", "도보",
      node2X: 1222,
      node2Y: 2459,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 갈림길", "본관 3층 엘베 앞", 99.7246, 99.7246, "평지", "도보");
  //619
  graph.addEdge("본관 3층 오른쪽 갈림길", "본관 3층 오른쪽 입구 안", 12.083, 12.083, "평지", "도보",
      node2X: 1233,
      node2Y: 2454,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 입구 안", "본관 3층 오른쪽 갈림길", 12.083, 12.083, "평지", "도보");
  //620
  graph.addEdge("본관 3층 오른쪽 입구 안", "본관 3층 구석 계단", 7.28011, 7.28011, "평지", "도보");
  graph.addEdge("본관 3층 구석 계단", "본관 3층 오른쪽 입구 안", 7.28011, 7.28011, "평지", "도보");
  //621
  graph.addEdge("본관 3층 오른쪽 입구 안", "본관 3층 오른쪽 입구", 23.7697, 23.7697, "평지", "도보");
  graph.addEdge("본관 3층 오른쪽 입구", "본관 3층 오른쪽 입구 안", 23.7697, 23.7697, "평지", "도보");
  //622
  graph.addEdge("본관 3층 오른쪽 갈림길", "본관 3층 왼쪽 입구 안", 156.605, 156.605, "평지", "도보",
      node2X: 1177,
      node2Y: 2609,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 입구 안", "본관 3층 오른쪽 갈림길", 156.605, 156.605, "평지", "도보");
  //623
  graph.addEdge("본관 3층 왼쪽 입구 안", "본관 3층 왼쪽 입구", 30.6757, 30.6757, "평지", "도보");
  graph.addEdge("본관 3층 왼쪽 입구", "본관 3층 왼쪽 입구 안", 30.6757, 30.6757, "평지", "도보");
  //624
  graph.addEdge("본관 3층 왼쪽 입구 안", "본관 3층 왼쪽 갈림길", 13.6015, 13.6015, "평지", "도보",
      node2X: 1164,
      node2Y: 2613,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 갈림길", "본관 3층 왼쪽 입구 안", 13.6015, 13.6015, "평지", "도보");
  //625
  graph.addEdge("본관 3층 왼쪽 갈림길", "본관 3층 왼쪽 안", 87.9318, 87.9318, "평지", "도보",
      node2X: 1080,
      node2Y: 2587,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 안", "본관 3층 왼쪽 갈림길", 87.9318, 87.9318, "평지", "도보");
  //626
  graph.addEdge("본관 3층 왼쪽 안", "본관 3층 엘베 앞", 161.682, 161.682, "평지", "도보");
  graph.addEdge("본관 3층 엘베 앞", "본관 3층 왼쪽 안", 161.682, 161.682, "평지", "도보");
  //627
  graph.addEdge("본관 3층 왼쪽 안", "본관 3층 오른쪽 계단 앞", 23.7065, 23.7065, "평지", "도보",
      node2X: 1059,
      node2Y: 2598,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 계단 앞", "본관 3층 왼쪽 안", 23.7065, 23.7065, "평지", "도보");
  //628
  graph.addEdge("본관 3층 오른쪽 계단 앞", "본관 3층 오른쪽 계단", 6.7082, 6.7082, "평지", "도보");
  graph.addEdge("본관 3층 오른쪽 계단", "본관 3층 오른쪽 계단 앞", 6.7082, 6.7082, "평지", "도보");
  //왼쪽 입구
  graph.addEdge("본관 3층 왼쪽 입구", "본관", 100000, 100000, "평지", "도보",
      node2X: 1149,
      node2Y: 2551,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관", "본관 3층 왼쪽 입구", 100000, 100000, "평지", "도보");
  //오른쪽 입구
  graph.addEdge("본관 3층 오른쪽 입구", "본관", 100000, 100000, "평지", "도보");
  graph.addEdge("본관", "본관 3층 오른쪽 입구", 100000, 100000, "평지", "도보");
  //1층 입구
  graph.addEdge("본관 1층 입구", "본관", 100000, 100000, "평지", "도보");
  graph.addEdge("본관", "본관 1층 입구", 100000, 100000, "평지", "도보");
  //1층 쪽문
  graph.addEdge("본관 1층 쪽문", "본관", 100000, 100000, "평지", "도보");
  graph.addEdge("본관", "본관 1층 쪽문", 100000, 100000, "평지", "도보");
  //2층 중도 쪽문
  graph.addEdge("본관 2층 중도 쪽문", "본관", 100000, 100000, "평지", "도보");
  graph.addEdge("본관", "본관 2층 중도 쪽문", 100000, 100000, "평지", "도보");
  //**************************************************************************
  //다향관
  //입구: 1층 왼쪽 계단 입구, 2층 왼쪽 계단 입구, 3층 왼쪽 계단 입구
  //631
  graph.addEdge("다향관 1층 왼쪽 계단 입구", "다향관 1층 왼쪽 계단", 8.544, 8.544, "평지", "도보",
      node2X: 1360,
      node2Y: 2420,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 왼쪽 계단", "다향관 1층 왼쪽 계단 입구", 8.544, 8.544, "평지", "도보");
  //다향관 왼쪽 계단 1층 - 2층 이동
  graph.addEdge("다향관 1층 왼쪽 계단", "다향관 2층 왼쪽 계단", 30, 30, "계단위", "도보",
      node2X: 1360,
      node2Y: 2420,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 2층 왼쪽 계단", "다향관 1층 왼쪽 계단", 16, 16, "계단아래", "도보");
  //다향관 왼쪽 계단 2층 - 3층 이동
  graph.addEdge("다향관 2층 왼쪽 계단", "다향관 3층 왼쪽 계단", 30, 30, "계단위", "도보",
      node2X: 1360,
      node2Y: 2420,
      isInside2: 3,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 3층 왼쪽 계단", "다향관 2층 왼쪽 계단", 16, 16, "계단아래", "도보");
  //632
  graph.addEdge("다향관 1층 왼쪽 계단", "다향관 1층 입구 안", 12.3693, 12.3693, "평지", "도보",
      node2X: 1372,
      node2Y: 2423,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 안", "다향관 1층 왼쪽 계단", 12.3693, 12.3693, "평지", "도보");
  //633
  graph.addEdge("다향관 1층 입구 안", "다향관 1층 길1", 32.8938, 32.8938, "평지", "도보",
      node2X: 1383,
      node2Y: 2392,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길1", "다향관 1층 입구 안", 32.8938, 32.8938, "평지", "도보");
  //634
  graph.addEdge("다향관 1층 길1", "다향관 1층 길2", 55.3624, 55.3624, "평지", "도보",
      node2X: 1436,
      node2Y: 2408,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길2", "다향관 1층 길1", 55.3624, 55.3624, "평지", "도보");
  //635
  graph.addEdge("다향관 1층 길2", "다향관 1층 길3", 16.4924, 16.4924, "평지", "도보",
      node2X: 1432,
      node2Y: 2424,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길3", "다향관 1층 길2", 16.4924, 16.4924, "평지", "도보");
  //636
  graph.addEdge("다향관 1층 길3", "다향관 1층 길4", 40.1622, 40.1622, "평지", "도보",
      node2X: 1470,
      node2Y: 2437,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길4", "다향관 1층 길3", 40.1622, 40.1622, "평지", "도보");
  //637
  graph.addEdge("다향관 1층 길4", "다향관 1층 길5", 20.2237, 20.2237, "평지", "도보",
      node2X: 1467,
      node2Y: 2457,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길5", "다향관 1층 길4", 20.2237, 20.2237, "평지", "도보");
  //638
  graph.addEdge("다향관 1층 길5", "다향관 1층 길6", 86.977, 86.977, "평지", "도보",
      node2X: 1550,
      node2Y: 2483,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길6", "다향관 1층 길5", 86.977, 86.977, "평지", "도보");
  //639
  graph.addEdge("다향관 1층 길6", "다향관 1층 길7", 8.24621, 8.24621, "평지", "도보",
      node2X: 1548,
      node2Y: 2491,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길7", "다향관 1층 길6", 8.24621, 8.24621, "평지", "도보");
  //640
  graph.addEdge("다향관 1층 길7", "다향관 1층 길8", 8.544, 8.544, "평지", "도보",
      node2X: 1556,
      node2Y: 2494,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길8", "다향관 1층 길7", 8.544, 8.544, "평지", "도보");
  //641
  graph.addEdge("다향관 1층 길8", "다향관 1층 오른쪽 계단 앞", 24.0416, 24.0416, "평지", "도보",
      node2X: 1549,
      node2Y: 2517,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 오른쪽 계단 앞", "다향관 1층 길8", 24.0416, 24.0416, "평지", "도보");
  //642
  graph.addEdge("다향관 1층 오른쪽 계단 앞", "다향관 1층 오른쪽 계단", 27.0416, 27.0416, "계단위", "도보",
      node2X: 1566,
      node2Y: 2523,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 오른쪽 계단", "다향관 1층 오른쪽 계단 앞", 14.4222, 14.4222, "계단아래", "도보");
  //다향관 오른쪽 계단 1층 - 2층 이동
  graph.addEdge("다향관 1층 오른쪽 계단", "다향관 2층 오른쪽 계단", 9.21954, 9.21954, "평지", "도보",
      node2X: 1568,
      node2Y: 2514,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 2층 오른쪽 계단", "다향관 1층 오른쪽 계단", 9.21954, 9.21954, "평지", "도보");
  //643
  graph.addEdge("다향관 2층 왼쪽 계단", "다향관 2층 왼쪽 계단 입구", 8.544, 8.544, "평지", "도보");
  graph.addEdge("다향관 2층 왼쪽 계단 입구", "다향관 2층 왼쪽 계단", 8.544, 8.544, "평지", "도보");
  //644
  graph.addEdge("다향관 2층 오른쪽 계단", "다향관 2층 세미나실 오른쪽", 30.9233, 30.9233, "계단위", "도보",
      node2X: 1548,
      node2Y: 2509,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 2층 세미나실 오른쪽", "다향관 2층 오른쪽 계단", 16.4924, 16.4924, "계단아래", "도보");
  //645
  graph.addEdge("다향관 2층 세미나실 오른쪽", "다향관 2층 세미나실 왼쪽", 8.544, 8.544, "평지", "도보",
      node2X: 1545,
      node2Y: 2517,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 2층 세미나실 왼쪽", "다향관 2층 세미나실 오른쪽", 8.544, 8.544, "평지", "도보");
  //646
  graph.addEdge("다향관 2층 세미나실 왼쪽", "다향관 3층 오른쪽 계단", 26.5801, 26.5801, "계단위", "도보",
      node2X: 1561,
      node2Y: 2522,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 3층 오른쪽 계단", "다향관 2층 세미나실 왼쪽", 14.176, 14.176, "계단아래", "도보");
  //647
  graph.addEdge("다향관 3층 오른쪽 계단", "다향관 3층 오른쪽 계단 앞", 23.2863, 23.2863, "계단위", "도보",
      node2X: 1576,
      node2Y: 2526,
      isInside2: 3,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 3층 오른쪽 계단 앞", "다향관 3층 오른쪽 계단", 12.4193, 12.4193, "계단아래", "도보");
  //648
  graph.addEdge("다향관 3층 오른쪽 계단 앞", "다향관 3층 오른쪽 입구", 8.94427, 8.94427, "평지", "도보");
  graph.addEdge("다향관 3층 오른쪽 입구", "다향관 3층 오른쪽 계단 앞", 8.94427, 8.94427, "평지", "도보");
  //649
  graph.addEdge("다향관 3층 왼쪽 계단 입구", "다향관 3층 왼쪽 계단 입구 안", 12.083, 12.083, "평지", "도보",
      node2X: 1358,
      node2Y: 2435,
      isInside2: 3,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 3층 왼쪽 계단 입구 안", "다향관 3층 왼쪽 계단 입구", 12.083, 12.083, "평지", "도보");
  //650
  graph.addEdge("다향관 3층 왼쪽 계단 입구 안", "다향관 3층 왼쪽 계단", 15.1327, 15.1327, "평지", "도보");
  graph.addEdge("다향관 3층 왼쪽 계단", "다향관 3층 왼쪽 계단 입구 안", 15.1327, 15.1327, "평지", "도보");
  //다향관 1층 왼쪽 계단 입구
  graph.addEdge("다향관 1층 왼쪽 계단 입구", "다향관", 100000, 100000, "평지", "도보",
      node2X: 1456,
      node2Y: 2468,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관", "다향관 1층 왼쪽 계단 입구", 100000, 100000, "평지", "도보");
  //다향관 2층 왼쪽 계단 입구
  graph.addEdge("다향관 2층 왼쪽 계단 입구", "다향관", 100000, 100000, "평지", "도보");
  graph.addEdge("다향관", "다향관 2층 왼쪽 계단 입구", 100000, 100000, "평지", "도보");
  //다향관 3층 왼쪽 계단 입구
  graph.addEdge("다향관 3층 왼쪽 계단 입구", "다향관", 100000, 100000, "평지", "도보");
  graph.addEdge("다향관", "다향관 3층 왼쪽 계단 입구", 100000, 100000, "평지", "도보");
  //다향관 3층 오른쪽 입구
  graph.addEdge("다향관 3층 오른쪽 입구", "다향관", 100000, 100000, "평지", "도보");
  graph.addEdge("다향관", "다향관 3층 오른쪽 입구", 100000, 100000, "평지", "도보");

//--------------------------실내 노드가 필요없는 건물---------------------------
//      중앙도서관
//후문
  graph.addEdge("중도 후문", "중앙도서관", 100000, 100000, "평지", "도보",
      node2X: 1012,
      node2Y: 2786,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중앙도서관", "중도 후문", 100000, 100000, "평지", "도보");
//정문
  graph.addEdge("중도 정문", "중앙도서관", 100000, 100000, "평지", "도보");
  graph.addEdge("중앙도서관", "중도 정문", 100000, 100000, "평지", "도보");
//      정q
//정Q 입구
  graph.addEdge("정Q 입구", "정보문화관q", 100000, 100000, "평지", "도보",
      node2X: 741,
      node2Y: 1928,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정보문화관q", "정Q 입구", 100000, 100000, "평지", "도보");
//      학생회관
//계단 입구
  graph.addEdge("학생회관 계단 입구", "학생회관", 100000, 100000, "평지", "도보",
      node2X: 759,
      node2Y: 1843,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관", "학생회관 계단 입구", 100000, 100000, "평지", "도보");
//입구
  graph.addEdge("학생회관 입구", "학생회관", 100000, 100000, "평지", "도보");
  graph.addEdge("학생회관", "학생회관 입구", 100000, 100000, "평지", "도보");
//      체육관
//정문
  graph.addEdge("체육관 정문", "체육관", 100000, 100000, "평지", "도보",
      node2X: 1432,
      node2Y: 1958,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("체육관", "체육관 정문", 100000, 100000, "평지", "도보");
//옆문
  graph.addEdge("체육관 옆문", "체육관", 100000, 100000, "평지", "도보");
  graph.addEdge("체육관", "체육관 옆문", 100000, 100000, "평지", "도보");
//      상록원
//상록원 옆입구
  graph.addEdge("상록원 옆입구", "상록원", 100000, 100000, "평지", "도보",
      node2X: 1182,
      node2Y: 3225,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원", "상록원 옆입구", 100000, 100000, "평지", "도보");
//상록원 정문
  graph.addEdge("상록원 정문", "상록원", 100000, 100000, "평지", "도보");
  graph.addEdge("상록원", "상록원 정문", 100000, 100000, "평지", "도보");
//상록원 후문
  graph.addEdge("상록원 후문", "상록원", 100000, 100000, "평지", "도보");
  graph.addEdge("상록원", "상록원 후문", 100000, 100000, "평지", "도보");
//      정각원
//정각원 입구
  graph.addEdge("정각원 입구", "정각원", 100000, 100000, "평지", "도보",
      node2X: 1752,
      node2Y: 3007,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원", "정각원 입구", 100000, 100000, "평지", "도보");
//      대운동장
//대운동장 입구
  graph.addEdge("대운동장 입구", "대운동장", 100000, 100000, "평지", "도보",
      node2X: 1571,
      node2Y: 3414,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장", "대운동장 입구", 100000, 100000, "평지", "도보");
}

Graph initDriveWayGraph(){
  Graph graph = Graph(); // for init
  Graph newGraph = Graph(); // for return
  initGraph(graph);

  for (Edge edge in graph.edges){
    if (edge.edgeAttribute == "차도"){
      newGraph.edges.add(edge);
      if(!newGraph.nodeExists(edge.node1.name)){
        newGraph.nodes.add(edge.node1);
      }
      if (!newGraph.nodeExists(edge.node2.name)) {
        newGraph.nodes.add(edge.node2);
      }
    }
  }
  return newGraph;
}