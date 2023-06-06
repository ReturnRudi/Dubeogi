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
  '혜화관',
  '정문',
  '후문',
  '충무로 방향 입구',
  '동대입구 방향 입구',
  'DUICA쪽 입구'
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
  graph.addEdge("신공 9층 입구", "신공 9층 입구 앞", 6.61516, 0.441011, "평지", "도보",
      node1X: 905,
      node1Y: 2621,
      isInside1: 0,
      building1: "실외",
      showRoute1: true,
      node2X: 933,
      node2Y: 2645,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 9층 입구 앞", "신공 9층 입구", 6.61516, 0.441011,"평지", "도보");
//61
  graph.addEdge("신공 9층 입구 앞", "신공 중도 갈림길", 9.24628, 0.616419, "평지", "도보",
      node2X: 982,
      node2Y: 2661,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 중도 갈림길", "신공 9층 입구 앞", 9.24628, 0.616419, "평지", "도보");
//2
  graph.addEdge("신공 중도 갈림길", "중도 후문", 2.26898, 0.151266, "평지", "도보",
      node2X: 978,
      node2Y: 2673,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("중도 후문", "신공 중도 갈림길", 2.26898, 0.151266, "평지", "도보");
//3
  graph.addEdge("신공 중도 갈림길", "신공 중도 갈림길2", 15.9445, 1.06297, "평지", "도보",
      node2X: 1067,
      node2Y: 2687,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 중도 갈림길2", "신공 중도 갈림길", 15.9445, 1.06297, "평지", "도보");
//4
  graph.addEdge("신공 중도 갈림길2", "중도 옆 계단 아래", 3.97072, 0.264715, "평지", "도보",
      node2X: 1088,
      node2Y: 2694,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆 계단 아래", "신공 중도 갈림길2", 3.97072, 0.264715, "평지", "도보");
//5
  graph.addEdge("중도 옆 계단 아래", "중도 옆 계단 위", 14, 2.1, "계단위", "도보",
      node2X: 1139,
      node2Y: 2712,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆 계단 위", "중도 옆 계단 아래", 10, 0.63, "계단아래", "도보");
//6
  graph.addEdge("중도 옆 계단 위", "중도 정문 앞", 7.88655, 0.52577, "평지", "도보",
      node2X: 1126,
      node2Y: 2754,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 정문 앞", "중도 옆 계단 위", 7.88655, 0.52577, "평지", "도보");
//7
  graph.addEdge("중도 정문 앞", "중도 정문", 1.82931, 0.121954, "평지", "도보",
      node2X: 1116,
      node2Y: 2752,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("중도 정문", "중도 정문 앞", 1.82931, 0.121954, "평지", "도보");
//8
  graph.addEdge("신공 중도 갈림길2", "중도 옆옆 계단 앞", 2.43982, 0.162654, "평지", "도보",
      node2X: 1071,
      node2Y: 2674,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆옆 계단 앞", "신공 중도 갈림길2", 2.43982, 0.162654, "평지", "도보");
//9
  graph.addEdge("중도 옆옆 계단 앞", "중도 옆옆 계단 위", 2.43982, 0.162654, "평지", "도보",
      node2X: 1058,
      node2Y: 2670,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆옆 계단 위", "중도 옆옆 계단 앞", 2.43982, 0.162654, "평지", "도보");
//10
  graph.addEdge("중도 옆옆 계단 위", "중도 옆옆 계단 아래", 3.80952, 0.24, "계단아래", "도보",
      node2X: 1047,
      node2Y: 2665,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("중도 옆옆 계단 아래", "중도 옆옆 계단 위", 5.33333, 0.8, "계단위", "도보");
//11
  graph.addEdge("중도 옆옆 계단 아래", "지하주차장 앞", 12.0665, 0.804432, "평지", "도보",
      node2X: 1002,
      node2Y: 2615,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("지하주차장 앞", "중도 옆옆 계단 아래", 12.0665, 0.804432, "평지", "도보");
//12
  graph.addEdge("중도 옆옆 계단 앞", "본관 2층 중도 쪽문", 16.3943, 1.09295, "평지", "도보",
      node2X: 1158,
      node2Y: 2702,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("본관 2층 중도 쪽문", "중도 옆옆 계단 앞", 16.3943, 1.09295, "평지", "도보");
//13
  graph.addEdge("중도 옆 계단 위", "팔정도 좌측 하단", 14.6806, 0.978706, "평지", "도보",
      node2X: 1212,
      node2Y: 2749,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("팔정도 좌측 하단", "중도 옆 계단 위", 14.6806, 0.978706, "평지", "도보");
//14
  graph.addEdge("중도 옆 계단 위", "팔정도 좌측 하단3", 7.86817, 0.524545, "평지", "도보",
      node2X: 1169,
      node2Y: 2744,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("팔정도 좌측 하단3", "중도 옆 계단 위", 7.86817, 0.524545, "평지", "도보");
//15
  graph.addEdge("팔정도 좌측 하단3", "팔정도 좌측 하단2", 3.42703, 0.228469, "평지", "차도",
      node2X: 1188,
      node2Y: 2742,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 좌측 하단2", "팔정도 좌측 하단3", 3.42703, 0.228469, "평지", "차도");
//16
  graph.addEdge("팔정도 좌측 하단", "팔정도 좌측 하단2", 4.48447, 0.298965, "평지", "차도");
  graph.addEdge("팔정도 좌측 하단2", "팔정도 좌측 하단", 4.48447, 0.298965, "평지", "차도");
//17
  graph.addEdge("팔정도 좌측 하단3", "상록원 가는 길 명진관 계단 앞", 34.8438, 2.32292, "평지", "차도",
      node2X: 1113,
      node2Y: 2930,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 앞", "팔정도 좌측 하단3", 34.8438, 2.32292, "평지", "차도");
//18
  graph.addEdge("상록원 가는 길 명진관 계단 앞", "상록원 가는 길 명진관 계단 아래", 9.47317, 0.631545, "평지", "도보",
      node2X: 1163,
      node2Y: 2947,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 아래", "상록원 가는 길 명진관 계단 앞", 9.47317, 0.631545, "평지", "도보");
//19
  graph.addEdge("상록원 가는 길 명진관 계단 아래", "상록원 가는 길 명진관 계단 중간", 3.33333, 0.5, "계단위", "도보",
      node2X: 1162,
      node2Y: 2960,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 중간", "상록원 가는 길 명진관 계단 아래", 2.38095, 0.15, "계단아래", "도보");
//20
  graph.addEdge("상록원 가는 길 명진관 계단 중간", "상록원 가는 길 명진관 계단 위", 7.33333, 1.1, "계단위", "도보",
      node2X: 1173,
      node2Y: 2950,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길 명진관 계단 위", "상록원 가는 길 명진관 계단 중간", 5.2381, 0.33, "계단아래", "도보");
//21
  graph.addEdge("상록원 가는 길 명진관 계단 앞", "상록원 가는 길", 9.39815, 0.626543, "평지", "차도",
      node2X: 1101,
      node2Y: 2981,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길", "상록원 가는 길 명진관 계단 앞", 9.39815, 0.626543, "평지", "차도");
//22
  graph.addEdge("상록원 가는 길", "상록원 가는 길2", 23.6814, 2.50935, "오르막", "차도",
      node2X: 1102,
      node2Y: 3089,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길2", "상록원 가는 길", 19.3737, 1.29158, "내리막", "차도");
//23
  graph.addEdge("상록원 가는 길2", "상록원 가는 길3", 7.49108, 0.499405, "평지", "차도",
      node2X: 1090,
      node2Y: 3129,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길3", "상록원 가는 길2", 7.49108, 0.499405, "평지", "차도");
//24
  graph.addEdge("상록원 가는 길3", "상록원 가는 길4", 6.41013, 0.427342, "평지", "차도",
      node2X: 1079,
      node2Y: 3163,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 가는 길4", "상록원 가는 길3", 6.41013, 0.427342, "평지", "차도");
//25
  graph.addEdge("상록원 가는 길4", "상록원 옆입구", 5.79035, 0.386024, "평지", "도보",
      node2X: 1110,
      node2Y: 3172,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("상록원 옆입구", "상록원 가는 길4", 5.79035, 0.386024, "평지", "도보");
//26
  graph.addEdge("상록원 가는 길3", "상록원 과학관 갈림길", 5.16474, 0.344316, "평지", "도보",
      node2X: 1117 ,
      node2Y: 3139,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 과학관 갈림길", "상록원 가는 길3", 5.16474, 0.344316, "평지", "도보");
//27
  graph.addEdge("상록원 과학관 갈림길", "상록원 앞", 3.00694, 0.200462, "평지", "도보",
      node2X: 1133 ,
      node2Y: 3144,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 앞", "상록원 과학관 갈림길", 3.00694, 0.200462, "평지", "도보");
//28
  graph.addEdge("상록원 앞", "상록원 정문", 1.65379, 0.110253, "평지", "도보",
      node2X: 1127 ,
      node2Y: 3151,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("상록원 정문", "상록원 앞", 1.65379, 0.110253, "평지", "도보");
//29
  graph.addEdge("상록원 앞", "상록원 옆 갈림길", 11.7709, 0.784724, "평지", "도보",
      node2X: 1198,
      node2Y: 3135,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 옆 갈림길", "상록원 앞", 11.7709, 0.784724, "평지", "도보");
//30
  graph.addEdge("상록원 옆 갈림길", "상록원 후문 앞", 13.7854, 0.919024, "평지", "도보",
      node2X: 1263,
      node2Y: 3176,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 후문 앞", "상록원 옆 갈림길", 13.7854, 0.919024, "평지", "도보");
//31
  graph.addEdge("상록원 후문 앞", "대운동장 상록원 계단 위", 7.31945, 0.487963, "평지", "도보",
      node2X: 1287,
      node2Y: 3143,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 상록원 계단 위", "상록원 후문 앞", 7.31945, 0.487963, "평지", "도보");
//32
  graph.addEdge("상록원 후문 앞", "상록원 후문", 3.48291, 0.232194, "평지", "도보",
      node2X: 1252,
      node2Y: 3192,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("상록원 후문", "상록원 후문 앞", 3.48291, 0.232194, "평지", "도보");
//33
  graph.addEdge("상록원 옆 갈림길", "상록원 옆 길", 7.44152, 0.496101, "평지", "도보",
      node2X: 1238,
      node2Y: 3124,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("상록원 옆 길", "상록원 옆 갈림길", 7.44152, 0.496101, "평지", "도보");
//34
  graph.addEdge("대운동장 상록원 계단 위", "상록원 옆 길", 9.42721, 0.62848, "평지", "도보");
  graph.addEdge("상록원 옆 길", "대운동장 상록원 계단 위", 9.42721, 0.62848, "평지", "도보");
//35
  graph.addEdge("대운동장 상록원 계단 위", "대운동장 상록원 계단 갈림길", 22.8571, 1.44, "계단아래", "도보",
      node2X: 1423,
      node2Y: 3193,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 상록원 계단 갈림길", "대운동장 상록원 계단 위", 32, 4.8, "계단위", "도보");
//36
  graph.addEdge("대운동장 상록원 계단 갈림길", "대운동장 상록원 계단 아래", 13.3333, 0.84, "계단아래", "도보",
      node2X: 1475,
      node2Y: 3212,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 상록원 계단 아래", "대운동장 상록원 계단 갈림길", 18.6667, 2.8, "계단위", "도보");
//37
  graph.addEdge("대운동장 상록원 계단 갈림길", "과학관 우측 입구 앞", 14, 2.1, "계단위", "도보",
      node2X: 1444,
      node2Y: 3124,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 우측 입구 앞", "대운동장 상록원 계단 갈림길", 10, 0.63, "계단아래", "도보");
//38
  graph.addEdge("과학관 우측 입구 앞", "과학관 우측 입구", 4.31256, 0.287504, "평지", "도보",
      node2X: 1421,
      node2Y: 3117,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("과학관 우측 입구", "과학관 우측 입구 앞", 4.31256, 0.287504, "평지", "도보");
//39
  graph.addEdge("과학관 우측 입구 앞", "명진관 과학관 우측 하단", 8.45367, 0.563578, "평지", "도보",
      node2X: 1458,
      node2Y: 3079,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 우측 하단", "과학관 우측 입구 앞", 8.45367, 0.563578, "평지", "도보");
//40
  graph.addEdge("상록원 과학관 갈림길", "과학관 좌측 입구 앞", 20.4208, 1.36139, "평지", "도보",
      node2X: 1153,
      node2Y: 3031,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 좌측 입구 앞", "상록원 과학관 갈림길", 20.4208, 1.36139, "평지", "도보");
//41
  graph.addEdge("과학관 좌측 입구 앞", "과학관 좌측 입구", 1.70174, 0.113449, "평지", "도보",
      node2X: 1162,
      node2Y: 3034,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("과학관 좌측 입구", "과학관 좌측 입구 앞", 1.70174, 0.113449, "평지", "도보");
//42
  graph.addEdge("과학관 좌측 입구 앞", "명진관 과학관 좌측 하단", 8.11181, 0.540787, "평지", "도보",
      node2X: 1167,
      node2Y: 2988,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 좌측 하단", "과학관 좌측 입구 앞", 8.11181, 0.540787, "평지", "도보");
//43
  graph.addEdge("명진관 과학관 좌측 하단", "상록원 가는 길 명진관 계단 위", 6.90084, 0.460056, "평지", "도보");
  graph.addEdge("상록원 가는 길 명진관 계단 위", "명진관 과학관 좌측 하단", 6.90084, 0.460056, "평지", "도보");
//44
  graph.addEdge("명진관 과학관 좌측 하단", "과학관 정문 앞", 25.9282, 1.72854, "평지", "차도",
      node2X: 1305,
      node2Y: 3031,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 정문 앞", "명진관 과학관 좌측 하단", 25.9282, 1.72854, "평지", "차도");
//45
  graph.addEdge("과학관 정문 앞", "과학관 정문", 2.33881, 0.155921, "평지", "도보",
      node2X: 1304,
      node2Y: 3044,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 정문", "과학관 정문 앞", 2.33881, 0.155921, "평지", "도보");
//46
  graph.addEdge("과학관 정문 앞", "명진관 과학관 우측 하단", 28.7639, 1.91759, "평지", "차도");
  graph.addEdge("명진관 과학관 우측 하단", "과학관 정문 앞", 28.7639, 1.91759, "평지", "차도");
//47
  graph.addEdge("과학관 정문 앞", "명진관 과학관 중앙", 10.2262, 0.681744, "평지", "도보",
      node2X: 1304,
      node2Y: 2974,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙", "과학관 정문 앞", 10.2262, 0.681744, "평지", "도보");
//48
  graph.addEdge("명진관 과학관 중앙", "명진관 과학관 중앙 왼쪽", 20.6481, 1.37654, "평지", "도보",
      node2X: 1195,
      node2Y: 2937,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙 왼쪽", "명진관 과학관 중앙", 20.6481, 1.37654, "평지", "도보");
//49
  graph.addEdge("명진관 과학관 중앙", "명진관 과학관 중앙 오른쪽", 17.7549, 1.18366, "평지", "도보",
      node2X: 1398,
      node2Y: 3005,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙 오른쪽", "명진관 과학관 중앙", 17.7549, 1.18366, "평지", "도보");
//50
  graph.addEdge("명진관 과학관 중앙", "명진관 후문", 6.81875, 0.454584, "평지", "도보",
      node2X: 1303,
      node2Y: 2936,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("명진관 후문", "명진관 과학관 중앙", 6.81875, 0.454584, "평지", "도보");
//51
  graph.addEdge("상록원 가는 길 명진관 계단 위", "명진관 왼쪽길", 1.53261, 0.102174, "평지", "도보",
      node2X: 1176,
      node2Y: 2942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽길", "상록원 가는 길 명진관 계단 위", 1.53261, 0.102174, "평지", "도보");
//52
  graph.addEdge("명진관 왼쪽길", "명진관 과학관 중앙 왼쪽 끝", 1.60441, 0.106961, "평지", "도보",
      node2X: 1180,
      node2Y: 2934,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 과학관 중앙 왼쪽 끝", "명진관 왼쪽길", 1.60441, 0.106961, "평지", "도보");
//53
  graph.addEdge("명진관 과학관 중앙 왼쪽 끝", "명진관 과학관 중앙 왼쪽", 2.74397, 0.182931, "평지", "도보");
  graph.addEdge("명진관 과학관 중앙 왼쪽", "명진관 과학관 중앙 왼쪽 끝", 2.74397, 0.182931, "평지", "도보");
//54
  graph.addEdge("명진관 과학관 중앙 왼쪽", "명진관 왼쪽 후문 앞", 3.97072, 0.264715, "평지", "도보",
      node2X: 1202,
      node2Y: 2916,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 후문 앞", "명진관 과학관 중앙 왼쪽", 3.97072, 0.264715, "평지", "도보");
//55
  graph.addEdge("명진관 왼쪽 후문 앞", "명진관 왼쪽 후문", 3.74554, 0.249703, "평지", "도보",
      node2X: 1182,
      node2Y: 2910,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("명진관 왼쪽 후문", "명진관 왼쪽 후문 앞", 3.74554, 0.249703, "평지", "도보");
//56
  graph.addEdge("명진관 과학관 중앙 오른쪽", "명진관 오른쪽 후문 앞", 3.97072, 0.264715, "평지", "도보",
      node2X: 1405,
      node2Y: 2984,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 후문 앞", "명진관 과학관 중앙 오른쪽", 3.97072, 0.264715, "평지", "도보");
//57
  graph.addEdge("명진관 오른쪽 후문 앞", "명진관 오른쪽 후문", 3.74554, 0.249703, "평지", "도보",
      node2X: 1425,
      node2Y: 2990,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("명진관 오른쪽 후문", "명진관 오른쪽 후문 앞", 3.74554, 0.249703, "평지", "도보");
//58
  graph.addEdge("명진관 과학관 중앙 오른쪽", "명진관 오른쪽길", 3.52423, 0.234949, "평지", "도보",
      node2X: 1393,
      node2Y: 3024,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽길", "명진관 과학관 중앙 오른쪽", 3.52423, 0.234949, "평지", "도보");
//59
  graph.addEdge("명진관 오른쪽길", "명진관 오른쪽 아래", 11.5152, 0.767682, "평지", "도보",
      node2X: 1454,
      node2Y: 3044,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 아래", "명진관 오른쪽길", 11.5152, 0.767682, "평지", "도보");
//60, 61 다른곳에
//62
  graph.addEdge("명진관 오른쪽 아래", "명진관 우측 입구 앞", 14.8104, 0.987362, "평지", "도보",
      node2X: 1478,
      node2Y: 2965,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 우측 입구 앞", "명진관 오른쪽 아래", 14.8104, 0.987362, "평지", "도보");
//63
  graph.addEdge("명진관 우측 입구 앞", "명진관 우측 입구", 1.65379, 0.110253, "평지", "도보",
      node2X: 1469,
      node2Y: 2963,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("명진관 우측 입구", "명진관 우측 입구 앞", 1.65379, 0.110253, "평지", "도보");
//64
  graph.addEdge("명진관 우측 입구 앞", "명진관 오른쪽 위", 8.62885, 0.575257, "평지", "도보",
      node2X: 1495,
      node2Y: 2920,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 위", "명진관 우측 입구 앞", 8.62885, 0.575257, "평지", "도보");
//65
  graph.addEdge("명진관 오른쪽 위", "명진관 오른쪽 계단 위", 9.16764, 0.611176, "평지", "도보",
      node2X: 1451,
      node2Y: 2894,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 계단 위", "명진관 오른쪽 위", 9.16764, 0.611176, "평지", "도보");
//66
  graph.addEdge("명진관 오른쪽 계단 위", "명진관 정문 앞", 22.2386, 1.48258, "평지", "도보",
      node2X: 1334,
      node2Y: 2853,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 정문 앞", "명진관 오른쪽 계단 위", 22.2386, 1.48258, "평지", "도보");
//67
  graph.addEdge("명진관 정문 앞", "명진관 정문", 3.97072, 0.264715, "평지", "도보",
      node2X: 1327,
      node2Y: 2874,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("명진관 정문", "명진관 정문 앞", 3.97072, 0.264715, "평지", "도보");
//68
  graph.addEdge("명진관 정문 앞", "명진관 왼쪽 계단 위", 21.2259, 1.41506, "평지", "도보",
      node2X: 1223,
      node2Y: 2812,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 계단 위", "명진관 정문 앞", 21.2259, 1.41506, "평지", "도보");
//69
  graph.addEdge("팔정도 좌측 하단3", "명진관 왼쪽 계단 위", 23.2729, 2.62067, "오르막", "도보");
  graph.addEdge("명진관 왼쪽 계단 위", "팔정도 좌측 하단3", 15.576, 1.0384, "내리막", "도보");
//70
  graph.addEdge("명진관 왼쪽 계단 위", "명진관 좌측 상단", 10.0596, 0.670641, "평지", "도보",
      node2X: 1167,
      node2Y: 2815,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 상단", "명진관 왼쪽 계단 위", 10.0596, 0.670641, "평지", "도보");
//60
  graph.addEdge("명진관 좌측 상단", "명진관 좌측 입구 앞", 11.1749, 0.744992, "평지", "도보",
      node2X: 1147,
      node2Y: 2874,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구 앞", "명진관 좌측 상단", 11.1749, 0.744992, "평지", "도보");
//71
  graph.addEdge("명진관 좌측 입구 앞", "명진관 좌측 입구", 1.13449, 0.0756328, "평지", "도보",
      node2X: 1153,
      node2Y: 2876  ,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("명진관 좌측 입구", "명진관 좌측 입구 앞", 1.13449, 0.0756328, "평지", "도보");
//72
  graph.addEdge("명진관 좌측 입구 앞", "명진관 좌측 하단", 9.64318, 0.642878, "평지", "도보",
      node2X: 1130,
      node2Y: 2925,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구", "명진관 좌측 하단", 9.64318, 0.642878, "평지", "도보");
//73
  graph.addEdge("명진관 좌측 하단", "명진관 왼쪽길", 8.79688, 0.586459, "평지", "도보");
  graph.addEdge("명진관 왼쪽길", "명진관 좌측 하단", 8.79688, 0.586459, "평지", "도보");
//74
  graph.addEdge("명진관 정문 앞", "명진관 중앙 계단 아래", 8.09524, 0.51, "계단아래", "도보",
      node2X: 1351,
      node2Y: 2792,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("명진관 중앙 계단 아래", "명진관 정문 앞", 11.3333, 1.7, "계단위", "도보");
//75
  graph.addEdge("명진관 오른쪽 계단 위", "명진관 오른쪽 계단 아래", 15.2736, 1.01824, "내리막", "도보",
      node2X: 1522,
      node2Y: 2847,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("명진관 오른쪽 계단 아래", "명진관 오른쪽 계단 위", 20.4162, 2.3067, "오르막", "도보");
//76
  graph.addEdge("명진관 과학관 우측 하단", "과학관 차도 입구 앞", 31.4256, 2.09504, "평지", "차도",
      node2X: 1514,
      node2Y: 2913,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 차도 입구 앞", "명진관 과학관 우측 하단", 31.4256, 2.09504, "평지", "차도");
//77
  graph.addEdge("과학관 차도 입구 앞", "과학관 차도 입구", 6.4676, 0.431173, "평지", "차도",
      node2X: 1544,
      node2Y: 2893,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("과학관 차도 입구", "과학관 차도 입구 앞", 6.4676, 0.431173, "평지", "차도");
//78
  graph.addEdge("명진관 오른쪽 계단 아래", "과학관 차도 입구", 9.14656, 0.609771, "평지", "차도");
  graph.addEdge("과학관 차도 입구", "명진관 오른쪽 계단 아래", 9.14656, 0.609771, "평지", "차도");
//79
  graph.addEdge("과학관 차도 입구", "만해관 내려가는 길1", 26.1678, 1.74452, "내리막", "차도",
      node2X: 1528,
      node2Y: 3038,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 내려가는 길1", "과학관 차도 입구", 34.9786, 3.95201, "오르막", "차도");
//80
  graph.addEdge("만해관 내려가는 길1", "만해관 내려가는 길2", 14.2626, 0.950839, "평지", "차도",
      node2X: 1519,
      node2Y: 3117,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 내려가는 길2", "만해관 내려가는 길1", 14.2626, 0.950839, "평지", "차도");
//81
  graph.addEdge("만해관 내려가는 길2", "만해관 내려가는 길3", 16.3008, 1.08672, "내리막", "차도",
      node2X: 1556,
      node2Y: 3200,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 내려가는 길3", "만해관 내려가는 길2", 21.7893, 2.46184, "오르막", "차도");
//82
  graph.addEdge("대운동장 상록원 계단 아래", "대운동장 입구 앞", 6.14094, 0.409396, "평지", "도보",
      node2X: 1509,
      node2Y: 3208,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("대운동장 입구 앞", "대운동장 상록원 계단 아래", 6.14094, 0.409396, "평지", "도보");
//83
  graph.addEdge("대운동장 입구 앞", "만해관 내려가는 길3", 8.55206, 0.570138, "평지", "도보");
  graph.addEdge("만해관 내려가는 길3", "대운동장 입구 앞", 8.55206, 0.570138, "평지", "도보");
//90
  graph.addEdge("대운동장 입구 앞", "대운동장 입구", 5.39629, 0.359753, "평지", "도보",
      node2X: 1501,
      node2Y: 3237,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("대운동장 입구", "대운동장 입구 앞", 5.39629, 0.359753, "평지", "도보");
//84
  graph.addEdge("만해관 내려가는 길3", "정문3", 25.8237, 1.72158, "내리막", "차도",
      node2X: 1694,
      node2Y: 3241,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문3", "만해관 내려가는 길3", 31.5654, 3.34477, "오르막", "차도");
//85
  graph.addEdge("정문3", "정문2", 73.5026, 4.90018, "내리막", "차도",
      node2X: 2087,
      node2Y: 3357,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문2", "정문3", 87.422, 7.3112, "오르막", "차도");
//86
  graph.addEdge("정문2", "정문 앞", 52.8705, 3.5247, "내리막", "차도",
      node2X: 2380,
      node2Y: 3389,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 앞", "정문2", 62.8827, 5.25895, "오르막", "차도");
//87
  graph.addEdge("만해관 내려가는 길1", "만해관 옆 계단 아래", 13.3333, 0.84, "계단아래", "도보",
      node2X: 1557,
      node2Y: 3089,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 옆 계단 아래", "만해관 내려가는 길1", 18.6667, 2.8, "계단위", "도보");
//88
  graph.addEdge("만해관 옆 계단 아래", "정각원 계단 아래", 30.3251, 2.02167, "평지", "도보",
      node2X: 1723,
      node2Y: 3121,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원 계단 아래", "만해관 옆 계단 아래", 30.3251, 2.02167, "평지", "도보");
//89
  graph.addEdge("정각원 계단 아래", "정문 혜화관3", 16.9681, 1.13121, "평지", "도보",
      node2X: 1815,
      node2Y: 3143,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관3", "정각원 계단 아래", 16.9681, 1.13121, "평지", "도보");
//91
  graph.addEdge("정문 혜화관3", "정문 혜화관2", 12.0077, 0.800511, "평지", "차도",
      node2X: 1750,
      node2Y: 3159,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("정문 혜화관2", "정문 혜화관3", 12.0077, 0.800511, "평지", "차도");
//92
  graph.addEdge("정문 혜화관2", "정문 혜화관1", 9.52061, 0.634707, "평지", "차도",
      node2X: 1711,
      node2Y: 3195,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관1", "정문 혜화관2", 9.52061, 0.634707, "평지", "차도");
//93
  graph.addEdge("정문 혜화관1", "정문3", 8.79688, 0.586459, "평지", "차도");
  graph.addEdge("정문3", "정문 혜화관1", 8.79688, 0.586459, "평지", "차도");
//94
  graph.addEdge("정문 혜화관3", "혜화별관 입구 앞", 4.26379, 0.284252, "평지", "차도",
      node2X: 1838,
      node2Y: 3149,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 입구 앞", "정문 혜화관3", 4.26379, 0.284252, "평지", "차도");
//95
  graph.addEdge("혜화별관 입구 앞", "혜화별관 입구", 7.66307, 0.510871, "평지", "도보",
      node2X: 1850,
      node2Y: 3108,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 입구", "혜화별관 입구 앞", 7.66307, 0.510871, "평지", "도보");
//96
  graph.addEdge("혜화별관 입구 앞", "정문 혜화관4", 8.13558, 0.542372, "평지", "차도",
      node2X: 1882,
      node2Y: 3160,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관4", "혜화별관 입구 앞", 8.13558, 0.542372, "평지", "차도");
//97
  graph.addEdge("정문 혜화관4", "혜화별관 쪽문 옆", 15.1456, 1.0097, "평지", "도보",
      node2X: 1909,
      node2Y: 3080,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 쪽문 옆", "정문 혜화관4", 15.1456, 1.0097, "평지", "도보");
//98
  graph.addEdge("혜화별관 쪽문 옆", "혜화별관 쪽문 앞", 2.83623, 0.189082, "평지", "도보",
      node2X: 1894,
      node2Y: 3075,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 쪽문 앞", "혜화별관 쪽문 옆", 2.83623, 0.189082, "평지", "도보");
//99
  graph.addEdge("혜화별관 쪽문 앞", "혜화별관 쪽문", 1.70174, 0.113449, "평지", "도보",
      node2X: 1891,
      node2Y: 3084,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화별관 쪽문", "혜화별관 쪽문 앞", 1.70174, 0.113449, "평지", "도보");
//100
  graph.addEdge("정문 혜화관4", "정문 혜화관5", 30.7262, 2.04841, "평지", "차도",
      node2X: 2047,
      node2Y: 3206,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("정문 혜화관5", "정문 혜화관4", 30.7262, 2.04841, "평지", "차도");
//101
  graph.addEdge("정문 혜화관5", "경영관 차도1", 14.7222, 0.981479, "내리막", "차도",
      node2X: 2107,
      node2Y: 3262,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도1", "정문 혜화관5", 14.7222, 0.981479, "오르막", "차도");
//102
  graph.addEdge("경영관 차도1", "경영관 차도2", 14.8928, 0.992851, "내리막", "차도",
      node2X: 2189,
      node2Y: 3275,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도2", "경영관 차도1", 14.8928, 0.992851, "오르막", "차도");
//103
  graph.addEdge("경영관 차도2", "경영관 차도3", 8.9976, 0.59984, "평지", "차도",
      node2X: 2235,
      node2Y: 3255,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("경영관 차도3", "경영관 차도2", 8.9976, 0.59984, "평지", "차도");
//104
  graph.addEdge("경영관 차도3", "경영관 2층 쪽문 앞", 7.49323, 0.499548, "평지", "도보",
      node2X: 2243,
      node2Y: 3296,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문 앞", "경영관 차도3", 7.49323, 0.499548, "평지", "도보");
  //437
  graph.addEdge("경영관 2층 쪽문 앞", "경영관 2층 쪽문", 2.04523, 0.136349, "평지", "도보",
      node2X: 2254,
      node2Y: 3293,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("경영관 2층 쪽문", "경영관 2층 쪽문 앞", 2.04523, 0.136349, "평지", "도보");
  //436
  graph.addEdge("경영관 2층 쪽문 앞", "경영관 2층 쪽문 계단", 0.896894, 0.0597929, "평지", "도보",
      node2X: 2246,
      node2Y: 3300,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문 계단", "경영관 2층 쪽문 앞", 0.896894, 0.0597929, "평지", "도보");
//105
  graph.addEdge("경영관 차도3", "경영관 차도4", 17.971, 1.19807, "평지", "차도",
      node2X: 2281,
      node2Y: 3166,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 차도4", "경영관 차도3", 17.971, 1.19807, "평지", "차도");
//107
  graph.addEdge("경영관 차도4", "경영관 2층 입구", 8.62698, 0.575132, "평지", "도보",
      node2X: 2329,
      node2Y: 3163,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("경영관 2층 입구", "경영관 차도4", 8.62698, 0.575132, "평지", "도보");
//108
  graph.addEdge("경영관 차도4", "경영관 계단 아래", 11.9122, 0.794144, "평지", "차도",
      node2X: 2218,
      node2Y: 3145,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 계단 아래", "경영관 차도4", 11.9122, 0.794144, "평지", "차도");
  //106
  graph.addEdge("경영관 계단 아래", "사회과학관 2층 옆문", 4.87963, 0.325309, "평지", "도보",
      node2X: 2226,
      node2Y: 3119,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("사회과학관 2층 옆문", "경영관 계단 아래", 4.87963, 0.325309, "평지", "도보");
//109
  graph.addEdge("경영관 계단 아래", "경영관 계단 위", 16.6667, 2.5, "계단위", "도보",
      node2X: 2148,
      node2Y: 3124,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 계단 위", "경영관 계단 아래", 11.9048, 0.75, "계단아래", "도보");
//110
  graph.addEdge("경영관 계단 위", "정문 혜화관7", 9.09364, 0.606243, "평지", "도보",
      node2X: 2099,
      node2Y: 3111,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관7", "경영관 계단 위", 9.09364, 0.606243, "평지", "도보");
//111
  graph.addEdge("정문 혜화관5", "정문 혜화관6", 8.91135, 0.59409, "평지", "차도",
      node2X: 2079,
      node2Y: 3168,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관6", "정문 혜화관5", 8.91135, 0.59409, "평지", "차도");
//112
  graph.addEdge("정문 혜화관6", "정문 혜화관7", 10.8357, 0.722382, "평지", "차도");
  graph.addEdge("정문 혜화관7", "정문 혜화관6", 10.8357, 0.722382, "평지", "차도");
//113
  graph.addEdge("정문 혜화관7", "정문 혜화관8", 11.1186, 0.74124, "평지", "차도",
      node2X: 2118,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관8", "정문 혜화관7", 11.1186, 0.74124, "평지", "차도");
//114
  graph.addEdge("정문 혜화관8", "사회과학관 3층 입구", 10.0404, 0.669361, "평지", "도보",
      node2X: 2171,
      node2Y: 3070,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("사회과학관 3층 입구", "정문 혜화관8", 10.0404, 0.669361, "평지", "도보");
//115
  graph.addEdge("정문 혜화관8", "정문 혜화관9", 15.7731, 1.05154, "평지", "차도",
      node2X: 2144,
      node2Y: 2968,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정문 혜화관9", "정문 혜화관8", 15.7731, 1.05154, "평지", "차도");
//116
  graph.addEdge("정문 혜화관9", "혜화관 입구", 21.4446, 1.42964, "평지", "도보",
      node2X: 2030,
      node2Y: 2932,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("혜화관 입구", "정문 혜화관9", 21.4446, 1.42964, "평지", "도보");
//117
  graph.addEdge("정문 혜화관9", "혜화관 사회과학관 갈림길", 38.5727, 2.57151, "평지", "차도",
      node2X: 2212,
      node2Y: 2764,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("혜화관 사회과학관 갈림길", "정문 혜화관9", 38.5727, 2.57151, "평지", "차도");
//118
  graph.addEdge("혜화관 사회과학관 갈림길", "사회과학관 2층 쪽문 앞 계단 위", 9.07061, 0.604707, "계단아래", "도보",
      node2X: 2258,
      node2Y: 2785,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 위", "혜화관 사회과학관 갈림길", 9.07061, 0.604707, "계단위", "도보");
  //735
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 위", "사회과학관 2층 쪽문 앞 계단 아래", 7.61905, 0.48, "계단아래", "도보",
      node2X: 2274,
      node2Y: 2790,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 아래", "사회과학관 2층 쪽문 앞 계단 위", 10.6667, 1.6, "계단위", "도보");
//119 생략
//120
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 아래", "사회과학관 2층 쪽문", 4.65349, 0.310233, "평지", "도보",
      node2X: 2297,
      node2Y: 2802,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("사회과학관 2층 쪽문", "사회과학관 2층 쪽문 앞 계단 아래", 4.65349, 0.310233, "평지", "도보");
//121
  graph.addEdge("사회과학관 2층 쪽문 앞 계단 아래", "문화관 사회과학관 계단 위", 7.11435, 0.47429, "평지", "도보",
      node2X: 2291,
      node2Y: 2763,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 위", "사회과학관 2층 쪽문 앞 계단 아래", 7.11435, 0.47429, "평지", "도보");
//122
  graph.addEdge("문화관 사회과학관 계단 위", "문화관 사회과학관 계단 중간1", 6.66667, 0.42, "계단아래", "도보",
      node2X: 2326,
      node2Y: 2757,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 중간1", "문화관 사회과학관 계단 위", 9.33333, 1.4, "계단위", "도보");
//123
  graph.addEdge("문화관 사회과학관 계단 중간1", "문화관 사회과학관 계단 중간2", 5.71429, 0.36, "계단아래", "도보",
      node2X: 2338,
      node2Y: 2788,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 중간2", "문화관 사회과학관 계단 중간1", 8, 1.2, "계단위", "도보");
//124
  graph.addEdge("문화관 사회과학관 계단 중간2", "문화관 사회과학관 계단 아래", 19.5238, 1.23, "계단아래", "도보",
      node2X: 2404,
      node2Y: 2724,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 사회과학관 계단 아래", "문화관 사회과학관 계단 중간2", 27.3333, 4.1, "계단위", "도보");
//125
  graph.addEdge("문화관 사회과학관 계단 아래", "문화관 1층 입구 앞", 10.948, 0.729866, "평지", "차도",
      node2X: 2385,
      node2Y: 2782,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 1층 입구 앞", "문화관 사회과학관 계단 아래", 10.948, 0.729866, "평지", "차도");
//204
  graph.addEdge("문화관 1층 입구 앞", "문화관 1층 입구", 1.3059, 0.0870598, "평지", "도보",
      node2X: 2392,
      node2Y: 2784,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("문화관 1층 입구", "문화관 1층 입구 앞", 1.3059, 0.0870598, "평지", "도보");
//205
  graph.addEdge("문화관 1층 입구 앞", "사회과학관 B1 엘베 입구", 41.0711, 2.73807, "평지", "차도",
      node2X: 2315,
      node2Y: 3000,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 B1 엘베 입구", "문화관 1층 입구 앞", 41.0711, 2.73807, "평지", "차도");
  //434
  graph.addEdge("사회과학관 B1 엘베 입구", "사회과학관 B1 엘베 앞", 5.52592, 0.368394, "평지", "차도",
      node2X: 2285,
      node2Y: 2993,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("사회과학관 B1 엘베 앞", "사회과학관 B1 엘베 입구", 5.52592, 0.368394, "평지", "차도");
  //435
  graph.addEdge("사회과학관 B1 엘베 앞", "사회과학관 B1 엘베", 7.03476, 0.468984, "평지", "차도",
      node2X: 2272,
      node2Y: 3030,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("사회과학관 B1 엘베", "사회과학관 B1 엘베 앞", 7.03476, 0.468984, "평지", "차도");
  //126
  graph.addEdge("사회과학관 B1 엘베 입구", "동대입구 문화관3", 9.81351, 0.654234, "평지", "도보",
      node2X: 2298,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 문화관3", "사회과학관 B1 엘베 입구", 9.81351, 0.654234, "평지", "도보");
//127
  graph.addEdge("동대입구 문화관3", "문화관 쪽문 앞", 10.6076, 0.707176, "평지", "차도",
      node2X: 2354,
      node2Y: 3071,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 쪽문 앞", "동대입구 문화관3", 10.6076, 0.707176, "평지", "차도");
//128
  graph.addEdge("문화관 쪽문 앞", "문화관 쪽문", 4.65694, 0.310463, "평지", "도보",
      node2X: 2361,
      node2Y: 3046,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("문화관 쪽문", "문화관 쪽문 앞", 4.65694, 0.310463, "평지", "도보");
//129
  graph.addEdge("문화관 쪽문 앞", "문화관 산책로 입구", 12.0304, 0.802028, "평지", "차도",
      node2X: 2417,
      node2Y: 3094,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 산책로 입구", "문화관 쪽문 앞", 12.0304, 0.802028, "평지", "차도");
  //420
  graph.addEdge("문화관 산책로 입구", "경영관 뒷계단 앞", 4.87963, 0.325309, "평지", "도보",
      node2X: 2443,
      node2Y: 3102,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 뒷계단 앞", "문화관 산책로 입구", 4.87963, 0.325309, "평지", "도보");
  //421
  graph.addEdge("경영관 뒷계단 앞", "경영관 뒷계단 아래", 7.94144, 0.529429, "평지", "도보",
      node2X: 2429,
      node2Y: 3144,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 뒷계단 아래", "경영관 뒷계단 앞", 7.94144, 0.529429, "평지", "도보");
  //422
  graph.addEdge("경영관 뒷계단 아래", "경영관 2층 뒷문", 42, 6.3, "계단위", "도보",
      node2X: 2409,
      node2Y: 3137,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("경영관 2층 뒷문", "경영관 뒷계단 아래", 30, 1.89, "계단아래", "도보");
//130
  graph.addEdge("문화관 사회과학관 계단 아래", "동대입구 문화관2", 12.4238, 0.828256, "내리막", "차도",
      node2X: 2425,
      node2Y: 2658,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 문화관2", "문화관 사회과학관 계단 아래", 15.1862, 1.60918, "오르막", "차도");
//131
  graph.addEdge("동대입구 문화관2", "동대입구 문화관1", 27.2662, 1.81774, "내리막", "차도",
      node2X: 2517,
      node2Y: 2537,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 문화관1", "동대입구 문화관2", 40.7397, 4.58754, "오르막", "차도");
//132
  graph.addEdge("동대입구 문화관1", "예술극장 입구", 13.0108, 0.867389, "평지", "도보",
      node2X: 2498,
      node2Y: 2607,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("예술극장 입구", "동대입구 문화관1", 13.0108, 0.867389, "평지", "도보");
//133
  graph.addEdge("동대입구 문화관1", "학술관 입구 앞", 18.2094, 1.21396, "평지", "도보",
      node2X: 2550,
      node2Y: 2633,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관 입구 앞", "동대입구 문화관1", 18.2094, 1.21396, "평지", "도보");
//349
  graph.addEdge("학술관 입구 앞", "문화관 후문 앞", 34.4375, 2.29583, "평지", "도보",
      node2X: 2486,
      node2Y: 2814,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 후문 앞", "학술관 입구 앞", 34.4375, 2.29583, "평지", "도보");
//350
  graph.addEdge("문화관 후문 앞", "문화관 후문", 0.717515, 0.0478344, "평지", "도보",
      node2X: 2482,
      node2Y: 2814,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("문화관 후문", "문화관 후문 앞", 0.717515, 0.0478344, "평지", "도보");
//351
  graph.addEdge("문화관 후문 앞", "학술관 옆문", 11.504, 0.766936, "평지", "도보",
      node2X: 2549,
      node2Y: 2826,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학술관 옆문", "문화관 후문 앞", 11.504, 0.766936, "평지", "도보");
//134
  graph.addEdge("학술관 입구 앞", "학술관 입구", 5.77644, 0.385096, "평지", "도보",
      node2X: 2569,
      node2Y: 2659,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학술관 입구", "학술관 입구 앞", 5.77644, 0.385096, "평지", "도보");
//135
  graph.addEdge("학술관 입구 앞", "가든쿡 입구 앞", 9.35869, 0.623913, "평지", "도보",
      node2X: 2539,
      node2Y: 2684,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("가든쿡 입구 앞", "학술관 입구 앞", 9.35869, 0.623913, "평지", "도보");
  //136
  graph.addEdge("가든쿡 입구 앞", "가든쿡 입구", 11.9048, 0.75, "계단아래", "도보",
      node2X: 2529,
      node2Y: 2741,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("가든쿡 입구", "가든쿡 입구 앞", 16.6667, 2.5, "계단위", "도보");
//139
  graph.addEdge("동대입구 문화관1", "동대입구 앞", 15.2851, 1.01901, "평지", "차도",
      node2X: 2567,
      node2Y: 2468,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 앞", "동대입구 문화관1", 15.2851, 1.01901, "평지", "차도");
//140
  graph.addEdge("동대입구 앞", "동대입구", 8.34449, 0.556299, "평지", "도보",
      node2X: 2587,
      node2Y: 2426,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구", "동대입구 앞", 8.34449, 0.556299, "평지", "도보");
//141
  graph.addEdge("동대입구 앞", "동대입구 혜화관1", 8.27673, 0.551782, "평지", "차도",
      node2X: 2527,
      node2Y: 2445,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 혜화관1", "동대입구 앞", 8.27673, 0.551782, "평지", "차도");
//142
  graph.addEdge("동대입구 혜화관1", "동대입구 혜화관2", 55.976, 3.73173, "오르막", "차도",
      node2X: 2290,
      node2Y: 2648,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("동대입구 혜화관2", "동대입구 혜화관1", 55.976, 3.73173, "내리막", "차도");
//143
  graph.addEdge("동대입구 혜화관2", "혜화관 사회과학관 갈림길", 25.0746, 1.67164, "오르막", "차도");
  graph.addEdge("혜화관 사회과학관 갈림길", "동대입구 혜화관2", 25.0746, 1.67164, "내리막", "차도");
//144
  graph.addEdge("혜화관 사회과학관 갈림길", "혜화관 팔정도 계단 아래", 49.6776, 5.61277, "오르막", "차도",
      node2X: 2017,
      node2Y: 2694,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 팔정도 계단 아래", "혜화관 사회과학관 갈림길", 37.1643, 2.47762, "내리막", "차도");
//145
  graph.addEdge("혜화관 팔정도 계단 아래", "혜화관 팔정도 계단 위", 42, 6.3, "계단위", "도보",
      node2X: 1872,
      node2Y: 2705,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("혜화관 팔정도 계단 위", "혜화관 팔정도 계단 아래", 30, 1.89, "계단아래", "도보");
//146
  graph.addEdge("혜화관 팔정도 계단 위", "법학관 뒷길1", 11.468, 0.705962, "오르막", "차도",
      node2X: 1870,
      node2Y: 2764,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 뒷길1", "혜화관 팔정도 계단 위", 10.5894, 0.618997, "내리막", "차도");
//147
  graph.addEdge("법학관 뒷길1", "법학관 뒷길2", 15.4277, 1.25009, "오르막", "차도",
      node2X: 1827,
      node2Y: 2823,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 뒷길2", "법학관 뒷길1", 13.0959, 0.873059, "내리막", "차도");
//148
  graph.addEdge("법학관 뒷길2", "법학관 뒷길3", 10.3497, 0.68998, "평지", "차도",
      node2X: 1775,
      node2Y: 2848,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 뒷길3", "법학관 뒷길2", 10.3497, 0.68998, "평지", "차도");
//149
  graph.addEdge("법학관 뒷길2", "혜화관 만해관 중간", 14.7102, 0.980677, "평지", "도보",
      node2X: 1805,
      node2Y: 2902,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("혜화관 만해관 중간", "법학관 뒷길2", 14.7102, 0.980677, "평지", "도보");
//150
  graph.addEdge("혜화관 만해관 중간", "혜화관 4층 입구", 18.4062, 1.22708, "평지", "도보",
      node2X: 1905,
      node2Y: 2925,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("혜화관 4층 입구", "혜화관 만해관 중간", 18.4062, 1.22708, "평지", "도보");
//151
  graph.addEdge("혜화관 만해관 중간", "만해관 2층 입구 앞", 16.6629, 1.11086, "평지", "도보",
      node2X: 1715,
      node2Y: 2879,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 2층 입구 앞", "혜화관 만해관 중간", 16.6629, 1.11086, "평지", "도보");
//152
  graph.addEdge("만해관 2층 입구 앞", "만해관 2층 입구", 10, 1.5, "계단위", "도보",
      node2X: 1701,
      node2Y: 2874,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("만해관 2층 입구", "만해관 2층 입구 앞", 7.14286, 0.45, "계단아래", "도보");
//153
  graph.addEdge("만해관 2층 입구 앞", "만해관 정각원 갈림길", 33.7618, 2.25079, "평지", "도보",
      node2X: 1660,
      node2Y: 3059,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 정각원 갈림길", "만해관 2층 입구 앞", 33.7618, 2.25079, "평지", "도보");
//154
  graph.addEdge("만해관 정각원 갈림길", "정각원 입구 앞", 14.0076, 0.933842, "평지", "도보",
      node2X: 1737,
      node2Y: 3072,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원 입구 앞", "만해관 정각원 갈림길", 14.0076, 0.933842, "평지", "도보");
//155
  graph.addEdge("정각원 입구 앞", "정각원 입구", 3.69799, 0.246533, "평지", "도보",
      node2X: 1742,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정각원 입구", "정각원 입구 앞", 3.69799, 0.246533, "평지", "도보");
//156
  graph.addEdge("정각원 입구 앞", "정각원 계단 아래", 20.9524, 1.32, "계단아래", "도보");
  graph.addEdge("정각원 계단 아래", "정각원 입구 앞", 29.3333, 4.4, "계단위", "도보");
//157
  graph.addEdge("만해관 정각원 갈림길", "만해관 우측 하단", 3.74554, 0.249703, "평지", "도보",
      node2X: 1654,
      node2Y: 3079,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 우측 하단", "만해관 정각원 갈림길", 3.74554, 0.249703, "평지", "도보");
//158
  graph.addEdge("만해관 우측 하단", "만해관 옆입구 앞", 9.24628, 0.616419, "평지", "도보",
      node2X: 1605,
      node2Y: 3063,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해관 옆입구 앞", "만해관 우측 하단", 9.24628, 0.616419, "평지", "도보");
//159
  graph.addEdge("만해관 옆입구 앞", "만해관 옆입구", 2.09958, 0.139972, "평지", "도보",
      node2X: 1609,
      node2Y: 3052,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("만해관 옆입구", "만해관 옆입구 앞", 2.09958, 0.139972, "평지", "도보");
//160
  graph.addEdge("만해관 옆입구 앞", "만해관 내려가는 길1", 14.5219, 0.968129, "평지", "도보");
  graph.addEdge("만해관 내려가는 길1", "만해관 옆입구 앞", 14.5219, 0.968129, "평지", "도보");
//119
  graph.addEdge("과학관 차도 입구", "만해관 입구", 15.5233, 1.03488, "평지", "도보",
      node2X: 1624,
      node2Y: 2860,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("만해관 입구", "과학관 차도 입구", 15.5233, 1.03488, "평지", "도보");
//161
  graph.addEdge("팔정도 좌측 하단", "명진관 중앙 계단 아래", 26.0995, 1.73996, "평지", "차도");
  graph.addEdge("명진관 중앙 계단 아래", "팔정도 좌측 하단", 26.0995, 1.73996, "평지", "차도");
//162
  graph.addEdge("명진관 중앙 계단 아래", "명진관 오른쪽 계단 아래", 32.2213, 2.14809, "평지", "차도");
  graph.addEdge("명진관 오른쪽 계단 아래", "명진관 중앙 계단 아래", 32.2213, 2.14809, "평지", "차도");
//163
  graph.addEdge("명진관 오른쪽 계단 아래", "팔정도 오른쪽", 25.0848, 1.67232, "평지", "차도",
      node2X: 1562,
      node2Y: 2713,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 오른쪽", "명진관 오른쪽 계단 아래", 25.0848, 1.67232, "평지", "차도");
//164
  graph.addEdge("팔정도 오른쪽", "법학관 1층 입구 앞", 5.27569, 0.351713, "평지", "차도",
      node2X: 1571,
      node2Y: 2685,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("법학관 1층 입구 앞", "팔정도 오른쪽", 5.27569, 0.351713, "평지", "차도");
//165
  graph.addEdge("법학관 1층 입구 앞", "법학관 1층 입구", 5.22975, 0.34865, "평지", "도보",
      node2X: 1598,
      node2Y: 2696,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("법학관 1층 입구", "법학관 1층 입구 앞", 5.22975, 0.34865, "평지", "도보");
//166
  graph.addEdge("법학관 1층 입구 앞", "팔정도 우측 상단1", 17.4883, 1.16589, "평지", "차도",
      node2X: 1588,
      node2Y: 2589,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 우측 상단1", "법학관 1층 입구 앞", 17.4883, 1.16589, "평지", "차도");
//167
  graph.addEdge("팔정도 우측 상단1", "팔정도 우측 상단2", 4.81324, 0.320883, "평지", "차도",
      node2X: 1576,
      node2Y: 2565,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("팔정도 우측 상단2", "팔정도 우측 상단1", 4.81324, 0.320883, "평지", "차도");
//168
  graph.addEdge("팔정도 우측 상단2", "팔정도 혜화관1", 6.12258, 0.408172, "평지", "차도",
      node2X: 1605,
      node2Y: 2547,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 혜화관1", "팔정도 우측 상단2", 6.12258, 0.408172, "평지", "차도");
//169
  graph.addEdge("팔정도 혜화관1", "팔정도 혜화관2", 24.37037037, 1.56562, "내리막", "차도",
      node2X: 1729,
      node2Y: 2589,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 혜화관2", "팔정도 혜화관1", 28.70588235, 3.04175, "오르막", "차도");
//170
  graph.addEdge("팔정도 혜화관2", "팔정도 혜화관3", 12.3094, 0.820624, "평지", "차도",
      node2X: 1751,
      node2Y: 2654,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 혜화관3", "팔정도 혜화관2", 12.3094, 0.820624, "평지", "차도");
//171
  graph.addEdge("팔정도 혜화관3", "혜화관 팔정도 계단 위", 23.554, 1.57027, "평지", "차도");
  graph.addEdge("혜화관 팔정도 계단 위", "팔정도 혜화관3", 23.554, 1.57027, "평지", "차도");
//172
  graph.addEdge("팔정도 우측 상단2", "다향관 3층 오른쪽 입구 앞", 3.13785, 0.20919, "평지", "차도",
      node2X: 1567,
      node2Y: 2550,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 3층 오른쪽 입구 앞", "팔정도 우측 상단2", 3.13785, 0.20919, "평지", "차도");
//173
  graph.addEdge("다향관 3층 오른쪽 입구 앞", "다향관 3층 오른쪽 입구", 3.00694, 0.200462, "평지", "도보",
      node2X: 1572,
      node2Y: 2534,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 3층 오른쪽 입구", "다향관 3층 오른쪽 입구 앞", 3.00694, 0.200462, "평지", "도보");
//174
  graph.addEdge("다향관 3층 오른쪽 입구 앞", "팔정도 위", 23.4356, 1.56237, "평지", "차도",
      node2X: 1442,
      node2Y: 2512,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 위", "다향관 3층 오른쪽 입구 앞", 23.4356, 1.56237, "평지", "차도");
//175
  graph.addEdge("팔정도 위", "다향관 3층 왼쪽 계단 입구 앞", 19.4566, 1.29711, "평지", "차도",
      node2X: 1339,
      node2Y: 2478,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 3층 왼쪽 계단 입구 앞", "팔정도 위", 19.4566, 1.29711, "평지", "차도");
//202
  graph.addEdge("다향관 3층 왼쪽 계단 입구 앞", "다향관 3층 왼쪽 계단 입구", 6.26543, 0.417696, "평지", "도보",
      node2X: 1353,
      node2Y: 2446,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("다향관 3층 왼쪽 계단 입구", "다향관 3층 왼쪽 계단 입구 앞", 6.26543, 0.417696, "평지", "도보");
//176
  graph.addEdge("다향관 3층 왼쪽 계단 입구 앞", "팔정도 좌측 상단", 6.30893, 0.420596, "평지", "차도",
      node2X: 1305,
      node2Y: 2469,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("팔정도 좌측 상단", "다향관 3층 왼쪽 계단 입구 앞", 6.30893, 0.420596, "평지", "차도");
//177
  graph.addEdge("팔정도 좌측 상단", "본관 3층 오른쪽 입구 앞", 1.84682, 0.123121, "평지", "차도",
      node2X: 1300,
      node2Y: 2478,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 입구 앞", "팔정도 좌측 상단", 1.84682, 0.123121, "평지", "차도");
//178
  graph.addEdge("본관 3층 오른쪽 입구 앞", "본관 3층 오른쪽 입구", 8.50868, 0.567246, "평지", "도보",
      node2X: 1255,
      node2Y: 2463,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("본관 3층 오른쪽 입구", "본관 3층 오른쪽 입구 앞", 8.50868, 0.567246, "평지", "도보");
//179
  graph.addEdge("본관 3층 오른쪽 입구 앞", "팔정도 왼쪽", 25.4149, 1.69433, "평지", "차도",
      node2X: 1257,
      node2Y: 2613,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 왼쪽", "본관 3층 오른쪽 입구 앞", 25.4149, 1.69433, "평지", "차도");
//180
  graph.addEdge("팔정도 왼쪽", "본관 3층 왼쪽 입구 앞", 4.14128, 0.276085, "평지", "차도",
      node2X: 1250,
      node2Y: 2635,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 입구 앞", "팔정도 왼쪽", 4.14128, 0.276085, "평지", "차도");
//181
  graph.addEdge("본관 3층 왼쪽 입구 앞", "본관 3층 왼쪽 입구", 8.3983, 0.559887, "평지", "도보",
      node2X: 1206,
      node2Y: 2619,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("본관 3층 왼쪽 입구", "본관 3층 왼쪽 입구 앞", 8.3983, 0.559887, "평지", "도보");
//182
  graph.addEdge("본관 3층 왼쪽 입구 앞", "팔정도 좌측 하단", 21.5553, 1.43702, "평지", "차도");
  graph.addEdge("팔정도 좌측 하단", "본관 3층 왼쪽 입구 앞", 21.5553, 1.43702, "평지", "차도");
//183
  graph.addEdge("팔정도 좌측 하단", "팔정도1", 22.7896, 1.51931, "평지", "도보",
      node2X: 1327,
      node2Y: 2695,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도1", "팔정도 좌측 하단", 22.7896, 1.51931, "평지", "도보");
//184
  graph.addEdge("팔정도1", "팔정도 중앙", 14.9348, 0.995656, "평지", "도보",
      node2X: 1403,
      node2Y: 2661,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("팔정도 중앙", "팔정도1", 14.9348, 0.995656, "평지", "도보");
//185
  graph.addEdge("팔정도1", "팔정도2", 8.16912, 0.544608, "평지", "도보",
      node2X: 1342,
      node2Y: 2738,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도2", "팔정도1", 8.16912, 0.544608, "평지", "도보");
//186
  graph.addEdge("팔정도2", "팔정도3", 5.45559, 0.363706, "평지", "도보",
      node2X: 1364,
      node2Y: 2759,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도3", "팔정도2", 5.45559, 0.363706, "평지", "도보");
//187
  graph.addEdge("팔정도3", "명진관 중앙 계단 아래", 6.36226, 0.424151, "평지", "도보");
  graph.addEdge("명진관 중앙 계단 아래", "팔정도3", 6.36226, 0.424151, "평지", "도보");
//188
  graph.addEdge("팔정도3", "팔정도4", 6.93108, 0.462072, "평지", "도보",
      node2X: 1402,
      node2Y: 2752,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도4", "팔정도3", 6.93108, 0.462072, "평지", "도보");
//189
  graph.addEdge("팔정도4", "팔정도5", 8.8788, 0.59192, "평지", "도보",
      node2X: 1437,
      node2Y: 2717,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도5", "팔정도4", 8.8788, 0.59192, "평지", "도보");
//190
  graph.addEdge("팔정도5", "명진관 오른쪽 계단 아래", 27.8615, 1.85743, "평지", "도보");
  graph.addEdge("명진관 오른쪽 계단 아래", "팔정도5", 27.8615, 1.85743, "평지", "도보");
//191
  graph.addEdge("팔정도5", "팔정도 중앙", 66, 66, "평지", "도보");
  graph.addEdge("팔정도 중앙", "팔정도5", 66, 66, "평지", "도보");
//192
  graph.addEdge("팔정도 중앙", "팔정도 오른쪽", 167, 167, "평지", "도보");
  graph.addEdge("팔정도 오른쪽", "팔정도 중앙", 167, 167, "평지", "도보");
//193
  graph.addEdge("팔정도 중앙", "팔정도6", 11.7517, 0.783447, "평지", "도보",
      node2X: 1466,
      node2Y: 2625,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도6", "팔정도 중앙", 11.7517, 0.783447, "평지", "도보");
//194
  graph.addEdge("팔정도6", "팔정도 우측 상단2", 22.4761, 1.49841, "평지", "도보");
  graph.addEdge("팔정도 우측 상단2", "팔정도6", 22.4761, 1.49841, "평지", "도보");
//195
  graph.addEdge("팔정도6", "팔정도7", 8.65863, 0.577242, "평지", "도보",
      node2X: 1455,
      node2Y: 2578,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도7", "팔정도6", 8.65863, 0.577242, "평지", "도보");
//196
  graph.addEdge("팔정도7", "팔정도8", 6.2268, 0.41512, "평지", "도보",
      node2X: 1429,
      node2Y: 2555,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도8", "팔정도7", 6.2268, 0.41512, "평지", "도보");
//197
  graph.addEdge("팔정도8", "팔정도 위", 8.05808, 0.537206, "평지", "도보");
  graph.addEdge("팔정도 위", "팔정도8", 8.05808, 0.537206, "평지", "도보");
//198
  graph.addEdge("팔정도8", "팔정도9", 6.342, 0.4228, "평지", "도보",
      node2X: 1394,
      node2Y: 2560,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도9", "팔정도8", 6.342, 0.4228, "평지", "도보");
//199
  graph.addEdge("팔정도9", "팔정도10", 6.86578, 0.457719, "평지", "도보",
      node2X: 1362,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도10", "팔정도9", 6.86578, 0.457719, "평지", "도보");
//200
  graph.addEdge("팔정도10", "팔정도 좌측 상단", 22.5426, 1.50284, "평지", "도보");
  graph.addEdge("팔정도 좌측 상단", "팔정도10", 22.5426, 1.50284, "평지", "도보");
//201
  graph.addEdge("팔정도10", "팔정도 중앙", 16.1251, 1.07501, "평지", "도보");
  graph.addEdge("팔정도 중앙", "팔정도10", 16.1251, 1.07501, "평지", "도보");
//202 다향관에 씀
//203
  graph.addEdge("팔정도 중앙", "팔정도 왼쪽", 27.5684, 1.83789, "평지", "도보");
  graph.addEdge("팔정도 왼쪽", "팔정도 중앙", 27.5684, 1.83789, "평지", "도보");
//204 문화관에 씀
//205 문화관에 씀
//206
  graph.addEdge("팔정도 좌측 상단", "팔정도 본관 계단 위", 8.67904, 0.578603, "평지", "차도",
      node2X: 1320,
      node2Y: 2423,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 본관 계단 위", "팔정도 좌측 상단", 8.67904, 0.578603, "평지", "차도");
//207
  graph.addEdge("팔정도 본관 계단 위", "다향관 2층 입구 앞", 4.89609, 0.326406, "내리막", "차도",
      node2X: 1324,
      node2Y: 2396,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 2층 입구 앞", "팔정도 본관 계단 위", 5.60849, 0.408736, "오르막", "차도");
//208
  graph.addEdge("다향관 2층 입구 앞", "다향관 2층 왼쪽 계단 입구 앞", 7.49108, 0.499405, "평지", "도보",
      node2X: 1364,
      node2Y: 2408,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 2층 왼쪽 계단 입구 앞", "다향관 2층 입구 앞", 7.49108, 0.499405, "평지", "도보");
  //630
  graph.addEdge("다향관 2층 왼쪽 계단 입구 앞", "다향관 2층 왼쪽 계단 입구", 0.739598, 0.0493065, "평지", "도보",
      node2X: 1363,
      node2Y: 2412,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("다향관 2층 왼쪽 계단 입구", "다향관 2층 왼쪽 계단 입구 앞", 0.739598, 0.0493065, "평지", "도보");
//209
  graph.addEdge("다향관 2층 입구 앞", "다향관 1층 입구 앞", 7.55311, 0.50354, "내리막", "차도",
      node2X: 1321,
      node2Y: 2354,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 앞", "다향관 2층 입구 앞", 8.65212, 0.63055, "오르막", "차도");
//210
  graph.addEdge("다향관 1층 입구 앞", "다향관 1층 입구 앞2", 6.70215, 0.44681, "내리막", "도보",
      node2X: 1357,
      node2Y: 2364,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 앞2", "다향관 1층 입구 앞", 6.70215, 0.44681, "오르막", "도보");
  //211
  graph.addEdge("다향관 1층 입구 앞2", "다향관 1층 입구 앞3", 3.42703, 0.228469, "내리막", "도보",
      node2X: 1370,
      node2Y: 2378,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 앞3", "다향관 1층 입구 앞2", 4.189, 0.443879, "오르막", "도보");
  //629
  graph.addEdge("다향관 1층 입구 앞3", "다향관 1층 왼쪽 계단 입구", 6.2268, 0.41512, "평지", "도보",
      node2X: 1363,
      node2Y: 2412,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("다향관 1층 왼쪽 계단 입구", "다향관 1층 입구 앞3", 6.2268, 0.41512, "평지", "도보");
//212
  graph.addEdge("다향관 1층 입구 앞", "팔정도 후문 차도1", 17.8552, 1.19035, "내리막", "차도",
      node2X: 1283,
      node2Y: 2262,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도1", "다향관 1층 입구 앞", 21.4427, 1.84785, "오르막", "차도");
//213
  graph.addEdge("팔정도 후문 차도1", "팔정도 후문 차도2", 5.42306, 0.361537, "내리막", "차도",
      node2X: 1258,
      node2Y: 2245,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도2", "팔정도 후문 차도1", 6.51268, 0.561236, "오르막", "차도");
//214
  graph.addEdge("팔정도 후문 차도2", "헐떡고개 위", 4.87303, 0.324869, "내리막", "차도",
      node2X: 1231,
      node2Y: 2248,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("헐떡고개 위", "팔정도 후문 차도2", 5.85214, 0.504314, "오르막", "차도");
//215
  graph.addEdge("헐떡고개 위", "만해광장 입구", 16.9273, 1.12849, "내리막", "차도",
      node2X: 1138,
      node2Y: 2264,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 입구", "헐떡고개 위", 20.3284, 1.75182, "오르막", "차도");
//216
  graph.addEdge("만해광장 입구", "팔정도 후문 차도3", 14.3917, 0.959448, "내리막", "차도",
      node2X: 1059,
      node2Y: 2278,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("팔정도 후문 차도3", "만해광장 입구", 17.2834, 1.48941, "오르막", "차도");
//217
  graph.addEdge("팔정도 후문 차도3", "지하주차장 가는길1", 5.86489, 0.390993, "평지", "차도",
      node2X: 1046,
      node2Y: 2308,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 가는길1", "팔정도 후문 차도3", 5.86489, 0.390993, "평지", "차도");
//218
  graph.addEdge("지하주차장 가는길1", "지하주차장 가는길2", 17.6775, 1.87316, "오르막", "차도",
      node2X: 1078,
      node2Y: 2382,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 가는길2", "지하주차장 가는길1", 14.462, 0.964132, "내리막", "차도");
//219
  graph.addEdge("지하주차장 가는길2", "팔정도 본관 계단 아래", 28.7779, 1.91852, "평지", "도보",
      node2X: 1235,
      node2Y: 2349,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 본관 계단 아래", "지하주차장 가는길2", 28.7779, 1.91852, "평지", "도보");
//220
  graph.addEdge("팔정도 본관 계단 아래", "팔정도 본관 계단 중간", 10.6667, 1.6, "계단위", "도보",
      node2X: 1255,
      node2Y: 2414,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 본관 계단 중간", "팔정도 본관 계단 아래", 7.61905, 0.48, "계단아래", "도보");
//221
  graph.addEdge("팔정도 본관 계단 중간", "팔정도 본관 계단 위", 11.3333, 1.7, "계단위", "도보");
  graph.addEdge("팔정도 본관 계단 위", "팔정도 본관 계단 중간", 8.09524, 0.51, "계단아래", "도보");
//222 본관 1층인지 불확실
  graph.addEdge("지하주차장 가는길2", "본관 1층 입구", 7.92927, 0.528618, "평지", "도보",
      node2X: 1113,
      node2Y: 2409,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("본관 1층 입구", "지하주차장 가는길2", 7.92927, 0.528618, "평지", "도보");
//223
  graph.addEdge("지하주차장 가는길2", "원흥관 4층 입구", 14.818, 0.987869, "평지", "도보",
      node2X: 996,
      node2Y: 2392,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("원흥관 4층 입구", "지하주차장 가는길2", 14.818, 0.987869, "평지", "도보");
  //224
  graph.addEdge("지하주차장 가는길2", "지하주차장 가는길3", 35.0156, 2.33438, "평지", "차도",
      node2X: 1022,
      node2Y: 2569,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 가는길3", "지하주차장 가는길2", 35.0156, 2.33438, "평지", "차도");
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
      showRoute2: true);
  graph.addEdge("본관 1층 쪽문", "본관 1층 쪽문 앞", 5.38516, 5.38516, "평지", "도보");
//226
  graph.addEdge("지하주차장 가는길3", "지하주차장 앞", 8.9976, 0.59984, "평지", "차도");
  graph.addEdge("지하주차장 앞", "지하주차장 가는길3", 8.9976, 0.59984, "평지", "차도");
//227
  graph.addEdge("지하주차장 앞", "지하주차장 입구", 11.4156, 0.76104, "평지", "차도",
      node2X: 939,
      node2Y: 2624,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("지하주차장 입구", "지하주차장 앞", 11.4156, 0.76104, "평지", "차도");
//228
  graph.addEdge("헐떡고개 위", "헐떡고개 아래", 49.20833333, 2.68901, "내리막", "도보",
      node2X: 1282,
      node2Y: 2029,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("헐떡고개 아래", "헐떡고개 위", 60.26666667, 6.7864, "오르막", "도보");
//229
  graph.addEdge("헐떡고개 아래", "체육관 옆문 앞", 5.48794, 0.365862, "내리막", "도보",
      node2X: 1288,
      node2Y: 1999,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("체육관 옆문 앞", "헐떡고개 아래", 8.1998, 0.923347, "오르막", "도보");
//230
  graph.addEdge("체육관 옆문 앞", "체육관 옆문", 9.26713, 0.617809, "평지", "도보",
      node2X: 1338,
      node2Y: 2012,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("체육관 옆문", "체육관 옆문 앞", 9.26713, 0.617809, "평지", "도보");
//231
  graph.addEdge("체육관 옆문 앞", "듀이카 가는길1", 28.64, 1.90933, "내리막", "도보",
      node2X: 1322,
      node2Y: 1843,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길1", "체육관 옆문 앞", 42.7925, 4.81869, "오르막", "도보");
//232
  graph.addEdge("듀이카 가는길1", "듀이카 가는길2", 3.96261, 0.264174, "평지", "도보",
      node2X: 1344,
      node2Y: 1841,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길2", "듀이카 가는길1", 3.96261, 0.264174, "평지", "도보");
//233
  graph.addEdge("듀이카 가는길2", "학림관 우측 앞문", 4.82992, 0.321995, "평지", "도보",
      node2X: 1354,
      node2Y: 1816,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학림관 우측 앞문", "듀이카 가는길2", 4.82992, 0.321995, "평지", "도보");
//234
  graph.addEdge("듀이카 가는길2", "듀이카 가는길3", 7.54245, 0.50283, "평지", "도보",
      node2X: 1386,
      node2Y: 1839,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길3", "듀이카 가는길2", 7.54245, 0.50283, "평지", "도보");
//235
  graph.addEdge("듀이카 가는길3", "듀이카 가는길4", 12.5629, 0.837528, "평지", "도보",
      node2X: 1455,
      node2Y: 1851,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 가는길4", "듀이카 가는길3", 12.5629, 0.837528, "평지", "도보");
//236
  graph.addEdge("듀이카 가는길4", "체육관 정문", 1.65379, 0.110253, "평지", "도보",
      node2X: 1453,
      node2Y: 1860,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("체육관 정문", "듀이카 가는길4", 1.65379, 0.110253, "평지", "도보");
//237
  graph.addEdge("듀이카 가는길4", "반야관 입구 앞", 4.70848, 0.313899, "평지", "도보",
      node2X: 1480,
      node2Y: 1859,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 입구 앞", "듀이카 가는길4", 4.70848, 0.313899, "평지", "도보");
//238
  graph.addEdge("반야관 입구 앞", "반야관 입구", 5.54045, 0.369364, "평지", "도보",
      node2X: 1495,
      node2Y: 1832,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 입구", "반야관 입구 앞", 5.54045, 0.369364, "평지", "도보");
//239
  graph.addEdge("반야관 입구 앞", "듀이카 앞 계단 위", 7.09624, 0.473083, "평지", "도보",
      node2X: 1517,
      node2Y: 1873,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 위", "반야관 입구 앞", 7.09624, 0.473083, "평지", "도보");
//240
  graph.addEdge("듀이카 앞 계단 위", "듀이카 앞 계단 중간1", 9.52381, 0.6, "계단아래", "도보",
      node2X: 1541,
      node2Y: 1886,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 중간1", "듀이카 앞 계단 위", 13.3333, 2, "계단위", "도보");
//241
  graph.addEdge("듀이카 앞 계단 중간1", "듀이카 옆 입구", 1.94028, 0.129352, "평지", "도보",
      node2X: 1550,
      node2Y: 1892,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 옆 입구", "듀이카 앞 계단 중간1", 1.94028, 0.129352, "평지", "도보");
//242
  graph.addEdge("듀이카 앞 계단 중간1", "듀이카 앞 계단 중간2", 3.4082, 0.227213, "평지", "도보",
      node2X: 1541,
      node2Y: 1905,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 중간2", "듀이카 앞 계단 중간1", 3.4082, 0.227213, "평지", "도보");
//243
  graph.addEdge("듀이카 앞 계단 중간2", "듀이카 앞 계단 중간3", 20.9524, 1.32, "계단아래", "도보",
      node2X: 1582,
      node2Y: 1920,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 앞 계단 중간3", "듀이카 앞 계단 중간2", 29.3333, 4.4, "계단위", "도보");
//346
  graph.addEdge("듀이카 앞 계단 중간3", "듀이카쪽 학교 입구", 7.61905, 0.48, "계단아래", "도보",
      node2X: 1625,
      node2Y: 1936,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카쪽 학교 입구", "듀이카 앞 계단 중간3", 10.6667, 1.6, "계단위", "도보");
//345
  graph.addEdge("듀이카 앞 계단 중간3", "듀이카 쪽문", 1.09112, 0.0727413, "평지", "도보",
      node2X: 1583,
      node2Y: 1914,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("듀이카 쪽문", "듀이카 앞 계단 중간3", 1.09112, 0.0727413, "평지", "도보");
//244
  graph.addEdge("듀이카 가는길4", "학림관 뒷길1", 18.0612, 1.20408, "평지", "도보",
      node2X: 1482,
      node2Y: 1754,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길1", "듀이카 가는길4", 18.0612, 1.20408, "평지", "도보");
//245
  graph.addEdge("학림관 뒷길1", "반야관 편의점 가는길1", 5.71429, 0.36, "계단아래", "도보",
      node2X: 1541,
      node2Y: 1731,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 편의점 가는길1", "학림관 뒷길1", 8, 1.2, "계단위", "도보");
//246
  graph.addEdge("반야관 편의점 가는길1", "반야관 편의점 가는길2", 20, 1.26, "계단아래", "도보",
      node2X: 1600,
      node2Y: 1775,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 편의점 가는길2", "반야관 편의점 가는길1", 28, 4.2, "계단위", "도보");
//247
  graph.addEdge("반야관 편의점 가는길2", "반야관 편의점 입구", 9.04762, 0.57, "계단아래", "도보",
      node2X: 1626,
      node2Y: 1821,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("반야관 편의점 입구", "반야관 편의점 가는길2", 12.6667, 1.9, "계단위", "도보");
//248
  graph.addEdge("학림관 뒷길1", "학림관 뒷길2", 11.2681, 0.751205, "평지", "도보",
      node2X: 1497,
      node2Y: 1693,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길2", "학림관 뒷길1", 11.2681, 0.751205, "평지", "도보");
//249
  graph.addEdge("학림관 뒷길2", "학림관 뒷길3", 22.3829, 1.49219, "평지", "도보",
      node2X: 1374,
      node2Y: 1714,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길3", "학림관 뒷길2", 22.3829, 1.49219, "평지", "도보");
//250
  graph.addEdge("학림관 뒷길3", "학림관 오른쪽 뒷문", 10.1551, 0.677008, "평지", "도보",
      node2X: 1357,
      node2Y: 1768,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학림관 오른쪽 뒷문", "학림관 뒷길3", 10.1551, 0.677008, "평지", "도보");
//251
  graph.addEdge("학림관 뒷길3", "학림관 뒷길4", 7.14286, 0.45, "계단아래", "도보",
      node2X: 1282,
      node2Y: 1705,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길4", "학림관 뒷길3", 10, 1.5, "계단위", "도보");
//252
  graph.addEdge("학림관 뒷길4", "학림관 뒷문", 12.6667, 1.9, "계단위", "도보",
      node2X: 1276,
      node2Y: 1724,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학림관 뒷문", "학림관 뒷길4", 9.04762, 0.57, "계단아래", "도보");
//253
  graph.addEdge("학림관 뒷길4", "학림관 뒷길5", 18, 2.7, "계단위", "도보",
      node2X: 1215,
      node2Y: 1667,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 뒷길5", "학림관 뒷길4", 12.8571, 0.81, "계단아래", "도보");
//254
  graph.addEdge("학림관 뒷길5", "학림관 왼쪽 뒷문", 9.33333, 1.4, "계단위", "도보",
      node2X: 1197,
      node2Y: 1722,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학림관 왼쪽 뒷문", "학림관 뒷길5", 6.66667, 0.42, "계단아래", "도보");
//255
  graph.addEdge("학림관 뒷길5", "후문 앞", 24.3863, 1.62575, "내리막", "도보",
      node2X: 1114,
      node2Y: 1576,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("후문 앞", "학림관 뒷길5", 29.8084, 3.15859, "오르막", "도보");
//256
  graph.addEdge("후문 앞", "후문 학생회관1", 27.4429, 2.90793, "오르막", "도보",
      node2X: 993,
      node2Y: 1608,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문 학생회관1", "후문 앞", 22.451, 1.49674, "내리막", "도보");
//257
  graph.addEdge("후문 학생회관1", "후문 학생회관2", 11.9983, 0.799886, "평지", "도보",
      node2X: 936,
      node2Y: 1643,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문 학생회관2", "후문 학생회관1", 11.9983, 0.799886, "평지", "도보");
//258
  graph.addEdge("후문 학생회관2", "후문 학생회관3", 19.8116, 1.33049, "오르막", "도보",
      node2X: 882,
      node2Y: 1725,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("후문 학생회관3", "후문 학생회관2", 17.612, 1.17414, "내리막", "도보");
//259
  graph.addEdge("후문 학생회관3", "학생회관 학림관 계단 아래", 13.8761, 1.08746, "오르막", "도보",
      node2X: 869,
      node2Y: 1790,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학생회관 학림관 계단 아래", "후문 학생회관3", 11.8905, 0.792702, "내리막", "도보");
//260
  graph.addEdge("학생회관 학림관 계단 아래", "학생회관 계단 입구", 8.66667, 1.3, "계단위", "도보",
      node2X: 832,
      node2Y: 1817,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학생회관 계단 입구", "학생회관 학림관 계단 아래", 6.19048, 0.39, "계단아래", "도보");
//261
  graph.addEdge("학생회관 학림관 계단 아래", "학생회관 학림관 계단 중간", 18, 2.7, "계단위", "도보",
      node2X: 913,
      node2Y: 1780,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 학림관 계단 중간", "학생회관 학림관 계단 아래", 12.8571, 0.81, "계단아래", "도보");
//262
  graph.addEdge("학생회관 학림관 계단 중간", "학생회관 학림관 계단 위", 2.66667, 0.4, "계단위", "도보",
      node2X: 951,
      node2Y: 1783,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 학림관 계단 위", "학생회관 학림관 계단 중간", 1.90476, 0.12, "계단아래", "도보");
//263
  graph.addEdge("학생회관 학림관 계단 아래", "학생회관 옆 계단 위", 22, 3.3, "계단위", "도보",
      node2X: 861,
      node2Y: 1833,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 옆 계단 위", "학생회관 학림관 계단 아래", 15.7143, 0.99, "계단아래", "도보");
//264
  graph.addEdge("학생회관 옆 계단 위", "팔정도 후문 차도6", 10.8935, 0.726232, "평지", "도보",
      node2X: 879,
      node2Y: 1891,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("팔정도 후문 차도6", "학생회관 옆 계단 위", 10.8935, 0.726232, "평지", "도보");
//265
  graph.addEdge("듀이카 가는길1", "학림관 입구 앞", 14.6389, 0.975926, "평지", "차도",
      node2X: 1244,
      node2Y: 1819,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 입구 앞", "듀이카 가는길1", 14.6389, 0.975926, "평지", "차도");
//266
  graph.addEdge("학림관 입구 앞", "학림관 입구", 6.06979, 0.404653, "평지", "도보",
      node2X: 1255,
      node2Y: 1787,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학림관 입구", "학림관 입구 앞", 6.06979, 0.404653, "평지", "도보");
//267
  graph.addEdge("학림관 입구 앞", "학림관 좌측 앞문 앞", 16.7082, 1.11388, "평지", "차도",
      node2X: 1154,
      node2Y: 1795,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학림관 좌측 앞문 앞", "학림관 입구 앞", 16.7082, 1.11388, "평지", "차도");
  //368
  graph.addEdge("학림관 좌측 앞문 앞", "학림관 좌측 앞문", 6.97735, 0.465157, "평지", "차도",
      node2X: 1166,
      node2Y: 1758,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학림관 좌측 앞문", "학림관 좌측 앞문 앞", 6.97735, 0.465157, "평지", "차도");
  //369
  graph.addEdge("학림관 좌측 앞문 앞", "계산관B 입구 앞", 9.09364, 0.606243, "평지", "차도",
      node2X: 1105,
      node2Y: 1782,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관B 입구 앞", "학림관 좌측 앞문 앞", 9.09364, 0.606243, "평지", "차도");
//268
  graph.addEdge("계산관B 입구 앞", "계산관B 입구 앞2", 6.09096, 0.406064, "평지", "도보",
      node2X: 1097,
      node2Y: 1815,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관B 입구 앞2", "계산관B 입구 앞", 6.09096, 0.406064, "평지", "도보");
//269
  graph.addEdge("계산관B 입구 앞2", "계산관B 입구", 4.74931, 0.31662, "평지", "도보",
      node2X: 1071,
      node2Y: 1810,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관B 입구", "계산관B 입구 앞2", 4.74931, 0.31662, "평지", "도보");
//270
  graph.addEdge("계산관B 입구 앞", "계산관A 계단 위", 12.7144, 0.847627, "평지", "차도",
      node2X: 1037,
      node2Y: 1762,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 계단 위", "계산관B 입구 앞", 12.7144, 0.847627, "평지", "차도");
//271
  graph.addEdge("계산관A 계단 위", "계산관A 계단 아래", 3.80952, 0.24, "계단아래", "도보",
      node2X: 1044,
      node2Y: 1740,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 계단 아래", "계산관A 계단 위", 5.33333, 0.8, "계단위", "도보");
//272
  graph.addEdge("계산관A 계단 아래", "계산관A 학림관 갈림길", 5.79035, 0.386024, "평지", "도보",
      node2X: 1053,
      node2Y: 1709,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 학림관 갈림길", "계산관A 계단 아래", 5.79035, 0.386024, "평지", "도보");
//273
  graph.addEdge("계산관A 학림관 갈림길", "학림관 편의점 입구", 7.14286, 0.45, "계단아래", "도보",
      node2X: 1090,
      node2Y: 1721,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학림관 편의점 입구", "계산관A 학림관 갈림길", 10, 1.5, "계단위", "도보");
//274
  graph.addEdge("계산관A 학림관 갈림길", "계산관A 입구", 3.00694, 0.200462, "평지", "도보",
      node2X: 1058,
      node2Y: 1693,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("계산관A 입구", "계산관A 학림관 갈림길", 3.00694, 0.200462, "평지", "도보");
//275
  graph.addEdge("계산관A 계단 위", "팔정도 후문 차도8", 7.78802, 0.519201, "평지", "차도",
      node2X: 995,
      node2Y: 1751,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도8", "계산관A 계단 위", 7.78802, 0.519201, "평지", "차도");
//276
  graph.addEdge("팔정도 후문 차도8", "팔정도 후문 차도7", 4.96137, 0.330758, "평지", "차도",
      node2X: 968,
      node2Y: 1757,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도7", "팔정도 후문 차도8", 4.96137, 0.330758, "평지", "차도");
//277
  graph.addEdge("팔정도 후문 차도7", "학생회관 학림관 계단 위", 5.5723, 0.371487, "평지", "차도");
  graph.addEdge("학생회관 학림관 계단 위", "팔정도 후문 차도7", 5.5723, 0.371487, "평지", "차도");
//278
  graph.addEdge("학생회관 학림관 계단 위", "팔정도 후문 차도6", 23.2833, 1.55222, "평지", "차도");
  graph.addEdge("팔정도 후문 차도6", "학생회관 학림관 계단 위", 23.2833, 1.55222, "평지", "차도");
//279
  graph.addEdge("팔정도 후문 차도6", "학생회관 입구 앞", 7.37419, 0.491613, "평지", "도보",
      node2X: 840,
      node2Y: 1904,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학생회관 입구 앞", "팔정도 후문 차도6", 7.37419, 0.491613, "평지", "도보");
//280
  graph.addEdge("학생회관 입구 앞", "학생회관 입구", 6.74044, 0.449363, "평지", "도보",
      node2X: 806,
      node2Y: 1888,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("학생회관 입구", "학생회관 입구 앞", 6.74044, 0.449363, "평지", "도보");
//281
  graph.addEdge("학생회관 입구 앞", "정P 3층 입구 앞", 6.81875, 0.454584, "평지", "도보",
      node2X: 841,
      node2Y: 1942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 입구 앞", "학생회관 입구 앞", 6.81875, 0.454584, "평지", "도보");
//282
  graph.addEdge("정P 3층 입구 앞", "정P 밖 3층 계단", 5.25124, 0.350082, "평지", "도보",
      node2X: 812,
      node2Y: 1946,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 밖 3층 계단", "정P 3층 입구 앞", 5.25124, 0.350082, "평지", "도보");
//283
  graph.addEdge("정P 3층 입구 앞", "정P 3층 입구", 5.74292, 0.382862, "평지", "도보",
      node2X: 842,
      node2Y: 1974,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 입구", "정P 3층 입구 앞", 5.74292, 0.382862, "평지", "도보");
//284
  graph.addEdge("정P 3층 입구 앞", "팔정도 후문 차도5", 8.79688, 0.586459, "평지", "도보",
      node2X: 888,
      node2Y: 1928,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("팔정도 후문 차도5", "정P 3층 입구 앞", 8.79688, 0.586459, "평지", "도보");
//285
  graph.addEdge("팔정도 후문 차도5", "팔정도 후문 차도6", 6.83054, 0.455369, "내리막", "차도");
  graph.addEdge("팔정도 후문 차도6", "팔정도 후문 차도5", 8.28354, 0.734448, "오르막", "차도");
//286
  graph.addEdge("팔정도 후문 차도5", "만해광장 계단 아래", 28.9576953, 1.7845426, "오르막", "차도",
      node2X: 913,
      node2Y: 2027,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 계단 아래", "팔정도 후문 차도5", 23.765281, 1.22106, "내리막", "차도");
//287
  graph.addEdge("만해광장 계단 아래", "만해광장 계단 위", 28, 4.2, "계단위", "도보",
      node2X: 999,
      node2Y: 2038,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 계단 위", "만해광장 계단 아래", 20, 1.26, "계단아래", "도보");
//288
  graph.addEdge("만해광장 계단 위", "만해광장 중앙", 18.4446, 1.22964, "평지", "도보",
      node2X: 1101,
      node2Y: 2051,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장 중앙", "만해광장 계단 위", 18.4446, 1.22964, "평지", "도보");
//289
  graph.addEdge("만해광장 중앙", "만해광장 입구", 38.7799, 2.58532, "평지", "도보");
  graph.addEdge("만해광장 입구", "만해광장 중앙", 38.7799, 2.58532, "평지", "도보");
//290
  graph.addEdge("만해광장 계단 아래", "팔정도 후문 차도4", 13.689363, 0.84361731, "오르막", "차도",
      node2X: 924,
      node2Y: 2074,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("팔정도 후문 차도4", "만해광장 계단 아래", 11.234718, 0.577242, "내리막", "차도");
//291
  graph.addEdge("팔정도 후문 차도4", "팔정도 후문 차도3", 43.8804, 3.08353, "오르막", "차도");
  graph.addEdge("팔정도 후문 차도3", "팔정도 후문 차도4", 48.7775, 2.92536, "내리막", "차도");
//292
  graph.addEdge("팔정도 후문 차도4", "원흥관 앞 계단 아래", 20.5872, 1.37248, "내리막", "차도",
      node2X: 880,
      node2Y: 2180,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("원흥관 앞 계단 아래", "팔정도 후문 차도4", 20.5872, 1.37248, "오르막", "차도");
//293
  graph.addEdge("원흥관 앞 계단 아래", "원흥관 앞 계단 중간1", 16.6667, 2.5, "계단위", "도보",
      node2X: 943,
      node2Y: 2161,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 중간1", "원흥관 앞 계단 아래", 11.9048, 0.75, "계단아래", "도보");
//294
  graph.addEdge("원흥관 앞 계단 중간1", "원흥관 앞 계단 중간2", 26, 3.9, "계단위", "도보",
      node2X: 1017,
      node2Y: 2317,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 중간2", "원흥관 앞 계단 중간1", 18.5714, 1.17, "계단아래", "도보");
//295
  graph.addEdge("원흥관 앞 계단 중간2", "원흥관 앞 계단 위", 2.66667, 0.4, "계단위", "도보",
      node2X: 1037,
      node2Y: 2319,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 앞 계단 위", "원흥관 앞 계단 중간2", 1.90476, 0.12, "계단아래", "도보");
//296
  graph.addEdge("원흥관 앞 계단 위", "지하주차장 가는길1", 2.54945, 0.169963, "평지", "도보");
  graph.addEdge("지하주차장 가는길1", "원흥관 앞 계단 위", 2.54945, 0.169963, "평지", "도보");
//297
  graph.addEdge("원흥관 앞 계단 아래", "원흥관 1층 정문 앞", 16.3982, 1.09321, "평지", "차도",
      node2X: 926,
      node2Y: 2259,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 1층 정문 앞", "원흥관 앞 계단 아래", 16.3982, 1.09321, "평지", "차도");
//298
  graph.addEdge("원흥관 1층 정문 앞", "원흥관 1층 정문", 4.67763, 0.311842, "평지", "도보",
      node2X: 912,
      node2Y: 2281,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("원흥관 1층 정문", "원흥관 1층 정문 앞", 4.67763, 0.311842, "평지", "도보");
//299
  graph.addEdge("원흥관 1층 정문 앞", "정P 3층 후문 앞", 21.1309, 1.40873, "평지", "차도",
      node2X: 832,
      node2Y: 2188,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 후문 앞", "원흥관 1층 정문 앞", 21.1309, 1.40873, "평지", "차도");
//300
  graph.addEdge("정P 3층 후문 앞", "원흥관 앞 계단 아래", 8.72895, 0.58193, "평지", "차도");
  graph.addEdge("원흥관 앞 계단 아래", "정P 3층 후문 앞", 8.72895, 0.58193, "평지", "차도");
//301
  graph.addEdge("정P 3층 후문 앞", "정P 3층 후문", 2.5177, 0.167847, "평지", "도보",
      node2X: 833,
      node2Y: 2174,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 3층 후문", "정P 3층 후문 앞", 2.5177, 0.167847, "평지", "도보");
//302
  graph.addEdge("정P 3층 후문 앞", "정P 뒷길1", 6.8164, 0.454426, "평지", "도보",
      node2X: 794,
      node2Y: 2188,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길1", "정P 3층 후문 앞", 6.8164, 0.454426, "평지", "도보");
//303
  graph.addEdge("정P 뒷길1", "원흥관 1층 쪽문", 2.00552, 0.133701, "평지", "도보",
      node2X: 784,
      node2Y: 2193,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("원흥관 1층 쪽문", "정P 뒷길1", 2.00552, 0.133701, "평지", "도보");
//304
  graph.addEdge("정P 뒷길1", "정P 뒷길 계단 위", 13.9062, 0.92708, "평지", "도보",
      node2X: 785,
      node2Y: 2111,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길 계단 위", "정P 뒷길1", 13.9062, 0.92708, "평지", "도보");
//305
  graph.addEdge("정P 뒷길 계단 위", "정P 뒷길 계단 아래", 2.85714, 0.18, "계단아래", "도보",
      node2X: 780,
      node2Y: 2083,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길 계단 아래", "정P 뒷길 계단 위", 4, 0.6, "계단위", "도보");
//306
  graph.addEdge("정P 뒷길 계단 아래", "자취촌 학교 입구", 21.4286, 1.35, "계단아래", "도보",
      node2X: 691,
      node2Y: 2095,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("자취촌 학교 입구", "정P 뒷길 계단 아래", 30, 4.5, "계단위", "도보");
//307
  graph.addEdge("정P 뒷길 계단 아래", "정P 뒷길2", 12.96, 0.864003, "평지", "도보",
      node2X: 774,
      node2Y: 2011,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길2", "정P 뒷길 계단 아래", 12.96, 0.864003, "평지", "도보");
//308
  graph.addEdge("정P 뒷길2", "정P 뒷길3", 5.71429, 0.36, "계단아래", "도보",
      node2X: 774,
      node2Y: 1974,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길3", "정P 뒷길2", 8, 1.2, "계단위", "도보");
//309
  graph.addEdge("정P 뒷길3", "정P 뒷길4", 3.93817, 0.262545, "평지", "도보",
      node2X: 793,
      node2Y: 1963,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 뒷길4", "정P 뒷길3", 3.93817, 0.262545, "평지", "도보");
//310
  graph.addEdge("정P 뒷길4", "정Q 입구 앞", 3.77122, 0.251415, "평지", "도보",
      node2X: 792,
      node2Y: 1942,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정Q 입구 앞", "정P 뒷길4", 3.77122, 0.251415, "평지", "도보");
//311
  graph.addEdge("정Q 입구 앞", "정Q 입구", 2.87006, 0.191337, "평지", "도보",
      node2X: 776,
      node2Y: 1942,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("정Q 입구", "정Q 입구 앞", 2.87006, 0.191337, "평지", "도보");
//312
  graph.addEdge("정Q 입구 앞", "정P 밖 2층 계단", 3.65862, 0.243908, "평지", "도보",
      node2X: 812,
      node2Y: 1946,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 밖 2층 계단", "정Q 입구 앞", 3.65862, 0.243908, "평지", "도보");
//313
  graph.addEdge("정P 밖 2층 계단", "정P 2층 입구", 5.75132, 0.383421, "평지", "도보",
      node2X: 814,
      node2Y: 1978,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("정P 2층 입구", "정P 밖 2층 계단", 5.75132, 0.383421, "평지", "도보");
//314
  graph.addEdge("원흥관 1층 후문", "원흥관 신공학관1", 4.0668, 0.27112, "평지", "도보",
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
  graph.addEdge("원흥관 신공학관1", "원흥관 1층 후문", 4.0668, 0.27112, "평지", "도보");
//315
  graph.addEdge("원흥관 신공학관1", "원흥관 신공학관2", 25.3333, 3.8, "계단위", "도보",
      node2X: 908,
      node2Y: 2436,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 신공학관2", "원흥관 신공학관1", 18.0952, 1.14, "계단아래", "도보");
//316
  graph.addEdge("원흥관 신공학관2", "원흥관 3층 후문", 9.07593, 0.605062, "평지", "도보",
      node2X: 956,
      node2Y: 2452,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("원흥관 3층 후문", "원흥관 신공학관2", 9.07593, 0.605062, "평지", "도보");
//317
  graph.addEdge("원흥관 신공학관2", "원흥별관 후문", 6.36984, 0.424656, "평지", "도보",
      node2X: 873,
      node2Y: 2442,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 후문", "원흥관 신공학관2", 6.36984, 0.424656, "평지", "도보");
//318
  graph.addEdge("원흥관 신공학관2", "원흥별관 정문 앞", 22.5775, 1.50517, "평지", "도보",
      node2X: 867,
      node2Y: 2555,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("원흥별관 정문 앞", "원흥관 신공학관2", 22.5775, 1.50517, "평지", "도보");
//319
  graph.addEdge("원흥별관 정문 앞", "원흥별관 정문", 8.06208, 0.537472, "평지", "도보",
      node2X: 843,
      node2Y: 2517,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 정문", "원흥별관 정문 앞", 8.06208, 0.537472, "평지", "도보");
//320
  graph.addEdge("원흥별관 정문 앞", "108계단 중간1", 2.95839, 0.197226, "평지", "도보",
      node2X: 863,
      node2Y: 2571,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("108계단 중간1", "원흥별관 정문 앞", 2.95839, 0.197226, "평지", "도보");
//321
  graph.addEdge("108계단 중간1", "신공 7층 방향 갈림길", 6.69734, 0.44649, "평지", "도보",
      node2X: 898,
      node2Y: 2584,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 7층 방향 갈림길", "108계단 중간1", 6.69734, 0.44649, "평지", "도보");
  //322
  graph.addEdge("신공 7층 방향 갈림길", "신공 7층 경계", 1.65379, 0.110253, "평지", "도보",
      node2X: 896,
      node2Y: 2593,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 7층 경계", "신공 7층 방향 갈림길", 1.65379, 0.110253, "평지", "도보");
//323
  graph.addEdge("신공 7층 방향 갈림길", "108계단 중간2", 9.24628, 0.616419, "평지", "도보",
      node2X: 947,
      node2Y: 2600,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 중간2", "신공 7층 방향 갈림길", 9.24628, 0.616419, "평지", "도보");
//324
  graph.addEdge("지하주차장 앞", "108계단 위", 6.36226, 0.424151, "평지", "도보",
      node2X: 975,
      node2Y: 2592,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 위", "지하주차장 앞", 6.36226, 0.424151, "평지", "도보");
  //583
  graph.addEdge("108계단 위", "원흥관 3층 야외 계단 앞", 4.7619, 0.3, "계단아래", "도보",
      node2X: 962,
      node2Y: 2588,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단 앞", "108계단 위", 6.66667, 1, "계단위", "도보");
  //584
  graph.addEdge("원흥관 3층 야외 계단 앞", "원흥관 3층 야외 계단", 5.71429, 0.36, "계단아래", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단", "원흥관 3층 야외 계단 앞", 8, 1.2, "계단위", "도보");
  //585
  graph.addEdge("108계단 위", "108계단 중간2", 10.4762, 0.66, "계단아래", "도보");
  graph.addEdge("108계단 중간2", "108계단 위", 14.6667, 2.2, "계단위", "도보");
//325
  graph.addEdge("신공 9층 입구 앞", "원흥관 신공학관 계단 통로", 10.2748, 0.684988, "평지", "도보",
      node2X: 949,
      node2Y: 2590,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 신공학관 계단 통로", "신공 9층 입구 앞", 10.2748, 0.684988, "평지", "도보");
//326
  graph.addEdge("원흥관 신공학관 계단 통로", "원흥관 5층 야외 계단", 1.62434, 0.10829, "평지", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 5층 야외 계단", "원흥관 신공학관 계단 통로", 1.62434, 0.10829, "평지", "도보");
//327
  graph.addEdge("108계단 중간1", "원흥별관 쪽문 앞", 10.9524, 0.69, "계단아래", "도보",
      node2X: 825,
      node2Y: 2558,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 쪽문 앞", "108계단 중간1", 15.3333, 2.3, "계단위", "도보");
//328
  graph.addEdge("원흥별관 쪽문 앞", "원흥별관 쪽문", 2.83623, 0.189082, "평지", "도보",
      node2X: 830,
      node2Y: 2543,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥별관 쪽문", "원흥별관 쪽문 앞", 2.83623, 0.189082, "평지", "도보");
//329
  graph.addEdge("원흥별관 쪽문 앞", "108계단 아래", 20, 1.26, "계단아래", "도보",
      node2X: 760,
      node2Y: 2536,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("108계단 아래", "원흥별관 쪽문 앞", 28, 4.2, "계단위", "도보");
//330
  graph.addEdge("108계단 아래", "신공 3층 입구 앞", 3.13272, 0.208848, "평지", "도보",
      node2X: 753,
      node2Y: 2552,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 앞", "108계단 아래", 3.13272, 0.208848, "평지", "도보");
//331
  graph.addEdge("신공 3층 입구 앞", "신공 3층 입구 계단 앞", 4.73574, 0.315716, "평지", "도보",
      node2X: 742,
      node2Y: 2576,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단 앞", "신공 3층 입구 앞", 4.73574, 0.315716, "평지", "도보");
  //651
  graph.addEdge("신공 3층 입구 계단 앞", "신공 3층 입구 계단 문", 1.13449, 0.0756328, "평지", "도보",
      node2X: 748,
      node2Y: 2578,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단 문", "신공 3층 입구 계단 앞", 1.13449, 0.0756328, "평지", "도보");
  //652
  graph.addEdge("신공 3층 입구 계단 앞", "신공 3층 입구", 1.36611, 0.0910739, "평지", "도보",
      node2X: 739,
      node2Y: 2583,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("신공 3층 입구", "신공 3층 입구 계단 앞", 1.36611, 0.0910739, "평지", "도보");
//332
  graph.addEdge("신공 3층 입구 앞", "신공 오르막", 21.29411765, 1.40914, "내리막", "도보",
      node2X: 636,
      node2Y: 2538,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("신공 오르막", "신공 3층 입구 앞", 27, 3.17029, "오르막", "도보");
//333
  graph.addEdge("신공 오르막", "충무로쪽 입구", 11.4015, 0.7601, "내리막", "도보",
      node2X: 574,
      node2Y: 2552,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("충무로쪽 입구", "신공 오르막", 13.9365, 1.47676, "오르막", "도보");
  //334
  graph.addEdge("충무로쪽 입구", "남산학사 계단 앞", 3.58758, 0.239172, "평지", "도보",
      node2X: 586,
      node2Y: 2568,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("남산학사 계단 앞", "충무로쪽 입구", 3.58758, 0.239172, "평지", "도보");

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
  graph.addEdge("정P 3층 후문", "정P 3층 엘베 갈림길", 3.27336, 0.218224, "평지", "도보",
      node2X: 830,
      node2Y: 2156,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 엘베 갈림길", "정P 3층 후문", 3.27336, 0.218224, "평지", "도보");
  //353
  graph.addEdge("정P 3층 엘베 갈림길", "정P 3층 계단 앞", 1.62434, 0.10829, "평지", "도보",
      node2X: 821,
      node2Y: 2155,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 계단 앞", "정P 3층 엘베 갈림길", 1.62434, 0.10829, "평지", "도보");
  //354
  graph.addEdge("정P 3층 계단 앞", "정P 내 3층 계단", 1.25565, 0.0837101, "평지", "도보",
      node2X: 821,
      node2Y: 2162,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 내 3층 계단", "정P 3층 계단 앞", 1.25565, 0.0837101, "평지", "도보");
  //355
  graph.addEdge("정P 3층 계단 앞", "정P 3층 엘베 앞", 2.16001, 0.144, "평지", "도보",
      node2X: 809,
      node2Y: 2156,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 엘베 앞", "정P 3층 계단 앞", 2.16001, 0.144, "평지", "도보");
  //356
  graph.addEdge("정P 3층 엘베 앞", "정P 3층 엘베", 1.09112, 0.0727413, "평지", "도보",
      node2X: 810,
      node2Y: 2162,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 엘베", "정P 3층 엘베 앞", 1.09112, 0.0727413, "평지", "도보");
  //357
  graph.addEdge("정P 3층 엘베 갈림길", "정P 3층 정문 갈림길", 27.0238, 1.80158, "평지", "도보",
      node2X: 816,
      node2Y: 2006,
      isInside2: 3,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 3층 정문 갈림길", "정P 3층 엘베 갈림길", 27.0238, 1.80158, "평지", "도보");
  //358
  graph.addEdge("정P 3층 정문 갈림길", "정P 3층 입구", 7.39598, 0.493065, "평지", "도보");
  graph.addEdge("정P 3층 입구", "정P 3층 정문 갈림길", 7.39598, 0.493065, "평지", "도보");

  //정P 내 계단 2층 - 3층 이동
  graph.addEdge("정P 내 3층 계단", "정P 내 2층 계단", 9.52381, 0.6, "계단아래", "도보",
      node2X: 821,
      node2Y: 2162,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 내 2층 계단", "정P 내 3층 계단", 13.3333, 2, "계단위", "도보");
  //정P 엘베 2층 - 3층 이동
  graph.addEdge("정P 3층 엘베", "정P 2층 엘베", 132, 0, "엘베", "도보",
      node2X: 810,
      node2Y: 2162,
      isInside2: 2,
      building2: "정p",
      showRoute2: true);
  graph.addEdge("정P 2층 엘베", "정P 3층 엘베", 132, 0, "엘베", "도보");
  //361
  graph.addEdge("정P 2층 엘베", "정P 2층 엘베 앞", 1.09112, 0.0727413, "평지", "도보",
      node2X: 809,
      node2Y: 2156,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 엘베 앞", "정P 2층 엘베", 1.09112, 0.0727413, "평지", "도보");
  //362
  graph.addEdge("정P 2층 엘베 앞", "정P 내 2층 계단 앞", 2.16001, 0.144, "평지", "도보",
      node2X: 821,
      node2Y: 2155,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 내 2층 계단 앞", "정P 2층 엘베 앞", 2.16001, 0.144, "평지", "도보");
  //363
  graph.addEdge("정P 내 2층 계단 앞", "정P 내 2층 계단", 1.25565, 0.0837101, "평지", "도보");
  graph.addEdge("정P 내 2층 계단", "정P 내 2층 계단 앞", 1.25565, 0.0837101, "평지", "도보");
  //364
  graph.addEdge("정P 내 2층 계단 앞", "정P 2층 엘베 갈림길", 1.62434, 0.10829, "평지", "도보",
      node2X: 830,
      node2Y: 2156,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 엘베 갈림길", "정P 내 2층 계단 앞", 1.62434, 0.10829, "평지", "도보");
  //365
  graph.addEdge("정P 2층 엘베 갈림길", "정P 2층 정문 갈림길", 27.0238, 1.80158, "평지", "도보",
      node2X: 816,
      node2Y: 2006,
      isInside2: 2,
      building2: "정p",
      showRoute2: false);
  graph.addEdge("정P 2층 정문 갈림길", "정P 2층 엘베 갈림길", 27.0238, 1.80158, "평지", "도보");
  //366
  graph.addEdge("정P 2층 정문 갈림길", "정P 2층 입구", 5.0354, 0.335694, "평지", "도보");
  graph.addEdge("정P 2층 입구", "정P 2층 정문 갈림길", 5.0354, 0.335694, "평지", "도보");

  //정P 밖 계단 2층 - 3층 이동
  graph.addEdge("정P 밖 2층 계단", "정P 밖 3층 계단", 13.3333, 2, "계단위", "도보");
  graph.addEdge("정P 밖 3층 계단", "정P 밖 2층 계단", 9.52381, 0.6, "계단아래", "도보");
  //**************************************************************************
  //신공학관
  //입구: 1층 입구, 1층 옆문, 3층 입구, 7층 입구, 9층 입구)
  //733
  graph.addEdge("남산학사 계단 앞", "남산학사 계단 위", 1.90682, 0.127122, "평지", "도보",
      node2X: 593,
      node2Y: 2576,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 계단 위", "남산학사 계단 앞", 1.90682, 0.127122, "평지", "도보");
//335
  graph.addEdge("남산학사 계단 위", "남산학사 계단 아래", 5.71429, 0.36, "계단아래", "도보",
      node2X: 598,
      node2Y: 2595,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 계단 아래", "남산학사 계단 위", 8, 1.2, "계단위", "도보");
//336
  graph.addEdge("남산학사 계단 아래", "남산학사 식당 앞2", 5.62975, 0.375317, "평지", "도보",
      node2X: 614,
      node2Y: 2622,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 식당 앞2", "남산학사 계단 아래", 5.62975, 0.375317, "평지", "도보");
//337
  graph.addEdge("남산학사 식당 앞2", "남산학사 식당 앞", 8.11181, 0.540787, "평지", "도보",
      node2X: 657,
      node2Y: 2636,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 식당 앞", "남산학사 식당 앞2", 8.11181, 0.540787, "평지", "도보");
//338
  graph.addEdge("남산학사 식당 앞", "남산학사 식당 입구", 10.0212, 0.668077, "평지", "도보",
      node2X: 618,
      node2Y: 2676,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 식당 입구", "남산학사 식당 앞", 10.0212, 0.668077, "평지", "도보");
//339
  graph.addEdge("남산학사 식당 앞", "남산학사 입구 앞", 3.35107, 0.223405, "평지", "도보",
      node2X: 675,
      node2Y: 2641,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 입구 앞", "남산학사 식당 앞", 3.35107, 0.223405, "평지", "도보");
//340
  graph.addEdge("남산학사 입구 앞", "남산학사 카페 입구", 13.2315, 0.882103, "평지", "도보",
      node2X: 655,
      node2Y: 2712,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 카페 입구", "남산학사 입구 앞", 13.2315, 0.882103, "평지", "도보");
//341
  graph.addEdge("남산학사 입구 앞", "남산학사 입구", 3.2338, 0.215587, "평지", "도보",
      node2X: 681,
      node2Y: 2624,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 입구", "남산학사 입구 앞", 3.2338, 0.215587, "평지", "도보");
//342
  graph.addEdge("남산학사 입구 앞", "남산학사 편의점 앞", 3.63214, 0.242143, "평지", "도보",
      node2X: 694,
      node2Y: 2648,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 편의점 앞", "남산학사 입구 앞", 3.63214, 0.242143, "평지", "도보");
//343
  graph.addEdge("남산학사 편의점 앞", "남산학사 편의점 입구", 12.8766, 0.85844, "평지", "도보",
      node2X: 671,
      node2Y: 2716,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("남산학사 편의점 입구", "남산학사 편의점 앞", 12.8766, 0.85844, "평지", "도보");
//344
  graph.addEdge("남산학사 편의점 앞", "신공 1층 입구 갈림길", 3.00694, 0.200462, "평지", "도보",
      node2X: 710,
      node2Y: 2653,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 입구 갈림길", "남산학사 편의점 앞", 3.00694, 0.200462, "평지", "도보");
//347
  graph.addEdge("신공 1층 입구 갈림길", "신공 1층 옆문", 12.991, 0.866069, "평지", "도보",
      node2X: 688,
      node2Y: 2722,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 1층 옆문", "신공 1층 입구 갈림길", 12.991, 0.866069, "평지", "도보");
//348
  graph.addEdge("신공 1층 입구 갈림길", "신공 1층 입구", 16.3943, 1.09295, "평지", "도보",
      node2X: 797,
      node2Y: 2681,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 1층 입구", "신공 1층 입구 갈림길", 16.3943, 1.09295, "평지", "도보");
  //370
  graph.addEdge("신공 1층 옆문", "신공 1층 옆문 앞", 8.67904, 0.578603, "평지", "도보",
      node2X: 673,
      node2Y: 2768,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 옆문 앞", "신공 1층 옆문", 8.67904, 0.578603, "평지", "도보");
  //371
  graph.addEdge("신공 1층 옆문 앞", "신공 1층 뒷계단 앞1", 4.59784, 0.306523, "평지", "도보",
      node2X: 697,
      node2Y: 2777,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단 앞1", "신공 1층 옆문 앞", 4.59784, 0.306523, "평지", "도보");
  //372
  graph.addEdge("신공 1층 뒷계단 앞1", "신공 1층 뒷계단 앞2", 1.87277, 0.124851, "평지", "도보",
      node2X: 707,
      node2Y: 2780,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단 앞2", "신공 1층 뒷계단 앞1", 1.87277, 0.124851, "평지", "도보");
  //373
  graph.addEdge("신공 1층 뒷계단 앞2", "신공 1층 뒷계단 앞3", 2.83623, 0.189082, "평지", "도보",
      node2X: 712,
      node2Y: 2765,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단 앞3", "신공 1층 뒷계단 앞2", 2.83623, 0.189082, "평지", "도보");
  //374
  graph.addEdge("신공 1층 뒷계단 앞1", "신공 1층 뒷엘베 앞", 2.78471, 0.185647, "평지", "도보",
      node2X: 701,
      node2Y: 2762,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷엘베 앞", "신공 1층 뒷계단 앞1", 2.78471, 0.185647, "평지", "도보");
  //375
  graph.addEdge("신공 1층 뒷엘베 앞", "신공 1층 뒷계단", 1.09112, 0.0727413, "평지", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단", "신공 1층 뒷엘베 앞", 1.09112, 0.0727413, "평지", "도보");
  //신공 뒷계단 1층 - 3층 이동
  graph.addEdge("신공 1층 뒷계단", "신공 3층 뒷계단", 33.3333, 5, "계단위", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒷계단", "신공 1층 뒷계단", 23.8095, 1.5, "계단아래", "도보");
  //신공 뒷계단 3층 - 7층 이동
  graph.addEdge("신공 3층 뒷계단", "신공 7층 뒷계단", 53.3333, 8, "계단위", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒷계단", "신공 3층 뒷계단", 38.0952, 2.4, "계단아래", "도보");
  //신공 뒷계단 7층 - 9층 이동
  graph.addEdge("신공 7층 뒷계단", "신공 9층 뒷계단", 26.6667, 4, "계단위", "도보",
      node2X: 695,
      node2Y: 2761,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒷계단", "신공 7층 뒷계단", 19.0476, 1.2, "계단아래", "도보");
  //376
  graph.addEdge("신공 1층 뒷엘베 앞", "신공 1층 뒷엘베", 0.965984, 0.064399, "평지", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷엘베", "신공 1층 뒷엘베 앞", 0.965984, 0.064399, "평지", "도보");
  //신공 뒷엘베 1층 - 3층 이동
  graph.addEdge("신공 1층 뒷엘베", "신공 3층 뒷엘베", 216, 0, "엘베", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 3층 뒷엘베", "신공 1층 뒷엘베", 216, 0, "엘베", "도보");
  //신공 뒷엘베 1층 - 7층 이동
  graph.addEdge("신공 1층 뒷엘베", "신공 7층 뒷엘베", 264, 0, "엘베", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 7층 뒷엘베", "신공 1층 뒷엘베", 264, 0, "엘베", "도보");
  //신공 뒷엘베 1층 - 9층 이동
  graph.addEdge("신공 1층 뒷엘베", "신공 9층 뒷엘베", 288, 0, "엘베", "도보",
      node2X: 703,
      node2Y: 2757,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 9층 뒷엘베", "신공 1층 뒷엘베", 288, 0, "엘베", "도보");
  //신공 뒷엘베 3층 - 7층 이동
  graph.addEdge("신공 3층 뒷엘베", "신공 7층 뒷엘베", 240, 0, "엘베", "도보");
  graph.addEdge("신공 7층 뒷엘베", "신공 3층 뒷엘베", 240, 0, "엘베", "도보");
  //신공 뒷엘베 3층 - 9층 이동
  graph.addEdge("신공 3층 뒷엘베", "신공 9층 뒷엘베", 264, 0, "엘베", "도보");
  graph.addEdge("신공 9층 뒷엘베", "신공 3층 뒷엘베", 264, 0, "엘베", "도보");
  //신공 뒷엘베 7층 - 9층 이동
  graph.addEdge("신공 7층 뒷엘베", "신공 9층 뒷엘베", 216, 0, "엘베", "도보");
  graph.addEdge("신공 9층 뒷엘베", "신공 7층 뒷엘베", 216, 0, "엘베", "도보");
  //377
  graph.addEdge("신공 1층 뒷엘베 앞", "신공 1층 뒷계단 앞3", 2.04523, 0.136349, "평지", "도보");
  graph.addEdge("신공 1층 뒷계단 앞3", "신공 1층 뒷엘베 앞", 2.04523, 0.136349, "평지", "도보");
  //378
  graph.addEdge("신공 1층 뒷계단 앞3", "신공 1층 뒷계단 앞4", 2.09958, 0.139972, "평지", "도보",
      node2X: 716,
      node2Y: 2754,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒷계단 앞4", "신공 1층 뒷계단 앞3", 2.09958, 0.139972, "평지", "도보");
  //379
  graph.addEdge("신공 1층 뒷계단 앞4", "신공 1층 뒤편1", 12.8278, 0.855185, "평지", "도보",
      node2X: 783,
      node2Y: 2779,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒤편1", "신공 1층 뒷계단 앞4", 12.8278, 0.855185, "평지", "도보");
  //380
  graph.addEdge("신공 1층 뒤편1", "신공 1층 뒤편2", 6.36226, 0.424151, "평지", "도보",
      node2X: 816,
      node2Y: 2792,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒤편2", "신공 1층 뒤편1", 6.36226, 0.424151, "평지", "도보");
  //395
  graph.addEdge("신공 1층 뒤편2", "신공 1층 뒤편3", 2.24761, 0.149841, "평지", "도보",
      node2X: 827,
      node2Y: 2786,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 뒤편3", "신공 1층 뒤편2", 2.24761, 0.149841, "평지", "도보");
  //381
  graph.addEdge("신공 1층 뒤편3", "신공 1층 화장실 오른쪽", 9.07593, 0.605062, "평지", "도보",
      node2X: 843,
      node2Y: 2738,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 화장실 오른쪽", "신공 1층 뒤편3", 9.07593, 0.605062, "평지", "도보");
  //382
  graph.addEdge("신공 1층 뒤편1", "신공 1층 화장실 왼쪽", 10.5605, 0.704035, "평지", "도보",
      node2X: 804,
      node2Y: 2724,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 화장실 왼쪽", "신공 1층 뒤편1", 10.5605, 0.704035, "평지", "도보");
  //383
  graph.addEdge("신공 1층 화장실 왼쪽", "신공 1층 화장실 오른쪽", 7.43287, 0.495524, "평지", "도보");
  graph.addEdge("신공 1층 화장실 오른쪽", "신공 1층 화장실 왼쪽", 7.43287, 0.495524, "평지", "도보");
  //384
  graph.addEdge("신공 1층 화장실 왼쪽", "신공 1층 입구 앞", 7.03476, 0.468984, "평지", "도보",
      node2X: 817,
      node2Y: 2687,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 입구 앞", "신공 1층 화장실 왼쪽", 7.03476, 0.468984, "평지", "도보");
  //385
  graph.addEdge("신공 1층 입구 앞", "신공 1층 입구", 3.74554, 0.249703, "평지", "도보");
  graph.addEdge("신공 1층 입구", "신공 1층 입구 앞", 3.74554, 0.249703, "평지", "도보");
  //386
  graph.addEdge("신공 1층 입구 앞", "신공 1층 왼쪽 위", 11.0256, 0.73504, "평지", "도보",
      node2X: 840,
      node2Y: 2630,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 왼쪽 위", "신공 1층 입구 앞", 11.0256, 0.73504, "평지", "도보");
  //387
  graph.addEdge("신공 1층 왼쪽 위", "신공 1층 9층 엘베 앞", 2.09958, 0.139972, "평지", "도보",
      node2X: 851,
      node2Y: 2634,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 9층 엘베 앞", "신공 1층 왼쪽 위", 2.09958, 0.139972, "평지", "도보");
  //388
  graph.addEdge("신공 1층 9층 엘베 앞", "신공 1층 9층 엘베", 2.09958, 0.139972, "평지", "도보",
      node2X: 847,
      node2Y: 2645,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 9층 엘베", "신공 1층 9층 엘베 앞", 2.09958, 0.139972, "평지", "도보");
  //신공 9층 엘베 1층 - 9층 이동
  graph.addEdge("신공 1층 9층 엘베", "신공 9층 9층 엘베", 153, 0, "엘베", "도보",
      node2X: 847,
      node2Y: 2645,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 9층 9층 엘베", "신공 1층 9층 엘베", 153, 0, "엘베", "도보");
  //389
  graph.addEdge("신공 1층 9층 엘베 앞", "신공 1층 전층 엘베 앞", 2.66666, 0.177777, "평지", "도보",
      node2X: 865,
      node2Y: 2639,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 전층 엘베 앞", "신공 1층 9층 엘베 앞", 2.66666, 0.177777, "평지", "도보");
  //390
  graph.addEdge("신공 1층 전층 엘베 앞", "신공 1층 전층 엘베", 2.09958, 0.139972, "평지", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 전층 엘베", "신공 1층 전층 엘베 앞", 2.09958, 0.139972, "평지", "도보");
  //신공 전층 엘베 1층 - 3층
  graph.addEdge("신공 1층 전층 엘베", "신공 3층 전층 엘베", 264, 0, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 3층 전층 엘베", "신공 1층 전층 엘베", 264, 0, "엘베", "도보");
  //신공 전층 엘베 1층 - 7층
  graph.addEdge("신공 1층 전층 엘베", "신공 7층 전층 엘베", 312, 0, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 7층 전층 엘베", "신공 1층 전층 엘베", 312, 0, "엘베", "도보");
  //신공 전층 엘베 1층 - 9층
  graph.addEdge("신공 1층 전층 엘베", "신공 9층 전층 엘베", 336, 0, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 9층 전층 엘베", "신공 1층 전층 엘베", 336, 0, "엘베", "도보");
  //신공 전층 엘베 3층 - 7층
  graph.addEdge("신공 3층 전층 엘베", "신공 7층 전층 엘베", 288, 0, "엘베", "도보");
  graph.addEdge("신공 7층 전층 엘베", "신공 3층 전층 엘베", 288, 0, "엘베", "도보");
  //신공 전층 엘베 3층 - 9층
  graph.addEdge("신공 3층 전층 엘베", "신공 9층 전층 엘베", 312, 0, "엘베", "도보");
  graph.addEdge("신공 9층 전층 엘베", "신공 3층 전층 엘베", 312, 0, "엘베", "도보");
  //신공 전층 엘베 7층 - 9층
  graph.addEdge("신공 7층 전층 엘베", "신공 9층 전층 엘베", 264, 0, "엘베", "도보",
      node2X: 861,
      node2Y: 2650,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 9층 전층 엘베", "신공 7층 전층 엘베", 264, 0, "엘베", "도보");
  //391
  graph.addEdge("신공 1층 전층 엘베 앞", "신공 1층 오른쪽 위", 1.93197, 0.128798, "평지", "도보",
      node2X: 875,
      node2Y: 2643,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 오른쪽 위", "신공 1층 전층 엘베 앞", 1.93197, 0.128798, "평지", "도보");
  //392
  graph.addEdge("신공 1층 오른쪽 위", "신공 1층 계단 앞", 6.06979, 0.404653, "평지", "도보",
      node2X: 864,
      node2Y: 2675,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 계단 앞", "신공 1층 오른쪽 위", 6.06979, 0.404653, "평지", "도보");
  //393
  graph.addEdge("신공 1층 계단 앞", "신공 1층 계단", 0.914656, 0.0609771, "평지", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 1,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 1층 계단", "신공 1층 계단 앞", 0.914656, 0.0609771, "평지", "도보");
  //신공 계단 1층 - 3층 이동
  graph.addEdge("신공 1층 계단", "신공 3층 계단", 33.3333, 5, "계단위", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 계단", "신공 1층 계단", 23.8095, 1.5, "계단아래", "도보");
  //신공 계단 3층 - 7층 이동
  graph.addEdge("신공 3층 계단", "신공 7층 계단", 53.3333, 8, "계단위", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 계단", "신공 3층 계단", 38.0952, 2.4, "계단아래", "도보");
  //신공 계단 7층 - 9층 이동
  graph.addEdge("신공 7층 계단", "신공 9층 계단", 26.6667, 4, "계단위", "도보",
      node2X: 859,
      node2Y: 2674,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 계단", "신공 7층 계단", 19.0476, 1.2, "계단아래", "도보");
  //394
  graph.addEdge("신공 1층 계단 앞", "신공 1층 화장실 오른쪽", 11.9122, 0.794144, "평지", "도보");
  graph.addEdge("신공 1층 화장실 오른쪽", "신공 1층 계단 앞", 11.9122, 0.794144, "평지", "도보");
  //653
  graph.addEdge("신공 3층 입구", "신공 3층 입구 안", 0.965984, 0.064399, "평지", "도보",
      node2X: 737,
      node2Y: 2588,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 안", "신공 3층 입구", 0.965984, 0.064399, "평지", "도보");
  //657
  graph.addEdge("신공 3층 입구 계단 문", "신공 3층 입구 계단", 1.20331, 0.0802206, "평지", "도보",
      node2X: 754,
      node2Y: 2581,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단", "신공 3층 입구 계단 문", 1.20331, 0.0802206, "평지", "도보");
  //신공 입구 계단 3층 - 7층 이동
  graph.addEdge("신공 3층 입구 계단", "신공 7층 입구 계단", 120, 120, "평지", "도보",
      node2X: 754,
      node2Y: 2581,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 입구 계단", "신공 3층 입구 계단", 64, 64, "평지", "도보");
  //675
  graph.addEdge("신공 3층 입구 계단", "신공 3층 입구 계단 안쪽 문", 0.914656, 0.0609771, "평지", "도보",
      node2X: 753,
      node2Y: 2586,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단 안쪽 문", "신공 3층 입구 계단", 0.914656, 0.0609771, "평지", "도보");
  //656
  graph.addEdge("신공 3층 입구 안", "신공 3층 입구 계단 안쪽 문 앞", 2.8924, 0.192826, "평지", "도보",
      node2X: 753,
      node2Y: 2586,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 입구 계단 안쪽 문 앞", "신공 3층 입구 안", 2.8924, 0.192826, "평지", "도보");
  //654
  graph.addEdge("신공 3층 입구 계단 안쪽 문 앞", "신공 3층 왼쪽 위", 17.09, 1.13933, "평지", "도보",
      node2X: 839,
      node2Y: 2627,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 왼쪽 위", "신공 3층 입구 계단 안쪽 문 앞", 17.09, 1.13933, "평지", "도보");
  //655
  graph.addEdge("신공 3층 왼쪽 위", "신공 3층 전층 엘베 앞", 4.76621, 0.317748, "평지", "도보",
      node2X: 864,
      node2Y: 2636,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 전층 엘베 앞", "신공 3층 왼쪽 위", 4.76621, 0.317748, "평지", "도보");
  //658
  graph.addEdge("신공 3층 전층 엘베 앞", "신공 3층 전층 엘베", 2.49846, 0.166564, "평지", "도보",
      node2X: 851,
      node2Y: 2631,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 전층 엘베", "신공 3층 전층 엘베 앞", 2.49846, 0.166564, "평지", "도보");
  //659
  graph.addEdge("신공 3층 전층 엘베 앞", "신공 3층 오른쪽 위", 2.33192, 0.155462, "평지", "도보",
      node2X: 876,
      node2Y: 2641,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 오른쪽 위", "신공 3층 전층 엘베 앞", 2.33192, 0.155462, "평지", "도보");
  //660
  graph.addEdge("신공 3층 오른쪽 위", "신공 3층 화장실 오른쪽", 18.4377, 1.22918, "평지", "도보",
      node2X: 842,
      node2Y: 2738,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 화장실 오른쪽", "신공 3층 오른쪽 위", 18.4377, 1.22918, "평지", "도보");
  //661
  graph.addEdge("신공 3층 화장실 오른쪽", "신공 3층 화장실 왼쪽", 7.26429, 0.484286, "평지", "도보",
      node2X: 804,
      node2Y: 2724,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 화장실 왼쪽", "신공 3층 화장실 오른쪽", 7.26429, 0.484286, "평지", "도보");
  //662
  graph.addEdge("신공 3층 화장실 오른쪽", "신공 3층 뒤편3", 9.13424, 0.608949, "평지", "도보",
      node2X: 825,
      node2Y: 2786,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편3", "신공 3층 화장실 오른쪽", 9.13424, 0.608949, "평지", "도보");
  //663
  graph.addEdge("신공 3층 뒤편3", "신공 3층 뒤편2", 2.00552, 0.133701, "평지", "도보",
      node2X: 815,
      node2Y: 2791,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편2", "신공 3층 뒤편3", 2.00552, 0.133701, "평지", "도보");
  //664
  graph.addEdge("신공 3층 뒤편2", "신공 3층 뒤편1", 5.96283, 0.397522, "평지", "도보",
      node2X: 784,
      node2Y: 2779,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편1", "신공 3층 뒤편2", 5.96283, 0.397522, "평지", "도보");
  //665
  graph.addEdge("신공 3층 왼쪽 위", "신공 3층 화장실 왼쪽", 18.4978, 1.23318, "평지", "도보");
  graph.addEdge("신공 3층 화장실 왼쪽", "신공 3층 왼쪽 위", 18.4978, 1.23318, "평지", "도보");
  //666
  graph.addEdge("신공 3층 뒤편1", "신공 3층 화장실 왼쪽", 10.4979, 0.699858, "평지", "도보");
  graph.addEdge("신공 3층 화장실 왼쪽", "신공 3층 뒤편1", 10.4979, 0.699858, "평지", "도보");
  //667
  graph.addEdge("신공 3층 뒤편1", "신공 3층 뒤편4", 4.89937, 0.326625, "평지", "도보",
      node2X: 773,
      node2Y: 2804,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편4", "신공 3층 뒤편1", 4.89937, 0.326625, "평지", "도보");
  //668
  graph.addEdge("신공 3층 뒤편4", "신공 3층 뒷엘베 앞", 14.7593, 0.983953, "평지", "도보",
      node2X: 696,
      node2Y: 2775,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒷엘베 앞", "신공 3층 뒤편4", 14.7593, 0.983953, "평지", "도보");
  //669
  graph.addEdge("신공 3층 뒷엘베 앞", "신공 3층 뒷계단 앞", 2.26898, 0.151266, "평지", "도보",
      node2X: 700,
      node2Y: 2763,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒷계단 앞", "신공 3층 뒷엘베 앞", 2.26898, 0.151266, "평지", "도보");
  //670
  graph.addEdge("신공 3층 뒷계단 앞", "신공 3층 뒷엘베", 1.20331, 0.0802206, "평지", "도보");
  graph.addEdge("신공 3층 뒷엘베", "신공 3층 뒷계단 앞", 1.20331, 0.0802206, "평지", "도보");
  //671
  graph.addEdge("신공 3층 뒷계단 앞", "신공 3층 뒷계단", 0.965984, 0.064399, "평지", "도보");
  graph.addEdge("신공 3층 뒷계단", "신공 3층 뒷계단 앞", 0.965984, 0.064399, "평지", "도보");
  //672
  graph.addEdge("신공 3층 뒷엘베 앞", "신공 3층 뒤편5", 4.43033, 0.295355, "평지", "도보",
      node2X: 673,
      node2Y: 2766,
      isInside2: 3,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 3층 뒤편5", "신공 3층 뒷엘베 앞", 4.43033, 0.295355, "평지", "도보");
  //673
  graph.addEdge("신공 3층 입구 안", "신공 3층 뒤편5", 33.9306, 2.26204, "평지", "도보");
  graph.addEdge("신공 3층 뒤편5", "신공 3층 입구 안", 33.9306, 2.26204, "평지", "도보");
  //703
  graph.addEdge("신공 7층 경계", "신공 7층 경계 안", 4.19915, 0.279943, "평지", "도보",
      node2X: 888,
      node2Y: 2615,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 경계 안", "신공 7층 경계", 4.19915, 0.279943, "평지", "도보");
  //676
  graph.addEdge("신공 7층 경계 안", "신공 7층 입구 앞", 2.78471, 0.185647, "평지", "도보",
      node2X: 873,
      node2Y: 2611,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 입구 앞", "신공 7층 경계 안", 2.78471, 0.185647, "평지", "도보");
  //677
  graph.addEdge("신공 7층 입구 앞", "신공 7층 입구 계단 가는길1", 17.0749, 1.13833, "평지", "도보",
      node2X: 783,
      node2Y: 2580,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 입구 계단 가는길1", "신공 7층 입구 앞", 17.0749, 1.13833, "평지", "도보");
  //678
  graph.addEdge("신공 7층 입구 계단 가는길1", "신공 7층 입구 계단 가는길2", 5.06408, 0.337605, "평지", "도보",
      node2X: 772,
      node2Y: 2606,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 입구 계단 가는길2", "신공 7층 입구 계단 가는길1", 5.06408, 0.337605, "평지", "도보");
  //679
  graph.addEdge("신공 7층 입구 계단 가는길2", "신공 7층 입구 계단 앞", 4.36816, 0.291211, "평지", "도보",
      node2X: 749,
      node2Y: 2598,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 입구 계단 앞", "신공 7층 입구 계단 가는길2", 4.36816, 0.291211, "평지", "도보");
  //680
  graph.addEdge("신공 7층 입구 계단 앞", "신공 7층 입구 계단 문", 2.26898, 0.151266, "평지", "도보",
      node2X: 753,
      node2Y: 2586,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 입구 계단 문", "신공 7층 입구 계단 앞", 2.26898, 0.151266, "평지", "도보");
  //702
  graph.addEdge("신공 7층 입구 계단 문", "신공 7층 입구 계단", 0.914656, 0.0609771, "평지", "도보");
  graph.addEdge("신공 7층 입구 계단", "신공 7층 입구 계단 문", 0.914656, 0.0609771, "평지", "도보");
  //704
  graph.addEdge("신공 7층 입구 앞", "신공 7층 입구", 1.65379, 0.110253, "평지", "도보",
      node2X: 871,
      node2Y: 2620,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: true);
  graph.addEdge("신공 7층 입구", "신공 7층 입구 앞", 1.65379, 0.110253, "평지", "도보");
  //681
  graph.addEdge("신공 7층 입구", "신공 7층 전층 엘베 앞", 4.76621, 0.317748, "평지", "도보",
      node2X: 862,
      node2Y: 2645,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 전층 엘베 앞", "신공 7층 입구", 4.76621, 0.317748, "평지", "도보");
  //682
  graph.addEdge("신공 7층 입구", "신공 7층 왼쪽 위", 6.74044, 0.449363, "평지", "도보",
      node2X: 837,
      node2Y: 2636,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 왼쪽 위", "신공 7층 입구", 6.74044, 0.449363, "평지", "도보");
  //683
  graph.addEdge("신공 7층 왼쪽 위", "신공 7층 전층 엘베 앞", 4.76621, 0.317748, "평지", "도보");
  graph.addEdge("신공 7층 전층 엘베 앞", "신공 7층 왼쪽 위", 4.76621, 0.317748, "평지", "도보");
  //684
  graph.addEdge("신공 7층 전층 엘베 앞", "신공 7층 전층 엘베", 0.914656, 0.0609771, "평지", "도보");
  graph.addEdge("신공 7층 전층 엘베", "신공 7층 전층 엘베 앞", 0.914656, 0.0609771, "평지", "도보");
  //705
  graph.addEdge("신공 7층 전층 엘베 앞", "신공 7층 오른쪽 위", 2.09958, 0.139972, "평지", "도보",
      node2X: 873,
      node2Y: 2649,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 오른쪽 위", "신공 7층 전층 엘베 앞", 2.09958, 0.139972, "평지", "도보");
  //685
  graph.addEdge("신공 7층 오른쪽 위", "신공 7층 화장실 오른쪽", 16.9054, 1.12703, "평지", "도보",
      node2X: 842,
      node2Y: 2738,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 화장실 오른쪽", "신공 7층 오른쪽 위", 16.9054, 1.12703, "평지", "도보");
  //686
  graph.addEdge("신공 7층 화장실 오른쪽", "신공 7층 화장실 왼쪽", 7.16169, 0.477446, "평지", "도보",
      node2X: 805,
      node2Y: 2723,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 화장실 왼쪽", "신공 7층 화장실 오른쪽", 7.16169, 0.477446, "평지", "도보");
  //692
  graph.addEdge("신공 7층 화장실 왼쪽", "신공 7층 왼쪽 위", 16.6281, 1.10854, "평지", "도보");
  graph.addEdge("신공 7층 왼쪽 위", "신공 7층 화장실 왼쪽", 16.6281, 1.10854, "평지", "도보");
  //687
  graph.addEdge("신공 7층 화장실 오른쪽", "신공 7층 뒤편1", 8.90594, 0.593729, "평지", "도보",
      node2X: 826,
      node2Y: 2785,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒤편1", "신공 7층 화장실 오른쪽", 8.90594, 0.593729, "평지", "도보");
  //688
  graph.addEdge("신공 7층 뒤편1", "신공 7층 뒤편2", 7.76111, 0.517408, "평지", "도보",
      node2X: 790,
      node2Y: 2809,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒤편2", "신공 7층 뒤편1", 7.76111, 0.517408, "평지", "도보");
  //689
  graph.addEdge("신공 7층 뒤편2", "신공 7층 뒤편3", 2.83623, 0.189082, "평지", "도보",
      node2X: 775,
      node2Y: 2804,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒤편3", "신공 7층 뒤편2", 2.83623, 0.189082, "평지", "도보");
  //690
  graph.addEdge("신공 7층 뒤편3", "신공 7층 뒤편4", 6.97735, 0.465157, "평지", "도보",
      node2X: 787,
      node2Y: 2767,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒤편4", "신공 7층 뒤편3", 6.97735, 0.465157, "평지", "도보");
  //691
  graph.addEdge("신공 7층 뒤편4", "신공 7층 화장실 왼쪽", 8.52757, 0.568505, "평지", "도보");
  graph.addEdge("신공 7층 화장실 왼쪽", "신공 7층 뒤편4", 8.52757, 0.568505, "평지", "도보");
  //693
  graph.addEdge("신공 7층 뒤편4", "신공 7층 뒤편5", 12.5373, 0.835819, "평지", "도보",
      node2X: 721,
      node2Y: 2744,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒤편5", "신공 7층 뒤편4", 12.5373, 0.835819, "평지", "도보");
  //694
  graph.addEdge("신공 7층 뒤편5", "신공 7층 뒤편6", 4.26379, 0.284252, "평지", "도보",
      node2X: 712,
      node2Y: 2766,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒤편6", "신공 7층 뒤편5", 4.26379, 0.284252, "평지", "도보");
  //695
  graph.addEdge("신공 7층 뒤편3", "신공 7층 뒤편7", 12.6599, 0.843992, "평지", "도보",
      node2X: 709,
      node2Y: 2779,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒤편7", "신공 7층 뒤편3", 12.6599, 0.843992, "평지", "도보");
  //696
  graph.addEdge("신공 7층 뒤편7", "신공 7층 뒤편8", 2.26898, 0.151266, "평지", "도보",
      node2X: 697,
      node2Y: 2775,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒤편8", "신공 7층 뒤편7", 2.26898, 0.151266, "평지", "도보");
  //697
  graph.addEdge("신공 7층 뒤편7", "신공 7층 뒤편6", 2.39321, 0.159547, "평지", "도보");
  graph.addEdge("신공 7층 뒤편6", "신공 7층 뒤편7", 2.39321, 0.159547, "평지", "도보");
  //698
  graph.addEdge("신공 7층 뒤편8", "신공 7층 뒷엘베 앞", 2.43982, 0.162654, "평지", "도보",
      node2X: 701,
      node2Y: 2762,
      isInside2: 7,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 7층 뒷엘베 앞", "신공 7층 뒤편8", 2.43982, 0.162654, "평지", "도보");
  //699
  graph.addEdge("신공 7층 뒷엘베 앞", "신공 7층 뒤편6", 2.09958, 0.139972, "평지", "도보");
  graph.addEdge("신공 7층 뒤편6", "신공 7층 뒷엘베 앞", 2.09958, 0.139972, "평지", "도보");
  //700
  graph.addEdge("신공 7층 뒷엘베 앞", "신공 7층 뒷엘베", 0.965984, 0.064399, "평지", "도보");
  graph.addEdge("신공 7층 뒷엘베", "신공 7층 뒷엘베 앞", 0.965984, 0.064399, "평지", "도보");
  //701
  graph.addEdge("신공 7층 뒷엘베 앞", "신공 7층 뒷계단", 1.09112, 0.0727413, "평지", "도보");
  graph.addEdge("신공 7층 뒷계단", "신공 7층 뒷엘베 앞", 1.09112, 0.0727413, "평지", "도보");
  //706
  graph.addEdge("신공 9층 입구", "신공 9층 입구 안", 3.65862, 0.243908, "평지", "도보",
      node2X: 885,
      node2Y: 2617,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 입구 안", "신공 9층 입구", 3.65862, 0.243908, "평지", "도보");
  //707
  graph.addEdge("신공 9층 입구 안", "신공 9층 오른쪽 위", 6.13045, 0.408697, "평지", "도보",
      node2X: 873,
      node2Y: 2649,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 오른쪽 위", "신공 9층 입구 안", 6.13045, 0.408697, "평지", "도보");
  //708
  graph.addEdge("신공 9층 입구 안", "신공 9층 전층 엘베 앞", 6.3875, 0.425833, "평지", "도보",
      node2X: 863,
      node2Y: 2645,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 전층 엘베 앞", "신공 9층 입구 안", 6.3875, 0.425833, "평지", "도보");
  //709
  graph.addEdge("신공 9층 입구 안", "신공 9층 9층 엘베 앞", 7.76111, 0.517408, "평지", "도보",
      node2X: 849,
      node2Y: 2641,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 9층 엘베 앞", "신공 9층 입구 안", 7.76111, 0.517408, "평지", "도보");
  //710
  graph.addEdge("신공 9층 입구 안", "신공 9층 왼쪽 위", 9.26019, 0.617346, "평지", "도보",
      node2X: 837,
      node2Y: 2636,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 왼쪽 위", "신공 9층 입구 안", 9.26019, 0.617346, "평지", "도보");
  //711
  graph.addEdge("신공 9층 왼쪽 위", "신공 9층 9층 엘베 앞", 2.33192, 0.155462, "평지", "도보");
  graph.addEdge("신공 9층 9층 엘베 앞", "신공 9층 왼쪽 위", 2.33192, 0.155462, "평지", "도보");
  //712
  graph.addEdge("신공 9층 9층 엘베 앞", "신공 9층 9층 엘베", 0.802206, 0.0534804, "평지", "도보");
  graph.addEdge("신공 9층 9층 엘베", "신공 9층 9층 엘베 앞", 0.802206, 0.0534804, "평지", "도보");
  //713
  graph.addEdge("신공 9층 9층 엘베 앞", "신공 9층 전층 엘베 앞", 2.6118, 0.17412, "평지", "도보");
  graph.addEdge("신공 9층 전층 엘베 앞", "신공 9층 9층 엘베 앞", 2.6118, 0.17412, "평지", "도보");
  //714
  graph.addEdge("신공 9층 전층 엘베 앞", "신공 9층 전층 엘베", 0.965984, 0.064399, "평지", "도보");
  graph.addEdge("신공 9층 전층 엘베", "신공 9층 전층 엘베 앞", 0.965984, 0.064399, "평지", "도보");
  //715
  graph.addEdge("신공 9층 전층 엘베 앞", "신공 9층 오른쪽 위", 1.93197, 0.128798, "평지", "도보",
      node2X: 873,
      node2Y: 2649,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 오른쪽 위", "신공 9층 전층 엘베 앞", 1.93197, 0.128798, "평지", "도보");
  //716
  graph.addEdge("신공 9층 오른쪽 위", "신공 9층 화장실 오른쪽", 16.9054, 1.12703, "평지", "도보",
      node2X: 842,
      node2Y: 2738,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 화장실 오른쪽", "신공 9층 오른쪽 위", 16.9054, 1.12703, "평지", "도보");
  //717
  graph.addEdge("신공 9층 화장실 오른쪽", "신공 9층 화장실 왼쪽", 7.16169, 0.477446, "평지", "도보",
      node2X: 805,
      node2Y: 2723,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 화장실 왼쪽", "신공 9층 화장실 오른쪽", 7.16169, 0.477446, "평지", "도보");
  //723
  graph.addEdge("신공 9층 화장실 왼쪽", "신공 9층 왼쪽 위", 16.6281, 1.10854, "평지", "도보");
  graph.addEdge("신공 9층 왼쪽 위", "신공 9층 화장실 왼쪽", 16.6281, 1.10854, "평지", "도보");
  //718
  graph.addEdge("신공 9층 화장실 오른쪽", "신공 9층 뒤편1", 8.90594, 0.593729, "평지", "도보",
      node2X: 826,
      node2Y: 2785,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒤편1", "신공 9층 화장실 오른쪽", 8.90594, 0.593729, "평지", "도보");
  //719
  graph.addEdge("신공 9층 뒤편1", "신공 9층 뒤편2", 7.76111, 0.517408, "평지", "도보",
      node2X: 790,
      node2Y: 2809,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒤편2", "신공 9층 뒤편1", 7.76111, 0.517408, "평지", "도보");
  //720
  graph.addEdge("신공 9층 뒤편2", "신공 9층 뒤편3", 2.83623, 0.189082, "평지", "도보",
      node2X: 775,
      node2Y: 2804,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒤편3", "신공 9층 뒤편2", 2.83623, 0.189082, "평지", "도보");
  //721
  graph.addEdge("신공 9층 뒤편3", "신공 9층 뒤편4", 6.97735, 0.465157, "평지", "도보",
      node2X: 787,
      node2Y: 2767,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒤편4", "신공 9층 뒤편3", 6.97735, 0.465157, "평지", "도보");
  //722
  graph.addEdge("신공 9층 뒤편4", "신공 9층 화장실 왼쪽", 8.52757, 0.568505, "평지", "도보");
  graph.addEdge("신공 9층 화장실 왼쪽", "신공 9층 뒤편4", 8.52757, 0.568505, "평지", "도보");
  //724
  graph.addEdge("신공 9층 뒤편4", "신공 9층 뒤편5", 12.5373, 0.835819, "평지", "도보",
      node2X: 721,
      node2Y: 2744,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒤편5", "신공 9층 뒤편4", 12.5373, 0.835819, "평지", "도보");
  //725
  graph.addEdge("신공 9층 뒤편5", "신공 9층 뒤편6", 4.26379, 0.284252, "평지", "도보",
      node2X: 712,
      node2Y: 2766,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒤편6", "신공 9층 뒤편5", 4.26379, 0.284252, "평지", "도보");
  //726
  graph.addEdge("신공 9층 뒤편3", "신공 9층 뒤편7", 12.6599, 0.843992, "평지", "도보",
      node2X: 709,
      node2Y: 2779,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒤편7", "신공 9층 뒤편3", 12.6599, 0.843992, "평지", "도보");
  //727
  graph.addEdge("신공 9층 뒤편7", "신공 9층 뒤편8", 2.26898, 0.151266, "평지", "도보",
      node2X: 697,
      node2Y: 2775,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒤편8", "신공 9층 뒤편7", 2.26898, 0.151266, "평지", "도보");
  //728
  graph.addEdge("신공 9층 뒤편7", "신공 9층 뒤편6", 2.39321, 0.159547, "평지", "도보");
  graph.addEdge("신공 9층 뒤편6", "신공 9층 뒤편7", 2.39321, 0.159547, "평지", "도보");
  //729
  graph.addEdge("신공 9층 뒤편8", "신공 9층 뒷엘베 앞", 2.43982, 0.162654, "평지", "도보",
      node2X: 701,
      node2Y: 2762,
      isInside2: 9,
      building2: "신공학관",
      showRoute2: false);
  graph.addEdge("신공 9층 뒷엘베 앞", "신공 9층 뒤편8", 2.43982, 0.162654, "평지", "도보");
  //730
  graph.addEdge("신공 9층 뒷엘베 앞", "신공 9층 뒤편6", 2.09958, 0.139972, "평지", "도보");
  graph.addEdge("신공 9층 뒤편6", "신공 9층 뒷엘베 앞", 2.09958, 0.139972, "평지", "도보");
  //731
  graph.addEdge("신공 9층 뒷엘베 앞", "신공 9층 뒷엘베", 0.965984, 0.064399, "평지", "도보");
  graph.addEdge("신공 9층 뒷엘베", "신공 9층 뒷엘베 앞", 0.965984, 0.064399, "평지", "도보");
  //732
  graph.addEdge("신공 9층 뒷엘베 앞", "신공 9층 뒷계단", 1.09112, 0.0727413, "평지", "도보");
  graph.addEdge("신공 9층 뒷계단", "신공 9층 뒷엘베 앞", 1.09112, 0.0727413, "평지", "도보");
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
  //**************************************************************************
  //법학관_만해관
  //입구: 만해관 입구, 만해관 옆입구, 만해관 2층 입구, 법학관 1층 입구
  //359
  graph.addEdge("법학관 1층 입구", "법학관 1층 입구 안", 9.26019, 0.617346, "평지", "도보",
      node2X: 1646,
      node2Y: 2715,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("법학관 1층 입구 안", "법학관 1층 입구", 9.26019, 0.617346, "평지", "도보");
  //360
  graph.addEdge("법학관 1층 입구 안", "법학관 1층 만해관 앞", 24.5179, 1.63453, "평지", "도보",
      node2X: 1607,
      node2Y: 2846,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("법학관 1층 만해관 앞", "법학관 1층 입구 안", 24.5179, 1.63453, "평지", "도보");
  //367
  graph.addEdge("법학관 1층 만해관 앞", "만해관 입구 안", 3.5741, 0.238273, "평지", "도보",
      node2X: 1626,
      node2Y: 2852,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("만해관 입구 안", "법학관 1층 만해관 앞", 3.5741, 0.238273, "평지", "도보");
  //395
  graph.addEdge("만해관 입구 안", "만해관 입구", 1.4792, 0.098613, "평지", "도보");
  graph.addEdge("만해관 입구", "만해관 입구 안", 1.4792, 0.098613, "평지", "도보");
  //396
  graph.addEdge("만해관 입구 안", "만해관 2층 입구 안", 8.45367, 0.563578, "평지", "도보",
      node2X: 1671,
      node2Y: 2866,
      isInside2: 1,
      building2: "법학관_만해관",
      showRoute2: false);
  graph.addEdge("만해관 2층 입구 안", "만해관 입구 안", 8.45367, 0.563578, "평지", "도보");
  //397
  graph.addEdge("만해관 2층 입구 안", "만해관 2층 입구", 5.56942, 0.371294, "평지", "도보");
  graph.addEdge("만해관 2층 입구", "만해관 2층 입구 안", 5.56942, 0.371294, "평지", "도보");
  //398
  graph.addEdge("만해관 2층 입구 안", "만해관 옆입구", 35.1692, 2.34462, "평지", "도보");
  graph.addEdge("만해관 옆입구", "만해관 2층 입구 안", 35.1692, 2.34462, "평지", "도보");

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
  //학림관
  //입구: 편의점 입구, 입구, 우측 앞문, 오른쪽 뒷문, 뒷문, 왼쪽 뒷문, 좌측 앞문
  //399
  graph.addEdge("학림관 좌측 앞문", "학림관 1층 엘베 앞", 6.52949, 0.435299, "평지", "도보",
      node2X: 1179,
      node2Y: 1724,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 1층 엘베 앞", "학림관 좌측 앞문", 6.52949, 0.435299, "평지", "도보");
  //400
  graph.addEdge("학림관 1층 엘베 앞", "학림관 1층 엘베", 1.3059, 0.0870598, "평지", "도보",
      node2X: 1181,
      node2Y: 1717,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 1층 엘베", "학림관 1층 엘베 앞", 1.3059, 0.0870598, "평지", "도보");
  //401
  graph.addEdge("학림관 1층 엘베 앞", "학림관 입구 안", 16.6832, 1.11221, "평지", "도보",
      node2X: 1268,
      node2Y: 1751,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 입구 안", "학림관 1층 엘베 앞", 16.6832, 1.11221, "평지", "도보");
  //402
  graph.addEdge("학림관 입구 안", "학림관 뒷문", 5.05135, 0.336757, "평지", "도보");
  graph.addEdge("학림관 뒷문", "학림관 입구 안", 5.05135, 0.336757, "평지", "도보");
  //403
  graph.addEdge("학림관 입구 안", "학림관 입구", 6.86578, 0.457719, "평지", "도보");
  graph.addEdge("학림관 입구", "학림관 입구 안", 6.86578, 0.457719, "평지", "도보");
  //404
  graph.addEdge("학림관 입구 안", "학림관 우측 앞문 앞", 18.1607, 1.21071, "평지", "도보",
      node2X: 1365,
      node2Y: 1780,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 우측 앞문 앞", "학림관 입구 안", 18.1607, 1.21071, "평지", "도보");
  //405
  graph.addEdge("학림관 우측 앞문 앞", "학림관 우측 앞문", 6.75237, 0.450158, "평지", "도보");
  graph.addEdge("학림관 우측 앞문", "학림관 우측 앞문 앞", 6.75237, 0.450158, "평지", "도보");
  //406
  graph.addEdge("학림관 우측 앞문 앞", "학림관 오른쪽 뒷문", 2.58704, 0.172469, "평지", "도보");
  graph.addEdge("학림관 오른쪽 뒷문", "학림관 우측 앞문 앞", 2.58704, 0.172469, "평지", "도보");
  //407
  graph.addEdge("학림관 우측 앞문 앞", "학림관 중앙 계단 앞", 3.06523, 0.204348, "평지", "도보",
      node2X: 1381,
      node2Y: 1786,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 중앙 계단 앞", "학림관 우측 앞문 앞", 3.06523, 0.204348, "평지", "도보");
  //408
  graph.addEdge("학림관 중앙 계단 앞", "학림관 중앙 계단", 1.20331, 0.0802206, "평지", "도보",
      node2X: 1378,
      node2Y: 1792,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 중앙 계단", "학림관 중앙 계단 앞", 1.20331, 0.0802206, "평지", "도보");
  //409
  graph.addEdge("학림관 중앙 계단 앞", "학림관 우측 계단 앞", 13.1094, 0.873959, "평지", "도보",
      node2X: 1451,
      node2Y: 1807,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 우측 계단 앞", "학림관 중앙 계단 앞", 13.1094, 0.873959, "평지", "도보");
  //410
  graph.addEdge("학림관 우측 계단 앞", "학림관 우측 계단", 1.13449, 0.0756328, "평지", "도보",
      node2X: 1449,
      node2Y: 1813,
      isInside2: 1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 우측 계단", "학림관 우측 계단 앞", 1.13449, 0.0756328, "평지", "도보");
  //411
  graph.addEdge("학림관 편의점 입구", "학림관 편의점 입구 안", 1.09112, 0.0727413, "평지", "도보",
      node2X: 1096,
      node2Y: 1722,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 편의점 입구 안", "학림관 편의점 입구", 1.09112, 0.0727413, "평지", "도보");
  //412
  graph.addEdge("학림관 편의점 입구 안", "학림관 B1 왼쪽 끝", 3.87226, 0.25815, "평지", "도보",
      node2X: 1101,
      node2Y: 1701,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 B1 왼쪽 끝", "학림관 편의점 입구 안", 3.87226, 0.25815, "평지", "도보");
  //413
  graph.addEdge("학림관 B1 왼쪽 끝", "학림관 B1 엘베 앞", 14.5374, 0.969162, "평지", "도보",
      node2X: 1179,
      node2Y: 1723,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 B1 엘베 앞", "학림관 B1 왼쪽 끝", 14.5374, 0.969162, "평지", "도보");
  //414
  graph.addEdge("학림관 B1 엘베 앞", "학림관 B1 엘베", 1.13449, 0.0756328, "평지", "도보",
      node2X: 1181,
      node2Y: 1717,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 B1 엘베", "학림관 B1 엘베 앞", 1.13449, 0.0756328, "평지", "도보");
  //학림관 B1 - 1F 엘베 이동
  graph.addEdge("학림관 B1 엘베", "학림관 1층 엘베", 132, 0, "엘베", "도보");
  graph.addEdge("학림관 1층 엘베", "학림관 B1 엘베", 132, 0, "엘베", "도보");
  //415
  graph.addEdge("학림관 B1 엘베 앞", "학림관 왼쪽 뒷문 안", 4.7619, 0.3, "계단아래", "도보",
      node2X: 1195,
      node2Y: 1729,
      isInside2: -1,
      building2: "학림관",
      showRoute2: false);
  graph.addEdge("학림관 왼쪽 뒷문 안", "학림관 B1 엘베 앞", 6.66667, 1, "계단위", "도보");
  //416
  graph.addEdge("학림관 왼쪽 뒷문 안", "학림관 왼쪽 뒷문", 1.3059, 0.0870598, "평지", "도보");
  graph.addEdge("학림관 왼쪽 뒷문", "학림관 왼쪽 뒷문 안", 1.3059, 0.0870598, "평지", "도보");
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
  //과학관
  //입구: 좌측 입구, 정문, 우측 입구
  //417
  graph.addEdge("과학관 좌측 입구", "과학관 정문 안", 25.0187, 1.66791, "평지", "도보",
      node2X: 1295,
      node2Y: 3076,
      isInside2: 1,
      building2: "과학관",
      showRoute2: false);
  graph.addEdge("과학관 정문 안", "과학관 좌측 입구", 25.0187, 1.66791, "평지", "도보");
  //418
  graph.addEdge("과학관 정문 안", "과학관 정문", 5.96283, 0.397522, "평지", "도보");
  graph.addEdge("과학관 정문", "과학관 정문 안", 5.96283, 0.397522, "평지", "도보");
  //419
  graph.addEdge("과학관 정문 안", "과학관 우측 입구", 23.7682, 1.58455, "평지", "도보");
  graph.addEdge("과학관 우측 입구", "과학관 정문 안", 23.7682, 1.58455, "평지", "도보");
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
  //혜화관
  //입구: 입구, 4층 입구
  //420
  graph.addEdge("혜화관 4층 입구", "혜화관 4층 입구 안", 11.0649, 0.737662, "평지", "도보",
      node2X: 1963,
      node2Y: 2946,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 입구 안", "혜화관 4층 입구", 11.0649, 0.737662, "평지", "도보");
  //421
  graph.addEdge("혜화관 4층 입구 안", "혜화관 4층 엘베 앞", 2.04523, 0.136349, "평지", "도보",
      node2X: 1960,
      node2Y: 2957,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 엘베 앞", "혜화관 4층 입구 안", 2.04523, 0.136349, "평지", "도보");
  //422
  graph.addEdge("혜화관 4층 엘베 앞", "혜화관 4층 엘베", 1.4792, 0.098613, "평지", "도보",
      node2X: 1952,
      node2Y: 2955,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 엘베", "혜화관 4층 엘베 앞", 1.4792, 0.098613, "평지", "도보");
  //423
  graph.addEdge("혜화관 4층 엘베 앞", "혜화관 4층 계단 옆", 4.89609, 0.326406, "평지", "도보",
      node2X: 1987,
      node2Y: 2953,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 옆", "혜화관 4층 엘베 앞", 4.89609, 0.326406, "평지", "도보");
  //424
  graph.addEdge("혜화관 4층 입구 안", "혜화관 4층 계단 옆", 4.48447, 0.298965, "평지", "도보");
  graph.addEdge("혜화관 4층 계단 옆", "혜화관 4층 입구 안", 4.48447, 0.298965, "평지", "도보");
  //425
  graph.addEdge("혜화관 4층 계단 옆", "혜화관 4층 계단 앞", 2.21879, 0.14792, "평지", "도보",
      node2X: 1990,
      node2Y: 2941,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 앞", "혜화관 4층 계단 옆", 2.21879, 0.14792, "평지", "도보");
  //426
  graph.addEdge("혜화관 4층 계단 앞", "혜화관 4층 계단", 2.49846, 0.166564, "평지", "도보",
      node2X: 1977,
      node2Y: 2936,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단", "혜화관 4층 계단 앞", 2.49846, 0.166564, "평지", "도보");
  //427
  graph.addEdge("혜화관 4층 계단", "혜화관 4층 계단 중간1", 4.7619, 0.3, "계단아래", "도보",
      node2X: 1954,
      node2Y: 2928,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 중간1", "혜화관 4층 계단", 6.66667, 1, "계단위", "도보");
  //428
  graph.addEdge("혜화관 4층 계단 중간1", "혜화관 4층 계단 중간2", 2.66666, 0.177777, "평지", "도보",
      node2X: 1959,
      node2Y: 2914,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 4층 계단 중간2", "혜화관 4층 계단 중간1", 2.66666, 0.177777, "평지", "도보");
  //429
  graph.addEdge("혜화관 4층 계단 중간2", "혜화관 3층 계단", 4.7619, 0.3, "계단아래", "도보",
      node2X: 1981,
      node2Y: 2922,
      isInside2: 4,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 3층 계단", "혜화관 4층 계단 중간2", 6.66667, 1, "계단위", "도보");
  //혜화관 계단 1층 - 3층 이동
  graph.addEdge("혜화관 3층 계단", "혜화관 1층 계단", 19.0476, 1.2, "계단아래", "도보",
      node2X: 1981,
      node2Y: 2922,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 계단", "혜화관 3층 계단", 26.6667, 4, "계단위", "도보");
  //430
  graph.addEdge("혜화관 1층 계단", "혜화관 1층 계단 앞", 2.49846, 0.166564, "평지", "도보",
      node2X: 1994,
      node2Y: 2927,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 계단 앞", "혜화관 1층 계단", 2.49846, 0.166564, "평지", "도보");
  //431
  graph.addEdge("혜화관 1층 계단 앞", "혜화관 입구", 6.51962, 0.434642, "평지", "도보");
  graph.addEdge("혜화관 입구", "혜화관 1층 계단 앞", 6.51962, 0.434642, "평지", "도보");
  //432
  graph.addEdge("혜화관 1층 계단 앞", "혜화관 1층 엘베 앞", 6.92412, 0.461608, "평지", "도보",
      node2X: 1983,
      node2Y: 2964,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 엘베 앞", "혜화관 1층 계단 앞", 6.92412, 0.461608, "평지", "도보");
  //433
  graph.addEdge("혜화관 1층 엘베 앞", "혜화관 1층 엘베", 5.79035, 0.386024, "평지", "도보",
      node2X: 1952,
      node2Y: 2955,
      isInside2: 1,
      building2: "혜화관",
      showRoute2: false);
  graph.addEdge("혜화관 1층 엘베", "혜화관 1층 엘베 앞", 5.79035, 0.386024, "평지", "도보");
  //혜화관 엘베 1층 - 4층 이동
  graph.addEdge("혜화관 4층 엘베", "혜화관 1층 엘베", 132, 0, "엘베", "도보");
  graph.addEdge("혜화관 1층 엘베", "혜화관 4층 엘베", 132, 0, "엘베", "도보");

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
  graph.addEdge("경영관 2층 쪽문", "경영관 2층 쪽문 안", 15.4485, 1.0299, "평지", "도보",
      node2X: 2338,
      node2Y: 3274,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 쪽문 안", "경영관 2층 쪽문", 15.4485, 1.0299, "평지", "도보");
  //439
  graph.addEdge("경영관 2층 쪽문 안", "경영관 2층 입구 안", 18.4377, 1.22918, "평지", "도보",
      node2X: 2369,
      node2Y: 3176,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 쪽문 안", 18.4377, 1.22918, "평지", "도보");
  //440
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 입구", 7.54458, 0.502972, "평지", "도보");
  graph.addEdge("경영관 2층 입구", "경영관 2층 입구 안", 7.54458, 0.502972, "평지", "도보");
  //441
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 계단", 2.43982, 0.162654, "평지", "도보",
      node2X: 2382,
      node2Y: 3180,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 계단", "경영관 2층 입구 안", 2.43982, 0.162654, "평지", "도보");
  //경영관 계단 2층 - 3층 이동
  graph.addEdge("경영관 2층 계단", "경영관 3층 계단", 13.3333, 2, "계단위", "도보",
      node2X: 2382,
      node2Y: 3180,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 계단", "경영관 2층 계단", 9.52381, 0.6, "계단아래", "도보");
  //442
  graph.addEdge("경영관 2층 입구 안", "경영관 2층 뒷문 안", 8.62512, 0.575008, "평지", "도보",
      node2X: 2383,
      node2Y: 3130,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 2층 뒷문 안", "경영관 2층 입구 안", 8.62512, 0.575008, "평지", "도보");
  //443
  graph.addEdge("경영관 2층 뒷문 안", "경영관 2층 뒷문", 4.82992, 0.321995, "평지", "도보");
  graph.addEdge("경영관 2층 뒷문", "경영관 2층 뒷문 안", 4.82992, 0.321995, "평지", "도보");
  //444
  graph.addEdge("경영관 2층 뒷문 안", "경영관 문화관 구름다리 앞", 8.16912, 0.544608, "평지", "도보",
      node2X: 2340,
      node2Y: 3115,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 문화관 구름다리 앞", "경영관 2층 뒷문 안", 8.16912, 0.544608, "평지", "도보");
  //445
  graph.addEdge("경영관 문화관 구름다리 앞", "경영관 문화관 구름다리 입구", 6.87515, 0.458343, "평지", "도보",
      node2X: 2350,
      node2Y: 3078,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("경영관 문화관 구름다리 입구", "경영관 문화관 구름다리 앞", 6.87515, 0.458343, "평지", "도보");
  //경영관 문화관 구름다리 이동
  graph.addEdge("경영관 문화관 구름다리 입구", "문화관 경영관 구름다리 입구", 4.7619, 0.3, "계단아래", "도보",
      node2X: 2354,
      node2Y: 3065,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 경영관 구름다리 입구", "경영관 문화관 구름다리 입구", 6.66667, 1, "계단위", "도보");
  //446
  graph.addEdge("경영관 문화관 구름다리 앞", "사회과학관 2층 옆문 안", 20.1032, 1.34022, "평지", "도보",
      node2X: 2238,
      node2Y: 3082,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 옆문 안", "경영관 문화관 구름다리 앞", 20.1032, 1.34022, "평지", "도보");
  //447
  graph.addEdge("사회과학관 2층 옆문 안", "사회과학관 2층 옆문", 6.97735, 0.465157, "평지", "도보");
  graph.addEdge("사회과학관 2층 옆문", "사회과학관 2층 옆문 안", 6.97735, 0.465157, "평지", "도보");
  //448
  graph.addEdge("사회과학관 2층 옆문 안", "사회과학관 2층 계단 앞", 3.13272, 0.208848, "평지", "도보",
      node2X: 2242,
      node2Y: 3065,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 옆문 안", 3.13272, 0.208848, "평지", "도보");
  //449
  graph.addEdge("사회과학관 2층 옆문 안", "사회과학관 2층 쪽문 방향", 7.72788, 0.515192, "평지", "도보",
      node2X: 2222,
      node2Y: 3042,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 옆문 안", 7.72788, 0.515192, "평지", "도보");
  //450
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 계단", 1.60441, 0.106961, "평지", "도보",
      node2X: 2250,
      node2Y: 3069,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 계단", "사회과학관 2층 계단 앞", 1.60441, 0.106961, "평지", "도보");
  //사회과학관 계단 2층 - 3층 이동
  graph.addEdge("사회과학관 2층 계단", "사회과학관 3층 계단", 13.3333, 2, "계단위", "도보",
      node2X: 2250,
      node2Y: 3069,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단", "사회과학관 2층 계단", 9.52381, 0.6, "계단아래", "도보");
  //451
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 계단 옆", 2.6118, 0.17412, "평지", "도보",
      node2X: 2246,
      node2Y: 3051,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 계단 옆", "사회과학관 2층 계단 앞", 2.6118, 0.17412, "평지", "도보");
  //452
  graph.addEdge("사회과학관 2층 계단 앞", "사회과학관 2층 쪽문 방향", 5.46738, 0.364492, "평지", "도보");
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 계단 앞", 5.46738, 0.364492, "평지", "도보");
  //453
  graph.addEdge("사회과학관 2층 계단 옆", "사회과학관 2층 쪽문 방향", 4.59784, 0.306523, "평지", "도보");
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 계단 옆", 4.59784, 0.306523, "평지", "도보");
  //454
  graph.addEdge("사회과학관 2층 계단 옆", "사회과학관 2층 엘베 앞", 3.35107, 0.223405, "평지", "도보",
      node2X: 2264,
      node2Y: 3056,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 엘베 앞", "사회과학관 2층 계단 옆", 3.35107, 0.223405, "평지", "도보");
  //455
  graph.addEdge("사회과학관 2층 엘베 앞", "사회과학관 2층 엘베", 4.87963, 0.325309, "평지", "도보",
      node2X: 2272,
      node2Y: 3030,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 엘베", "사회과학관 2층 엘베 앞", 4.87963, 0.325309, "평지", "도보");
  //사회과학관 엘베 B1 - 2층 이동
  graph.addEdge("사회과학관 2층 엘베", "사회과학관 B1 엘베", 204, 0, "엘베", "도보");
  graph.addEdge("사회과학관 B1 엘베", "사회과학관 2층 엘베", 204, 0, "엘베", "도보");
  //사회과학관 엘베 2층 - 3층 이동
  graph.addEdge("사회과학관 2층 엘베", "사회과학관 3층 엘베", 192, 0, "엘베", "도보",
      node2X: 2272,
      node2Y: 3030,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: true);
  graph.addEdge("사회과학관 3층 엘베", "사회과학관 2층 엘베", 192, 0, "엘베", "도보");
  //사회과학관 엘베 B1 - 3층 이동
  graph.addEdge("사회과학관 3층 엘베", "사회과학관 B1 엘베", 216, 0, "엘베", "도보");
  graph.addEdge("사회과학관 B1 엘베", "사회과학관 3층 엘베", 216, 0, "엘베", "도보");
  //456
  graph.addEdge("사회과학관 2층 쪽문 방향", "사회과학관 2층 쪽문 계단 앞", 43.4512, 2.89674, "평지", "도보",
      node2X: 2298,
      node2Y: 2812,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 계단 앞", "사회과학관 2층 쪽문 방향", 43.4512, 2.89674, "평지", "도보");
  //457
  graph.addEdge("사회과학관 2층 쪽문 계단 앞", "사회과학관 2층 쪽문 계단", 2.09958, 0.139972, "평지", "도보",
      node2X: 2309,
      node2Y: 2808,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 2층 쪽문 계단", "사회과학관 2층 쪽문 계단 앞", 2.09958, 0.139972, "평지", "도보");
  //458
  graph.addEdge("사회과학관 2층 쪽문 계단", "사회과학관 2층 쪽문", 2.40662, 0.160441, "평지", "도보");
  graph.addEdge("사회과학관 2층 쪽문", "사회과학관 2층 쪽문 계단", 2.40662, 0.160441, "평지", "도보");
  //사회과학관 쪽문 계단 2층 - 3층 이동
  graph.addEdge("사회과학관 2층 쪽문 계단", "사회과학관 3층 쪽문 계단", 13.3333, 2, "계단위", "도보",
      node2X: 2309,
      node2Y: 2808,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 쪽문 계단", "사회과학관 2층 쪽문 계단", 9.52381, 0.6, "계단아래", "도보");
  //경영관 쪽문 계단 2층 - 3층 이동
  graph.addEdge("경영관 2층 쪽문 계단", "경영관 3층 쪽문 계단", 13.3333, 2, "계단위", "도보",
      node2X: 2246,
      node2Y: 3300,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 쪽문 계단", "경영관 2층 쪽문 계단", 9.52381, 0.6, "계단아래", "도보");
  //459
  graph.addEdge("경영관 3층 쪽문 계단", "경영관 3층 쪽문", 1.65379, 0.110253, "평지", "도보",
      node2X: 2253,
      node2Y: 3294,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 쪽문", "경영관 3층 쪽문 계단", 1.65379, 0.110253, "평지", "도보");
  //460
  graph.addEdge("경영관 3층 쪽문", "경영관 3층 쪽문 안", 15.6636, 1.04424, "평지", "도보",
      node2X: 2338,
      node2Y: 3274,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 쪽문 안", "경영관 3층 쪽문", 15.6636, 1.04424, "평지", "도보");
  //461
  graph.addEdge("경영관 3층 쪽문 안", "경영관 3층 계단 앞", 18.4377, 1.22918, "평지", "도보",
      node2X: 2369,
      node2Y: 3176,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 계단 앞", "경영관 3층 쪽문 안", 18.4377, 1.22918, "평지", "도보");
  //462
  graph.addEdge("경영관 3층 계단 앞", "경영관 3층 계단", 2.43982, 0.162654, "평지", "도보");
  graph.addEdge("경영관 3층 계단", "경영관 3층 계단 앞", 2.43982, 0.162654, "평지", "도보");
  //463
  graph.addEdge("경영관 3층 계단 앞", "경영관 3층 계단 옆", 8.62512, 0.575008, "평지", "도보",
      node2X: 2383,
      node2Y: 3130,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("경영관 3층 계단 옆", "경영관 3층 계단 앞", 8.62512, 0.575008, "평지", "도보");
  //464
  graph.addEdge("경영관 3층 계단 옆", "사회과학관 3층 계단 오른쪽", 27.398, 1.82653, "평지", "도보",
      node2X: 2238,
      node2Y: 3082,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단 오른쪽", "경영관 3층 계단 옆", 27.398, 1.82653, "평지", "도보");
  //465
  graph.addEdge("사회과학관 3층 계단 오른쪽", "사회과학관 3층 입구 안", 6.10152, 0.406768, "평지", "도보",
      node2X: 2204,
      node2Y: 3081,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 입구 안", "사회과학관 3층 계단 오른쪽", 6.10152, 0.406768, "평지", "도보");
  //466
  graph.addEdge("사회과학관 3층 입구 안", "사회과학관 3층 입구", 6.2397, 0.41598, "평지", "도보");
  graph.addEdge("사회과학관 3층 입구", "사회과학관 3층 입구 안", 6.2397, 0.41598, "평지", "도보");
  //467
  graph.addEdge("사회과학관 3층 계단 오른쪽", "사회과학관 3층 계단 앞", 3.13272, 0.208848, "평지", "도보",
      node2X: 2242,
      node2Y: 3065,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 계단 오른쪽", 3.13272, 0.208848, "평지", "도보");
  //468
  graph.addEdge("사회과학관 3층 계단 오른쪽", "사회과학관 3층 쪽문 방향", 7.72788, 0.515192, "평지", "도보",
      node2X: 2222,
      node2Y: 3042,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 계단 오른쪽", 7.72788, 0.515192, "평지", "도보");
  //469
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 계단", 1.60441, 0.106961, "평지", "도보");
  graph.addEdge("사회과학관 3층 계단", "사회과학관 3층 계단 앞", 1.60441, 0.106961, "평지", "도보");
  //470
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 계단 왼쪽", 2.6118, 0.17412, "평지", "도보",
      node2X: 2246,
      node2Y: 3051,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 계단 왼쪽", "사회과학관 3층 계단 앞", 2.6118, 0.17412, "평지", "도보");
  //471
  graph.addEdge("사회과학관 3층 계단 앞", "사회과학관 3층 쪽문 방향", 5.46738, 0.364492, "평지", "도보");
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 계단 앞", 5.46738, 0.364492, "평지", "도보");
  //472
  graph.addEdge("사회과학관 3층 계단 왼쪽", "사회과학관 3층 쪽문 방향", 4.59784, 0.306523, "평지", "도보");
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 계단 왼쪽", 4.59784, 0.306523, "평지", "도보");
  //473
  graph.addEdge("사회과학관 3층 계단 왼쪽", "사회과학관 3층 엘베 앞", 3.35107, 0.223405, "평지", "도보",
      node2X: 2264,
      node2Y: 3056,
      isInside2: 3,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 엘베 앞", "사회과학관 3층 계단 왼쪽", 3.35107, 0.223405, "평지", "도보");
  //474
  graph.addEdge("사회과학관 3층 엘베 앞", "사회과학관 3층 엘베", 4.87963, 0.325309, "평지", "도보");
  graph.addEdge("사회과학관 3층 엘베", "사회과학관 3층 엘베 앞", 4.87963, 0.325309, "평지", "도보");
  //475
  graph.addEdge("사회과학관 3층 쪽문 방향", "사회과학관 3층 쪽문 계단 앞", 43.4512, 2.89674, "평지", "도보",
      node2X: 2298,
      node2Y: 2812,
      isInside2: 2,
      building2: "사회과학관_경영관",
      showRoute2: false);
  graph.addEdge("사회과학관 3층 쪽문 계단 앞", "사회과학관 3층 쪽문 방향", 43.4512, 2.89674, "평지", "도보");
  //476
  graph.addEdge("사회과학관 3층 쪽문 계단 앞", "사회과학관 3층 쪽문 계단", 2.09958, 0.139972, "평지", "도보");
  graph.addEdge("사회과학관 3층 쪽문 계단", "사회과학관 3층 쪽문 계단 앞", 2.09958, 0.139972, "평지", "도보");
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
  graph.addEdge("사회과학관 3층 엘베", "사회과학관_경영관", 100000, 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "사회과학관 3층 엘베", 100000, 100000, "평지", "도보");
  graph.addEdge("사회과학관 2층 엘베", "사회과학관_경영관", 100000, 100000, "평지", "도보");
  graph.addEdge("사회과학관_경영관", "사회과학관 2층 엘베", 100000, 100000, "평지", "도보");
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
  graph.addEdge("명진관 좌측 입구", "명진관 좌측 입구 안", 5.33332, 0.355554, "평지", "도보",
      node2X: 1181,
      node2Y: 2886,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 좌측 입구 안", "명진관 좌측 입구", 5.33332, 0.355554, "평지", "도보");
  //478
  graph.addEdge("명진관 좌측 입구 안", "명진관 왼쪽 후문 안", 3.97072, 0.264715, "평지", "도보",
      node2X: 1174,
      node2Y: 2907,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽 후문 안", "명진관 좌측 입구 안", 3.97072, 0.264715, "평지", "도보");
  //479
  graph.addEdge("명진관 왼쪽 후문 안", "명진관 왼쪽 후문", 1.53261, 0.102174, "평지", "도보");
  graph.addEdge("명진관 왼쪽 후문", "명진관 왼쪽 후문 안", 1.53261, 0.102174, "평지", "도보");
  //480
  graph.addEdge("명진관 좌측 입구 안", "명진관 왼쪽", 6.01387, 0.400925, "평지", "도보",
      node2X: 1191,
      node2Y: 2854,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 왼쪽", "명진관 좌측 입구 안", 6.01387, 0.400925, "평지", "도보");
  //481
  graph.addEdge("명진관 왼쪽", "명진관 정문 안 왼쪽", 21.896, 1.45973, "평지", "도보",
      node2X: 1307,
      node2Y: 2892,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 정문 안 왼쪽", "명진관 왼쪽", 21.896, 1.45973, "평지", "도보");
  //482
  graph.addEdge("명진관 정문 안 왼쪽", "명진관 후문 안 왼쪽", 6.76189, 0.450793, "평지", "도보",
      node2X: 1293,
      node2Y: 2927,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 후문 안 왼쪽", "명진관 정문 안 왼쪽", 6.76189, 0.450793, "평지", "도보");
  //483
  graph.addEdge("명진관 정문 안 왼쪽", "명진관 정문 안", 2.6118, 0.17412, "평지", "도보",
      node2X: 1321,
      node2Y: 2896,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 정문 안", "명진관 정문 안 왼쪽", 2.6118, 0.17412, "평지", "도보");
  //484
  graph.addEdge("명진관 정문 안", "명진관 정문", 4.09047, 0.272698, "평지", "도보");
  graph.addEdge("명진관 정문", "명진관 정문 안", 4.09047, 0.272698, "평지", "도보");
  //485
  graph.addEdge("명진관 정문 안", "명진관 정문 안 오른쪽", 2.66666, 0.177777, "평지", "도보",
      node2X: 1335,
      node2Y: 2901,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 정문 안 오른쪽", "명진관 정문 안", 2.66666, 0.177777, "평지", "도보");
  //486
  graph.addEdge("명진관 정문 안 오른쪽", "명진관 후문 안 오른쪽", 6.86578, 0.457719, "평지", "도보",
      node2X: 1322,
      node2Y: 2937,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 후문 안 오른쪽", "명진관 정문 안 오른쪽", 6.86578, 0.457719, "평지", "도보");
  //487
  graph.addEdge("명진관 후문 안 왼쪽", "명진관 후문 안", 2.33192, 0.155462, "평지", "도보",
      node2X: 1305,
      node2Y: 2932,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 후문 안", "명진관 후문 안 왼쪽", 2.33192, 0.155462, "평지", "도보");
  //488
  graph.addEdge("명진관 후문 안", "명진관 후문 안 오른쪽", 3.1786, 0.211907, "평지", "도보");
  graph.addEdge("명진관 후문 안 오른쪽", "명진관 후문 안", 3.1786, 0.211907, "평지", "도보");
  //489
  graph.addEdge("명진관 후문 안", "명진관 후문", 0.802206, 0.0534804, "평지", "도보");
  graph.addEdge("명진관 후문", "명진관 후문 안", 0.802206, 0.0534804, "평지", "도보");
  //490
  graph.addEdge("명진관 정문 안 오른쪽", "명진관 오른쪽", 21.9525, 1.4635, "평지", "도보",
      node2X: 1451,
      node2Y: 2940,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽", "명진관 정문 안 오른쪽", 21.9525, 1.4635, "평지", "도보");
  //491
  graph.addEdge("명진관 오른쪽", "명진관 우측 입구 안", 2.78471, 0.185647, "평지", "도보",
      node2X: 1447,
      node2Y: 2955,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 우측 입구 안", "명진관 오른쪽", 2.78471, 0.185647, "평지", "도보");
  //492
  graph.addEdge("명진관 우측 입구 안", "명진관 우측 입구", 4.19915, 0.279943, "평지", "도보");
  graph.addEdge("명진관 우측 입구", "명진관 우측 입구 안", 4.19915, 0.279943, "평지", "도보");
  //493
  graph.addEdge("명진관 우측 입구 안", "명진관 오른쪽 후문 안", 7.03476, 0.468984, "평지", "도보",
      node2X: 1434,
      node2Y: 2992,
      isInside2: 1,
      building2: "명진관",
      showRoute2: false);
  graph.addEdge("명진관 오른쪽 후문 안", "명진관 우측 입구 안", 7.03476, 0.468984, "평지", "도보");
  //494
  graph.addEdge("명진관 오른쪽 후문 안", "명진관 오른쪽 후문", 1.65379, 0.110253, "평지", "도보");
  graph.addEdge("명진관 오른쪽 후문", "명진관 오른쪽 후문 안", 1.65379, 0.110253, "평지", "도보");
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
  graph.addEdge("문화관 1층 입구", "문화관 1층 입구 안", 9.41696, 0.627797, "평지", "도보",
      node2X: 2442,
      node2Y: 2800,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 1층 입구 안", "문화관 1층 입구", 9.41696, 0.627797, "평지", "도보");
  //496
  graph.addEdge("문화관 1층 입구 안", "문화관 후문", 7.60194, 0.506796, "평지", "도보");
  graph.addEdge("문화관 후문", "문화관 1층 입구 안", 7.60194, 0.506796, "평지", "도보");
  //497
  graph.addEdge("문화관 1층 입구 안", "문화관 1층 계단 앞", 3.2338, 0.215587, "평지", "도보",
      node2X: 2436,
      node2Y: 2817,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 1층 계단 앞", "문화관 1층 입구 안", 3.2338, 0.215587, "평지", "도보");
  //498
  graph.addEdge("문화관 1층 계단 앞", "문화관 1층 계단", 1.70174, 0.113449, "평지", "도보",
      node2X: 2427,
      node2Y: 2814,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 1층 계단", "문화관 1층 계단 앞", 1.70174, 0.113449, "평지", "도보");
  //문화관 계단 1층 - 3층 이동
  graph.addEdge("문화관 1층 계단", "문화관 3층 계단", 26.6667, 4, "계단위", "도보",
      node2X: 2427,
      node2Y: 2814,
      isInside2: 3,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 3층 계단", "문화관 1층 계단", 19.0476, 1.2, "계단아래", "도보");
  //문화관 계단 1층 - B1 이동
  graph.addEdge("문화관 1층 계단", "문화관 B1 계단", 9.52381, 0.6, "계단아래", "도보",
      node2X: 2427,
      node2Y: 2814,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 B1 계단", "문화관 1층 계단", 13.3333, 2, "계단위", "도보");
  //문화관 계단 3층 - 4층 이동
  graph.addEdge("문화관 3층 계단", "문화관 4층 계단", 13.3333, 2, "계단위", "도보",
      node2X: 2427,
      node2Y: 2814,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 4층 계단", "문화관 3층 계단", 9.52381, 0.6, "계단아래", "도보");
  //499
  graph.addEdge("문화관 1층 계단 앞", "문화관 쪽문 안", 40.5591, 2.70394, "평지", "도보",
      node2X: 2366,
      node2Y: 3032,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 쪽문 안", "문화관 1층 계단 앞", 40.5591, 2.70394, "평지", "도보");
  //500
  graph.addEdge("문화관 쪽문 안", "문화관 1층 쪽문 계단", 4.48447, 0.298965, "평지", "도보",
      node2X: 2342,
      node2Y: 3025,
      isInside2: 1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 1층 쪽문 계단", "문화관 쪽문 안", 4.48447, 0.298965, "평지", "도보");
  //문화관 쪽문 계단 1층 - 3층
  graph.addEdge("문화관 1층 쪽문 계단", "문화관 3층 쪽문 계단", 26.6667, 4, "계단위", "도보",
      node2X: 2342,
      node2Y: 3025,
      isInside2: 3,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 3층 쪽문 계단", "문화관 1층 쪽문 계단", 19.0476, 1.2, "계단아래", "도보");
  //문화관 쪽문 계단 1층 - B1
  graph.addEdge("문화관 1층 쪽문 계단", "문화관 B1 쪽문 계단", 9.52381, 0.6, "계단아래", "도보",
      node2X: 2342,
      node2Y: 3025,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 B1 쪽문 계단", "문화관 1층 쪽문 계단", 13.3333, 2, "계단위", "도보");
  //문화관 쪽문 계단 3층 - 4층
  graph.addEdge("문화관 3층 쪽문 계단", "문화관 4층 쪽문 계단", 13.3333, 2, "계단위", "도보",
      node2X: 2342,
      node2Y: 3025,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 4층 쪽문 계단", "문화관 3층 쪽문 계단", 9.52381, 0.6, "계단아래", "도보");

  //501
  graph.addEdge("문화관 쪽문 안", "문화관 쪽문", 2.66666, 0.177777, "평지", "도보");
  graph.addEdge("문화관 쪽문", "문화관 쪽문 안", 2.66666, 0.177777, "평지", "도보");
  //502
  graph.addEdge("문화관 3층 계단", "문화관 3층 계단 앞", 1.70174, 0.113449, "평지", "도보",
      node2X: 2436,
      node2Y: 2817,
      isInside2: 3,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 3층 계단 앞", "문화관 3층 계단", 1.70174, 0.113449, "평지", "도보");
  //503
  graph.addEdge("문화관 3층 계단 앞", "문화관 경영관 구름다리 앞", 40.5591, 2.70394, "평지", "도보",
      node2X: 2366,
      node2Y: 3032,
      isInside2: 3,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 경영관 구름다리 앞", "문화관 3층 계단 앞", 40.5591, 2.70394, "평지", "도보");
  //504
  graph.addEdge("문화관 경영관 구름다리 앞", "문화관 3층 쪽문 계단", 4.48447, 0.298965, "평지", "도보");
  graph.addEdge("문화관 3층 쪽문 계단", "문화관 경영관 구름다리 앞", 4.48447, 0.298965, "평지", "도보");
  //505
  graph.addEdge("문화관 경영관 구름다리 앞", "문화관 경영관 구름다리 입구", 6.29873, 0.419915, "평지", "도보");
  graph.addEdge("문화관 경영관 구름다리 입구", "문화관 경영관 구름다리 앞", 6.29873, 0.419915, "평지", "도보");
  //506
  graph.addEdge("문화관 4층 계단", "문화관 4층 계단 앞", 1.70174, 0.113449, "평지", "도보",
      node2X: 2436,
      node2Y: 2817,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 4층 계단 앞", "문화관 4층 계단", 1.70174, 0.113449, "평지", "도보");
  //507
  graph.addEdge("문화관 4층 계단 앞", "문화관 4층 쪽문 계단 앞", 40.5591, 2.70394, "평지", "도보",
      node2X: 2366,
      node2Y: 3032,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 4층 쪽문 계단 앞", "문화관 4층 계단 앞", 40.5591, 2.70394, "평지", "도보");
  //508
  graph.addEdge("문화관 4층 쪽문 계단 앞", "문화관 4층 쪽문 계단", 4.48447, 0.298965, "평지", "도보");
  graph.addEdge("문화관 4층 쪽문 계단", "문화관 4층 쪽문 계단 앞", 4.48447, 0.298965, "평지", "도보");
  //509
  graph.addEdge("문화관 4층 계단 앞", "문화관 학술관 구름다리 앞", 14.9757, 0.998381, "평지", "도보",
      node2X: 2463,
      node2Y: 2738,
      isInside2: 4,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 학술관 구름다리 앞", "문화관 4층 계단 앞", 14.9757, 0.998381, "평지", "도보");
  //510
  graph.addEdge("문화관 학술관 구름다리 앞", "문화관 학술관 구름다리 입구", 7.54458, 0.502972, "평지", "도보",
      node2X: 2503,
      node2Y: 2751,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("문화관 학술관 구름다리 입구", "문화관 학술관 구름다리 앞", 7.54458, 0.502972, "평지", "도보");
  //문화관 - 학술관 구름다리 이동
  graph.addEdge("문화관 학술관 구름다리 입구", "학술관 문화관 구름다리 입구", 8.61952, 0.574635, "평지", "도보",
      node2X: 2550,
      node2Y: 2761,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("학술관 문화관 구름다리 입구", "문화관 학술관 구름다리 입구", 8.61952, 0.574635, "평지", "도보");
  //511
  graph.addEdge("문화관 B1 계단", "문화관 B1 계단 앞", 1.70174, 0.113449, "평지", "도보",
      node2X: 2436,
      node2Y: 2817,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 B1 계단 앞", "문화관 B1 계단", 1.70174, 0.113449, "평지", "도보");
  //512
  graph.addEdge("문화관 B1 계단 앞", "문화관 B1 쪽문 계단 앞", 40.5591, 2.70394, "평지", "도보",
      node2X: 2366,
      node2Y: 3032,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 B1 쪽문 계단 앞", "문화관 B1 계단 앞", 40.5591, 2.70394, "평지", "도보");
  //513
  graph.addEdge("문화관 B1 쪽문 계단 앞", "문화관 B1 쪽문 계단", 4.48447, 0.298965, "평지", "도보");
  graph.addEdge("문화관 B1 쪽문 계단", "문화관 B1 쪽문 계단 앞", 4.48447, 0.298965, "평지", "도보");
  //137
  graph.addEdge("가든쿡 입구", "가든쿡 갈림길", 11.2652, 0.751015, "평지", "도보",
      node2X: 2519,
      node2Y: 2803,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("가든쿡 갈림길", "가든쿡 입구", 11.2652, 0.751015, "평지", "도보");
  //138
  graph.addEdge("가든쿡 갈림길", "가든쿡 학술관 입구", 5.74292, 0.382862, "평지", "도보",
      node2X: 2551,
      node2Y: 2804,
      isInside2: -1,
      building2: "문화관",
      showRoute2: true);
  graph.addEdge("가든쿡 학술관 입구", "가든쿡 갈림길", 5.74292, 0.382862, "평지", "도보");
  //514
  graph.addEdge("가든쿡 갈림길", "가든쿡 문화관 입구", 7.38727, 0.492485, "평지", "도보",
      node2X: 2483,
      node2Y: 2783,
      isInside2: -1,
      building2: "문화관",
      showRoute2: true);
  graph.addEdge("가든쿡 문화관 입구", "가든쿡 갈림길", 7.38727, 0.492485, "평지", "도보");
  //515
  graph.addEdge("가든쿡 문화관 입구", "가든쿡 문화관 입구 안", 5.96283, 0.397522, "평지", "도보",
      node2X: 2451,
      node2Y: 2774,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("가든쿡 문화관 입구 안", "가든쿡 문화관 입구", 5.96283, 0.397522, "평지", "도보");
  //516
  graph.addEdge("문화관 B1 계단 앞", "가든쿡 문화관 입구 안", 8.16912, 0.544608, "평지", "도보");
  graph.addEdge("가든쿡 문화관 입구 안", "문화관 B1 계단 앞", 8.16912, 0.544608, "평지", "도보");
  //517
  graph.addEdge("가든쿡 문화관 입구 안", "이해랑 학술관 가는길1", 3.1786, 0.211907, "평지", "도보",
      node2X: 2456,
      node2Y: 2757,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("이해랑 학술관 가는길1", "가든쿡 문화관 입구 안", 3.1786, 0.211907, "평지", "도보");
  //518
  graph.addEdge("이해랑 학술관 가는길1", "이해랑 학술관 가는길2", 9.36385, 0.624257, "평지", "도보",
      node2X: 2506,
      node2Y: 2772,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("이해랑 학술관 가는길2", "이해랑 학술관 가는길1", 9.36385, 0.624257, "평지", "도보");
  //519
  graph.addEdge("이해랑 학술관 가는길2", "이해랑 학술관 가는길3", 20.9958, 1.39972, "평지", "도보",
      node2X: 2540,
      node2Y: 2660,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("이해랑 학술관 가는길3", "이해랑 학술관 가는길2", 20.9958, 1.39972, "평지", "도보");
  //520
  graph.addEdge("이해랑 학술관 가는길3", "문화관 학술관 B1 경계", 2.16744, 0.144496, "평지", "도보",
      node2X: 2551,
      node2Y: 2655,
      isInside2: -1,
      building2: "문화관",
      showRoute2: false);
  graph.addEdge("문화관 학술관 B1 경계", "이해랑 학술관 가는길3", 2.16744, 0.144496, "평지", "도보");
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
  graph.addEdge("문화관 학술관 B1 경계", "학술관 B1 계단 앞", 7.17515, 0.478344, "평지", "도보",
      node2X: 2591,
      node2Y: 2655,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 B1 계단 앞", "문화관 학술관 B1 경계", 7.17515, 0.478344, "평지", "도보");
  //522
  graph.addEdge("학술관 B1 계단 앞", "학술관 B1 계단", 5.38136, 0.358758, "평지", "도보",
      node2X: 2591,
      node2Y: 2625,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 B1 계단", "학술관 B1 계단 앞", 5.38136, 0.358758, "평지", "도보");
  //학술관 계단 B1 - 1층 이동
  graph.addEdge("학술관 B1 계단", "학술관 1층 계단", 13.3333, 2, "계단위", "도보",
      node2X: 2591,
      node2Y: 2625,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 1층 계단", "학술관 B1 계단", 9.52381, 0.6, "계단아래", "도보");
  //학술관 계단 1층 - 4층 이동
  graph.addEdge("학술관 1층 계단", "학술관 4층 계단", 40, 6, "계단위", "도보",
      node2X: 2591,
      node2Y: 2625,
      isInside2: 4,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 4층 계단", "학술관 1층 계단", 28.5714, 1.8, "계단아래", "도보");
  //523
  graph.addEdge("학술관 B1 계단 앞", "학술관 B1 뒷계단 앞", 19.911, 1.3274, "평지", "도보",
      node2X: 2591,
      node2Y: 2766,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 B1 뒷계단 앞", "학술관 B1 계단 앞", 19.911, 1.3274, "평지", "도보");
  //524
  graph.addEdge("학술관 B1 뒷계단 앞", "학술관 B1 뒷계단", 2.09958, 0.139972, "평지", "도보",
      node2X: 2602,
      node2Y: 2770,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 B1 뒷계단", "학술관 B1 뒷계단 앞", 2.09958, 0.139972, "평지", "도보");
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
  graph.addEdge("학술관 B1 뒷계단 앞", "가든쿡 학술관 입구 안", 6.64671, 0.443114, "평지", "도보",
      node2X: 2589,
      node2Y: 2803,
      isInside2: -1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("가든쿡 학술관 입구 안", "학술관 B1 뒷계단 앞", 6.64671, 0.443114, "평지", "도보");
  //526
  graph.addEdge("가든쿡 학술관 입구 안", "가든쿡 학술관 입구", 6.81875, 0.454584, "평지", "도보");
  graph.addEdge("가든쿡 학술관 입구", "가든쿡 학술관 입구 안", 6.81875, 0.454584, "평지", "도보");
  //527
  graph.addEdge("학술관 입구", "학술관 입구 안", 1.97317, 0.131544, "평지", "도보",
      node2X: 2569,
      node2Y: 2670,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 입구 안", "학술관 입구", 1.97317, 0.131544, "평지", "도보");
  //528
  graph.addEdge("학술관 입구 안", "학술관 1층 계단 앞", 3.94633, 0.263089, "평지", "도보",
      node2X: 2591,
      node2Y: 2670,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 1층 계단 앞", "학술관 입구 안", 3.94633, 0.263089, "평지", "도보");
  //529
  graph.addEdge("학술관 1층 계단 앞", "학술관 1층 계단", 8.07205, 0.538136, "평지", "도보");
  graph.addEdge("학술관 1층 계단", "학술관 1층 계단 앞", 8.07205, 0.538136, "평지", "도보");
  //530
  graph.addEdge("학술관 1층 계단 앞", "학술관 1층 뒷계단 앞", 17.2204, 1.14802, "평지", "도보",
      node2X: 2591,
      node2Y: 2766,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 1층 뒷계단 앞", "학술관 1층 계단 앞", 17.2204, 1.14802, "평지", "도보");
  //531
  graph.addEdge("학술관 1층 뒷계단 앞", "학술관 1층 뒷계단", 2.09958, 0.139972, "평지", "도보");
  graph.addEdge("학술관 1층 뒷계단", "학술관 1층 뒷계단 앞", 2.09958, 0.139972, "평지", "도보");
  //532
  graph.addEdge("학술관 1층 뒷계단 앞", "학술관 옆문 안", 10.7687, 0.717914, "평지", "도보",
      node2X: 2589,
      node2Y: 2826,
      isInside2: 1,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 옆문 안", "학술관 1층 뒷계단 앞", 10.7687, 0.717914, "평지", "도보");
  //533
  graph.addEdge("학술관 옆문 안", "학술관 옆문", 7.17515, 0.478344, "평지", "도보");
  graph.addEdge("학술관 옆문", "학술관 옆문 안", 7.17515, 0.478344, "평지", "도보");
  //534
  graph.addEdge("학술관 4층 계단", "학술관 4층 뒷계단 앞", 24.9337, 1.66224, "평지", "도보",
      node2X: 2591,
      node2Y: 2764,
      isInside2: 4,
      building2: "학술관",
      showRoute2: false);
  graph.addEdge("학술관 4층 뒷계단 앞", "학술관 4층 계단", 24.9337, 1.66224, "평지", "도보");
  //535
  graph.addEdge("학술관 4층 뒷계단 앞", "학술관 4층 뒷계단", 2.24761, 0.149841, "평지", "도보");
  graph.addEdge("학술관 4층 뒷계단", "학술관 4층 뒷계단 앞", 2.24761, 0.149841, "평지", "도보");
  //536
  graph.addEdge("학술관 4층 뒷계단 앞", "학술관 문화관 구름다리 입구", 7.37419, 0.491613, "평지", "도보");
  graph.addEdge("학술관 문화관 구름다리 입구", "학술관 4층 뒷계단 앞", 7.37419, 0.491613, "평지", "도보");
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
  //입구: 원흥관 3층 후문, 원흥관 4층 입구, 원흥관 1층 후문, 원흥관 1층 정문, 원흥관 1층 쪽문
  //537
  graph.addEdge("원흥관 1층 쪽문", "원흥관 1층 쪽문 안", 5.52592, 0.368394, "평지", "도보",
      node2X: 766,
      node2Y: 2218,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 쪽문 안", "원흥관 1층 쪽문", 5.52592, 0.368394, "평지", "도보");
  //538
  graph.addEdge("원흥관 1층 쪽문 안", "원흥관 1층 쪽문 계단", 1.90682, 0.127122, "평지", "도보",
      node2X: 759,
      node2Y: 2226,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 쪽문 계단", "원흥관 1층 쪽문 안", 1.90682, 0.127122, "평지", "도보");
  //원흥관 1층 쪽문 계단 1층 - 2층 이동
  graph.addEdge("원흥관 1층 쪽문 계단", "원흥관 2층 쪽문 계단", 13.3333, 2, "계단위", "도보",
      node2X: 759,
      node2Y: 2226,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 쪽문 계단", "원흥관 1층 쪽문 계단", 9.52381, 0.6, "계단아래", "도보");
  //원흥관 1층 쪽문 계단 2층 - 3층 이동
  graph.addEdge("원흥관 2층 쪽문 계단", "원흥관 3층 쪽문 계단", 13.3333, 2, "계단위", "도보",
      node2X: 759,
      node2Y: 2226,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 쪽문 계단", "원흥관 2층 쪽문 계단", 9.52381, 0.6, "계단아래", "도보");
  //원흥관 1층 쪽문 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 쪽문 계단", "원흥관 4층 쪽문 계단", 13.3333, 2, "계단위", "도보",
      node2X: 759,
      node2Y: 2226,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 쪽문 계단", "원흥관 3층 쪽문 계단", 9.52381, 0.6, "계단아래", "도보");
  //539
  graph.addEdge("원흥관 1층 쪽문 안", "원흥관 1층 정문 안", 27.3434, 1.82289, "평지", "도보",
      node2X: 886,
      node2Y: 2312,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 정문 안", "원흥관 1층 쪽문 안", 27.3434, 1.82289, "평지", "도보");
  //540
  graph.addEdge("원흥관 1층 정문 안", "원흥관 1층 정문", 7.25764, 0.483843, "평지", "도보");
  graph.addEdge("원흥관 1층 정문", "원흥관 1층 정문 안", 7.25764, 0.483843, "평지", "도보");
  //541
  graph.addEdge("원흥관 1층 정문 안", "원흥관 1층 중앙", 14.4586, 0.96391, "평지", "도보",
      node2X: 950,
      node2Y: 2361,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 중앙", "원흥관 1층 정문 안", 14.4586, 0.96391, "평지", "도보");
  //542
  graph.addEdge("원흥관 1층 중앙", "원흥관 1층 중앙 계단 앞", 2.02944, 0.135296, "평지", "도보",
      node2X: 958,
      node2Y: 2353,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 중앙 계단 앞", "원흥관 1층 중앙", 2.02944, 0.135296, "평지", "도보");
  //543
  graph.addEdge("원흥관 1층 중앙 계단 앞", "원흥관 1층 중앙 계단", 2.43982, 0.162654, "평지", "도보",
      node2X: 947,
      node2Y: 2345,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 중앙 계단", "원흥관 1층 중앙 계단 앞", 2.43982, 0.162654, "평지", "도보");
  //원흥관 중앙 계단 1층 - 2층 이동
  graph.addEdge("원흥관 1층 중앙 계단", "원흥관 2층 중앙 계단", 13.3333, 2, "계단위", "도보",
      node2X: 947,
      node2Y: 2345,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 중앙 계단", "원흥관 1층 중앙 계단", 9.52381, 0.6, "계단아래", "도보");
  //원흥관 중앙 계단 2층 - 3층 이동
  graph.addEdge("원흥관 2층 중앙 계단", "원흥관 3층 중앙 계단", 13.3333, 2, "계단위", "도보",
      node2X: 947,
      node2Y: 2345,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 중앙 계단", "원흥관 2층 중앙 계단", 9.52381, 0.6, "계단아래", "도보");
  //원흥관 중앙 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 중앙 계단", "원흥관 4층 중앙 계단", 13.3333, 2, "계단위", "도보",
      node2X: 947,
      node2Y: 2345,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 중앙 계단", "원흥관 3층 중앙 계단", 9.52381, 0.6, "계단아래", "도보");
  //544
  graph.addEdge("원흥관 1층 정문 안", "원흥관 1층 후문 안", 6.42266, 0.428178, "평지", "도보",
      node2X: 865,
      node2Y: 2341,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 후문 안", "원흥관 1층 정문 안", 6.42266, 0.428178, "평지", "도보");
  //545
  graph.addEdge("원흥관 1층 후문 안", "원흥관 1층 후문 계단 앞", 1.01472, 0.067648, "평지", "도보",
      node2X: 861,
      node2Y: 2337,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 후문 계단 앞", "원흥관 1층 후문 안", 1.01472, 0.067648, "평지", "도보");
  //546
  graph.addEdge("원흥관 1층 후문 계단 앞", "원흥관 1층 후문 계단", 1.14858, 0.0765723, "평지", "도보",
      node2X: 856,
      node2Y: 2341,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 후문 계단", "원흥관 1층 후문 계단 앞", 1.14858, 0.0765723, "평지", "도보");
  //원흥관 후문 계단 1층 - 2층 이동
  graph.addEdge("원흥관 1층 후문 계단", "원흥관 2층 후문 계단", 13.3333, 2, "계단위", "도보",
      node2X: 861,
      node2Y: 2342,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 후문 계단", "원흥관 1층 후문 계단", 9.52381, 0.6, "계단아래", "도보");
  //원흥관 후문 계단 2층 - 3층 이동
  graph.addEdge("원흥관 2층 후문 계단", "원흥관 3층 후문 계단", 13.3333, 2, "계단위", "도보",
      node2X: 861,
      node2Y: 2342,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 후문 계단", "원흥관 2층 후문 계단", 9.52381, 0.6, "계단아래", "도보");
  //원흥관 후문 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 후문 계단", "원흥관 4층 후문 계단", 13.3333, 2, "계단위", "도보",
      node2X: 861,
      node2Y: 2342,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 후문 계단", "원흥관 3층 후문 계단", 9.52381, 0.6, "계단아래", "도보");
  //547
  graph.addEdge("원흥관 1층 후문 안", "원흥관 1층 후문", 3.56057, 0.237371, "평지", "도보",
      node2X: 852,
      node2Y: 2356,
      isInside2: 1,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 1층 후문", "원흥관 1층 후문 안", 3.56057, 0.237371, "평지", "도보");
  //548
  graph.addEdge("원흥관 2층 쪽문 계단", "원흥관 2층 쪽문 계단 앞", 1.90682, 0.127122, "평지", "도보",
      node2X: 766,
      node2Y: 2218,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 쪽문 계단 앞", "원흥관 2층 쪽문 계단", 1.90682, 0.127122, "평지", "도보");
  //549
  graph.addEdge("원흥관 2층 쪽문 계단 앞", "원흥관 2층 왼쪽", 27.3434, 1.82289, "평지", "도보",
      node2X: 886,
      node2Y: 2312,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 왼쪽", "원흥관 2층 쪽문 계단 앞", 27.3434, 1.82289, "평지", "도보");
  //550
  graph.addEdge("원흥관 2층 왼쪽", "원흥관 2층 후문 계단", 7.00497, 0.466998, "평지", "도보");
  graph.addEdge("원흥관 2층 후문 계단", "원흥관 2층 왼쪽", 7.00497, 0.466998, "평지", "도보");
  //551
  graph.addEdge("원흥관 2층 왼쪽", "원흥관 2층 중앙", 16.9767, 1.13178, "평지", "도보",
      node2X: 960,
      node2Y: 2371,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 중앙", "원흥관 2층 왼쪽", 16.9767, 1.13178, "평지", "도보");
  //552
  graph.addEdge("원흥관 2층 중앙", "원흥관 2층 중앙 계단 앞", 2.16001, 0.144, "평지", "도보",
      node2X: 968,
      node2Y: 2362,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 중앙 계단 앞", "원흥관 2층 중앙", 2.16001, 0.144, "평지", "도보");
  //553
  graph.addEdge("원흥관 2층 중앙 계단 앞", "원흥관 2층 중앙 계단", 4.84655, 0.323103, "평지", "도보");
  graph.addEdge("원흥관 2층 중앙 계단", "원흥관 2층 중앙 계단 앞", 4.84655, 0.323103, "평지", "도보");
  //554
  graph.addEdge("원흥관 2층 중앙 계단 앞", "원흥관 2층 엘베", 1.04595, 0.06973, "평지", "도보",
      node2X: 971,
      node2Y: 2357,
      isInside2: 2,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 2층 엘베", "원흥관 2층 중앙 계단 앞", 1.04595, 0.06973, "평지", "도보");
  //원흥관 엘베 2층 - 3층 이동
  graph.addEdge("원흥관 2층 엘베", "원흥관 3층 엘베", 108, 0, "엘베", "도보",
      node2X: 971,
      node2Y: 2357,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: true);
  graph.addEdge("원흥관 3층 엘베", "원흥관 2층 엘베", 108, 0, "엘베", "도보");
  //원흥관 엘베 2층 - 4층 이동
  graph.addEdge("원흥관 2층 엘베", "원흥관 4층 엘베", 120, 0, "엘베", "도보",
      node2X: 971,
      node2Y: 2357,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: true);
  graph.addEdge("원흥관 4층 엘베", "원흥관 2층 엘베", 120, 0, "엘베", "도보");
  //원흥관 엘베 3층 - 4층 이동
  graph.addEdge("원흥관 3층 엘베", "원흥관 4층 엘베", 108, 0, "엘베", "도보");
  graph.addEdge("원흥관 4층 엘베", "원흥관 3층 엘베", 108, 0, "엘베", "도보");
  //555
  graph.addEdge("원흥관 3층 쪽문 계단", "원흥관 3층 쪽문 계단 앞", 1.90682, 0.127122, "평지", "도보",
      node2X: 766,
      node2Y: 2218,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 쪽문 계단 앞", "원흥관 3층 쪽문 계단", 1.90682, 0.127122, "평지", "도보");
  //556
  graph.addEdge("원흥관 3층 쪽문 계단 앞", "원흥관 3층 왼쪽", 27.3434, 1.82289, "평지", "도보",
      node2X: 886,
      node2Y: 2312,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 왼쪽", "원흥관 3층 쪽문 계단 앞", 27.3434, 1.82289, "평지", "도보");
  //557
  graph.addEdge("원흥관 3층 왼쪽", "원흥관 3층 후문 계단", 7.00497, 0.466998, "평지", "도보");
  graph.addEdge("원흥관 3층 후문 계단", "원흥관 3층 왼쪽", 7.00497, 0.466998, "평지", "도보");
  //558
  graph.addEdge("원흥관 3층 왼쪽", "원흥관 3층 중앙", 16.9767, 1.13178, "평지", "도보",
      node2X: 960,
      node2Y: 2371,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 중앙", "원흥관 3층 왼쪽", 16.9767, 1.13178, "평지", "도보");
  //559
  graph.addEdge("원흥관 3층 중앙", "원흥관 3층 중앙 계단 앞", 2.16001, 0.144, "평지", "도보",
      node2X: 968,
      node2Y: 2362,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 중앙 계단 앞", "원흥관 3층 중앙", 2.16001, 0.144, "평지", "도보");
  //560
  graph.addEdge("원흥관 3층 중앙 계단 앞", "원흥관 3층 중앙 계단", 4.84655, 0.323103, "평지", "도보");
  graph.addEdge("원흥관 3층 중앙 계단", "원흥관 3층 중앙 계단 앞", 4.84655, 0.323103, "평지", "도보");
  //561
  graph.addEdge("원흥관 3층 중앙 계단 앞", "원흥관 3층 엘베", 1.04595, 0.06973, "평지", "도보");
  graph.addEdge("원흥관 3층 엘베", "원흥관 3층 중앙 계단 앞", 1.04595, 0.06973, "평지", "도보");
  //562
  graph.addEdge("원흥관 3층 중앙", "원흥관 3층 오른쪽 계단 앞", 6.59568, 0.439712, "평지", "도보",
      node2X: 986,
      node2Y: 2397,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 오른쪽 계단 앞", "원흥관 3층 중앙", 6.59568, 0.439712, "평지", "도보");
  //563
  graph.addEdge("원흥관 3층 오른쪽 계단 앞", "원흥관 3층 오른쪽 계단", 6.75237, 0.450158, "평지", "도보",
      node2X: 957,
      node2Y: 2421,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 오른쪽 계단", "원흥관 3층 오른쪽 계단 앞", 6.75237, 0.450158, "평지", "도보");
  //원흥관 오른쪽 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 오른쪽 계단", "원흥관 4층 오른쪽 계단", 13.3333, 2, "계단위", "도보",
      node2X: 957,
      node2Y: 2433,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 오른쪽 계단", "원흥관 3층 오른쪽 계단", 9.52381, 0.6, "계단아래", "도보");
  //564
  graph.addEdge("원흥관 3층 오른쪽 계단 앞", "원흥관 3층 후문 안", 10.8935, 0.726232, "평지", "도보",
      node2X: 968,
      node2Y: 2455,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 후문 안", "원흥관 3층 오른쪽 계단 앞", 10.8935, 0.726232, "평지", "도보");
  //565
  graph.addEdge("원흥관 3층 후문 안", "원흥관 3층 후문", 2.21879, 0.14792, "평지", "도보");
  graph.addEdge("원흥관 3층 후문", "원흥관 3층 후문 안", 2.21879, 0.14792, "평지", "도보");
  //566
  graph.addEdge("원흥관 3층 후문 안", "원흥관 3층 야외 계단문 안", 22.9212, 1.52808, "평지", "도보",
      node2X: 930,
      node2Y: 2577,
      isInside2: 3,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단문 안", "원흥관 3층 후문 안", 22.9212, 1.52808, "평지", "도보");
  //567
  graph.addEdge("원흥관 3층 야외 계단문 안", "원흥관 3층 야외 계단문", 1.87277, 0.124851, "평지", "도보",
      node2X: 940,
      node2Y: 2580,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단문", "원흥관 3층 야외 계단문 안", 1.87277, 0.124851, "평지", "도보");
  //568
  graph.addEdge("원흥관 3층 야외 계단문", "원흥관 3층 야외 계단", 6.66667, 1, "계단위", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 3층 야외 계단", "원흥관 3층 야외 계단문", 4.7619, 0.3, "계단아래", "도보");
  //원흥관 야외 계단 3층 - 4층 이동
  graph.addEdge("원흥관 3층 야외 계단", "원흥관 4층 야외 계단", 6.66667, 1, "계단위", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 4층 야외 계단", "원흥관 3층 야외 계단", 4.7619, 0.3, "계단아래", "도보");
  //원흥관 야외 계단 4층 - 5층 이동
  graph.addEdge("원흥관 4층 야외 계단", "원흥관 5층 야외 계단", 13.3333, 2, "계단위", "도보");
  graph.addEdge("원흥관 5층 야외 계단", "원흥관 4층 야외 계단", 9.52381, 0.6, "계단아래", "도보");
  //569
  graph.addEdge("원흥관 4층 쪽문 계단", "원흥관 4층 쪽문 계단 앞", 1.90682, 0.127122, "평지", "도보",
      node2X: 766,
      node2Y: 2218,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 쪽문 계단 앞", "원흥관 4층 쪽문 계단", 1.90682, 0.127122, "평지", "도보");
  //570
  graph.addEdge("원흥관 4층 쪽문 계단 앞", "원흥관 4층 왼쪽", 27.3434, 1.82289, "평지", "도보",
      node2X: 886,
      node2Y: 2312,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 왼쪽", "원흥관 4층 쪽문 계단 앞", 27.3434, 1.82289, "평지", "도보");
  //571
  graph.addEdge("원흥관 4층 왼쪽", "원흥관 4층 후문 계단", 7.00497, 0.466998, "평지", "도보");
  graph.addEdge("원흥관 4층 후문 계단", "원흥관 4층 왼쪽", 7.00497, 0.466998, "평지", "도보");
  //572
  graph.addEdge("원흥관 4층 왼쪽", "원흥관 4층 중앙", 16.9767, 1.13178, "평지", "도보",
      node2X: 960,
      node2Y: 2371,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 중앙", "원흥관 4층 왼쪽", 16.9767, 1.13178, "평지", "도보");
  //573
  graph.addEdge("원흥관 4층 중앙", "원흥관 4층 중앙 계단 앞", 2.16001, 0.144, "평지", "도보",
      node2X: 968,
      node2Y: 2362,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 중앙 계단 앞", "원흥관 4층 중앙", 2.16001, 0.144, "평지", "도보");
  //574
  graph.addEdge("원흥관 4층 중앙 계단 앞", "원흥관 4층 중앙 계단", 4.84655, 0.323103, "평지", "도보");
  graph.addEdge("원흥관 4층 중앙 계단", "원흥관 4층 중앙 계단 앞", 4.84655, 0.323103, "평지", "도보");
  //575
  graph.addEdge("원흥관 4층 중앙 계단 앞", "원흥관 4층 엘베", 1.04595, 0.06973, "평지", "도보");
  graph.addEdge("원흥관 4층 엘베", "원흥관 4층 중앙 계단 앞", 1.04595, 0.06973, "평지", "도보");
  //576
  graph.addEdge("원흥관 4층 중앙", "원흥관 4층 입구 안", 6.26543, 0.417696, "평지", "도보",
      node2X: 974,
      node2Y: 2403,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 입구 안", "원흥관 4층 중앙", 6.26543, 0.417696, "평지", "도보");
  //578
  graph.addEdge("원흥관 4층 입구 안", "원흥관 4층 입구", 4.41214, 0.294142, "평지", "도보");
  graph.addEdge("원흥관 4층 입구", "원흥관 4층 입구 안", 4.41214, 0.294142, "평지", "도보");
  //579
  graph.addEdge("원흥관 4층 입구 안", "원흥관 4층 입구 옆", 7.38945, 0.49263, "평지", "도보",
      node2X: 970,
      node2Y: 2444,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 입구 옆", "원흥관 4층 입구 안", 7.38945, 0.49263, "평지", "도보");
  //577
  graph.addEdge("원흥관 4층 입구 옆", "원흥관 4층 오른쪽 계단", 3.05471, 0.203647, "평지", "도보");
  graph.addEdge("원흥관 4층 오른쪽 계단", "원흥관 4층 입구 옆", 3.05471, 0.203647, "평지", "도보");
  //580
  graph.addEdge("원흥관 4층 입구 옆", "원흥관 4층 야외 계단문 안", 24.913, 1.66087, "평지", "도보",
      node2X: 930,
      node2Y: 2577,
      isInside2: 4,
      building2: "원흥관",
      showRoute2: false);
  graph.addEdge("원흥관 4층 야외 계단문 안", "원흥관 4층 입구 옆", 24.913, 1.66087, "평지", "도보");
  //581
  graph.addEdge("원흥관 4층 야외 계단문 안", "원흥관 4층 야외 계단문", 1.87277, 0.124851, "평지", "도보",
      node2X: 940,
      node2Y: 2580,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 4층 야외 계단문", "원흥관 4층 야외 계단문 안", 1.87277, 0.124851, "평지", "도보");
  //582
  graph.addEdge("원흥관 4층 야외 계단문", "원흥관 4층 야외 계단", 6.66667, 1, "계단위", "도보",
      node2X: 950,
      node2Y: 2581,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("원흥관 4층 야외 계단", "원흥관 4층 야외 계단문", 4.7619, 0.3, "계단아래", "도보");
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
  graph.addEdge("본관 1층 입구", "본관 1층 입구 안", 2.0919, 0.13946, "평지", "도보",
      node2X: 1123,
      node2Y: 2415,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 입구 안", "본관 1층 입구", 2.0919, 0.13946, "평지", "도보");
  //588
  graph.addEdge("본관 1층 입구 안", "본관 1층 엘베 앞", 2.92008, 0.194672, "평지", "도보",
      node2X: 1120,
      node2Y: 2431,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 엘베 앞", "본관 1층 입구 안", 2.92008, 0.194672, "평지", "도보");
  //589
  graph.addEdge("본관 1층 엘베 앞", "본관 1층 엘베", 1.13449, 0.0756328, "평지", "도보",
      node2X: 1114,
      node2Y: 2429,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 엘베", "본관 1층 엘베 앞", 1.13449, 0.0756328, "평지", "도보");
  //본관 엘베 1층 - 2층 이동
  graph.addEdge("본관 1층 엘베", "본관 2층 엘베", 84, 0, "엘베", "도보",
      node2X: 1114,
      node2Y: 2429,
      isInside2: 2,
      building2: "본관",
      showRoute2: true);
  graph.addEdge("본관 2층 엘베", "본관 1층 엘베", 84, 0, "엘베", "도보");
  //본관 엘베 1층 - 3층 이동
  graph.addEdge("본관 1층 엘베", "본관 3층 엘베", 96, 0, "엘베", "도보",
      node2X: 1114,
      node2Y: 2429,
      isInside2: 3,
      building2: "본관",
      showRoute2: true);
  graph.addEdge("본관 3층 엘베", "본관 1층 엘베", 96, 0, "엘베", "도보");
  //본관 엘베 2층 - 3층 이동
  graph.addEdge("본관 2층 엘베", "본관 3층 엘베", 84, 0, "엘베", "도보");
  graph.addEdge("본관 3층 엘베", "본관 2층 엘베", 84, 0, "엘베", "도보");
  //590
  graph.addEdge("본관 1층 엘베 앞", "본관 1층 왼쪽 계단 앞", 0.914656, 0.0609771, "평지", "도보",
      node2X: 1125,
      node2Y: 2432,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 왼쪽 계단 앞", "본관 1층 엘베 앞", 0.914656, 0.0609771, "평지", "도보");
  //591
  graph.addEdge("본관 1층 왼쪽 계단 앞", "본관 1층 왼쪽 계단", 1.87277, 0.124851, "평지", "도보",
      node2X: 1128,
      node2Y: 2422,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 왼쪽 계단", "본관 1층 왼쪽 계단 앞", 1.87277, 0.124851, "평지", "도보");
  //본관 왼쪽 계단 1층 - 2층 이동
  graph.addEdge("본관 1층 왼쪽 계단", "본관 2층 왼쪽 계단", 13.3333, 2, "계단위", "도보",
      node2X: 1128,
      node2Y: 2422,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 왼쪽 계단", "본관 1층 왼쪽 계단", 9.52381, 0.6, "계단아래", "도보");
  //본관 왼쪽 계단 2층 - 3층 이동
  graph.addEdge("본관 2층 왼쪽 계단", "본관 3층 왼쪽 계단", 13.3333, 2, "계단위", "도보",
      node2X: 1128,
      node2Y: 2422,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 계단", "본관 2층 왼쪽 계단", 9.52381, 0.6, "계단아래", "도보");
  //592
  graph.addEdge("본관 1층 왼쪽 계단 앞", "본관 1층 갈림길", 6.06979, 0.404653, "평지", "도보",
      node2X: 1157,
      node2Y: 2443,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 갈림길", "본관 1층 왼쪽 계단 앞", 6.06979, 0.404653, "평지", "도보");
  //593
  graph.addEdge("본관 1층 갈림길", "본관 1층 중앙 계단 옆", 5.39629, 0.359753, "평지", "도보",
      node2X: 1186,
      node2Y: 2451,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 중앙 계단 옆", "본관 1층 갈림길", 5.39629, 0.359753, "평지", "도보");
  //594
  graph.addEdge("본관 1층 중앙 계단 옆", "본관 1층 중앙 계단 앞", 3.13272, 0.208848, "평지", "도보",
      node2X: 1182,
      node2Y: 2468,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 중앙 계단 앞", "본관 1층 중앙 계단 옆", 3.13272, 0.208848, "평지", "도보");
  //595
  graph.addEdge("본관 1층 중앙 계단 앞", "본관 1층 중앙 계단", 2.78471, 0.185647, "평지", "도보",
      node2X: 1197,
      node2Y: 2472,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 중앙 계단", "본관 1층 중앙 계단 앞", 2.78471, 0.185647, "평지", "도보");
  //본관 중앙 계단 1층 - 2층 이동
  graph.addEdge("본관 1층 중앙 계단", "본관 2층 중앙 계단", 13.3333, 2, "계단위", "도보",
      node2X: 1197,
      node2Y: 2472,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중앙 계단", "본관 1층 중앙 계단", 9.52381, 0.6, "계단아래", "도보");
  //596
  graph.addEdge("본관 1층 갈림길", "본관 1층 오른쪽", 31.322, 2.08814, "평지", "도보",
      node2X: 1106,
      node2Y: 2610,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 오른쪽", "본관 1층 갈림길", 31.322, 2.08814, "평지", "도보");
  //597
  graph.addEdge("본관 1층 오른쪽", "본관 1층 오른쪽 계단 앞", 8.96894, 0.597929, "평지", "도보",
      node2X: 1058,
      node2Y: 2596,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 오른쪽 계단 앞", "본관 1층 오른쪽", 8.96894, 0.597929, "평지", "도보");
  //598
  graph.addEdge("본관 1층 오른쪽 계단 앞", "본관 1층 오른쪽 계단", 1.4792, 0.098613, "평지", "도보",
      node2X: 1056,
      node2Y: 2604,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 오른쪽 계단", "본관 1층 오른쪽 계단 앞", 1.4792, 0.098613, "평지", "도보");
  //본관 오른쪽 계단 1층 - 2층 이동
  graph.addEdge("본관 1층 오른쪽 계단", "본관 2층 오른쪽 계단", 13.3333, 1, "계단위", "도보",
      node2X: 1056,
      node2Y: 2604,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 오른쪽 계단", "본관 1층 오른쪽 계단", 4.7619, 0.3, "계단아래", "도보");
  //본관 오른쪽 계단 2층 - 3층 이동
  graph.addEdge("본관 2층 오른쪽 계단", "본관 3층 오른쪽 계단", 13.3333, 1, "계단위", "도보",
      node2X: 1056,
      node2Y: 2604,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 계단", "본관 2층 오른쪽 계단", 4.7619, 0.3, "계단아래", "도보");
  //599
  graph.addEdge("본관 1층 오른쪽 계단 앞", "본관 1층 쪽문 안", 2.6118, 0.17412, "평지", "도보",
      node2X: 1044,
      node2Y: 2592,
      isInside2: 1,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 1층 쪽문 안", "본관 1층 오른쪽 계단 앞", 2.6118, 0.17412, "평지", "도보");
  //600
  graph.addEdge("본관 1층 쪽문 안", "본관 1층 쪽문", 1.62434, 0.10829, "평지", "도보");
  graph.addEdge("본관 1층 쪽문", "본관 1층 쪽문 안", 1.62434, 0.10829, "평지", "도보");
  //601
  graph.addEdge("본관 2층 엘베", "본관 2층 엘베 앞", 2.21879, 0.14792, "평지", "도보",
      node2X: 1126,
      node2Y: 2432,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 엘베 앞", "본관 2층 엘베", 2.21879, 0.14792, "평지", "도보");
  //616
  graph.addEdge("본관 2층 엘베 앞", "본관 2층 왼쪽 계단", 1.82931, 0.121954, "평지", "도보");
  graph.addEdge("본관 2층 왼쪽 계단", "본관 2층 엘베 앞", 1.82931, 0.121954, "평지", "도보");
  //602
  graph.addEdge("본관 2층 엘베 앞", "본관 2층 갈림길", 17.0268, 1.13512, "평지", "도보",
      node2X: 1217,
      node2Y: 2459,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 갈림길", "본관 2층 엘베 앞", 17.0268, 1.13512, "평지", "도보");
  //603
  graph.addEdge("본관 2층 갈림길", "본관 2층 구석 계단 옆", 4.19915, 0.279943, "평지", "도보",
      node2X: 1225,
      node2Y: 2437,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 구석 계단 옆", "본관 2층 갈림길", 4.19915, 0.279943, "평지", "도보");
  //604
  graph.addEdge("본관 2층 구석 계단 옆", "본관 2층 구석 계단 앞", 2.78471, 0.185647, "평지", "도보",
      node2X: 1240,
      node2Y: 2441,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 구석 계단 앞", "본관 2층 구석 계단 옆", 2.78471, 0.185647, "평지", "도보");
  //604
  graph.addEdge("본관 2층 구석 계단 앞", "본관 2층 구석 계단", 1.53261, 0.102174, "평지", "도보",
      node2X: 1243,
      node2Y: 2433,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 구석 계단", "본관 2층 구석 계단 앞", 1.53261, 0.102174, "평지", "도보");
  //본관 구석 계단 2층 - 3층 이동
  graph.addEdge("본관 2층 구석 계단", "본관 3층 구석 계단", 30, 30, "평지", "도보",
      node2X: 1235,
      node2Y: 2447,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 구석 계단", "본관 2층 구석 계단", 16, 16, "평지", "도보");
  //606
  graph.addEdge("본관 2층 갈림길", "본관 2층 중앙 계단 앞", 3.00694, 0.200462, "평지", "도보",
      node2X: 1212,
      node2Y: 2475,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중앙 계단 앞", "본관 2층 갈림길", 3.00694, 0.200462, "평지", "도보");
  //607
  graph.addEdge("본관 2층 중앙 계단 앞", "본관 2층 중앙 계단", 2.74397, 0.182931, "평지", "도보");
  graph.addEdge("본관 2층 중앙 계단", "본관 2층 중앙 계단 앞", 2.74397, 0.182931, "평지", "도보");
  //608
  graph.addEdge("본관 2층 중앙 계단 앞", "본관 2층 중도쪽", 28.8822, 1.92548, "평지", "도보",
      node2X: 1165,
      node2Y: 2629,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중도쪽", "본관 2층 중앙 계단 앞", 28.8822, 1.92548, "평지", "도보");
  //609
  graph.addEdge("본관 2층 중도쪽", "본관 2층 중도 쪽문 통로", 3.86394, 0.257596, "평지", "도보",
      node2X: 1185,
      node2Y: 2637,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중도 쪽문 통로", "본관 2층 중도쪽", 3.86394, 0.257596, "평지", "도보");
  //610
  graph.addEdge("본관 2층 중도 쪽문 통로", "본관 2층 중도 쪽문 안", 12.4238, 0.828256, "평지", "도보",
      node2X: 1164,
      node2Y: 2703,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 중도 쪽문 안", "본관 2층 중도 쪽문 통로", 12.4238, 0.828256, "평지", "도보");
  //611
  graph.addEdge("본관 2층 중도 쪽문 안", "본관 2층 중도 쪽문", 1.09112, 0.0727413, "평지", "도보");
  graph.addEdge("본관 2층 중도 쪽문", "본관 2층 중도 쪽문 안", 1.09112, 0.0727413, "평지", "도보");
  //612
  graph.addEdge("본관 2층 중도쪽", "본관 2층 오른쪽", 17.1323, 1.14215, "평지", "도보",
      node2X: 1074,
      node2Y: 2600,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 오른쪽", "본관 2층 중도쪽", 17.1323, 1.14215, "평지", "도보");
  //613
  graph.addEdge("본관 2층 오른쪽", "본관 2층 엘베 앞", 31.5462, 2.10308, "평지", "도보");
  graph.addEdge("본관 2층 엘베 앞", "본관 2층 오른쪽", 31.5462, 2.10308, "평지", "도보");
  //614
  graph.addEdge("본관 2층 오른쪽", "본관 2층 오른쪽 계단 앞", 3.00694, 0.200462, "평지", "도보",
      node2X: 1058,
      node2Y: 2595,
      isInside2: 2,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 2층 오른쪽 계단 앞", "본관 2층 오른쪽", 3.00694, 0.200462, "평지", "도보");
  //615
  graph.addEdge("본관 2층 오른쪽 계단 앞", "본관 2층 오른쪽 계단", 1.65379, 0.110253, "평지", "도보");
  graph.addEdge("본관 2층 오른쪽 계단", "본관 2층 오른쪽 계단 앞", 1.65379, 0.110253, "평지", "도보");
  //734
  graph.addEdge("본관 3층 엘베", "본관 3층 엘베 앞", 2.21879, 0.14792, "평지", "도보",
      node2X: 1126,
      node2Y: 2432,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 엘베 앞", "본관 3층 엘베", 2.21879, 0.14792, "평지", "도보");
  //617
  graph.addEdge("본관 3층 엘베 앞", "본관 3층 왼쪽 계단", 1.82931, 0.121954, "평지", "도보");
  graph.addEdge("본관 3층 왼쪽 계단", "본관 3층 엘베 앞", 1.82931, 0.121954, "평지", "도보");
  //618
  graph.addEdge("본관 3층 엘베 앞", "본관 3층 오른쪽 갈림길", 17.8885, 1.19257, "평지", "도보",
      node2X: 1222,
      node2Y: 2459,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 갈림길", "본관 3층 엘베 앞", 17.8885, 1.19257, "평지", "도보");
  //619
  graph.addEdge("본관 3층 오른쪽 갈림길", "본관 3층 오른쪽 입구 안", 2.16744, 0.144496, "평지", "도보",
      node2X: 1233,
      node2Y: 2454,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 입구 안", "본관 3층 오른쪽 갈림길", 2.16744, 0.144496, "평지", "도보");
  //620
  graph.addEdge("본관 3층 오른쪽 입구 안", "본관 3층 구석 계단", 1.3059, 0.0870598, "평지", "도보");
  graph.addEdge("본관 3층 구석 계단", "본관 3층 오른쪽 입구 안", 1.3059, 0.0870598, "평지", "도보");
  //621
  graph.addEdge("본관 3층 오른쪽 입구 안", "본관 3층 오른쪽 입구", 4.26379, 0.284252, "평지", "도보");
  graph.addEdge("본관 3층 오른쪽 입구", "본관 3층 오른쪽 입구 안", 4.26379, 0.284252, "평지", "도보");
  //622
  graph.addEdge("본관 3층 오른쪽 갈림길", "본관 3층 왼쪽 입구 안", 28.0915, 1.87277, "평지", "도보",
      node2X: 1177,
      node2Y: 2609,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 입구 안", "본관 3층 오른쪽 갈림길", 28.0915, 1.87277, "평지", "도보");
  //623
  graph.addEdge("본관 3층 왼쪽 입구 안", "본관 3층 왼쪽 입구", 5.50257, 0.366838, "평지", "도보");
  graph.addEdge("본관 3층 왼쪽 입구", "본관 3층 왼쪽 입구 안", 5.50257, 0.366838, "평지", "도보");
  //624
  graph.addEdge("본관 3층 왼쪽 입구 안", "본관 3층 왼쪽 갈림길", 2.43982, 0.162654, "평지", "도보",
      node2X: 1164,
      node2Y: 2613,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 갈림길", "본관 3층 왼쪽 입구 안", 2.43982, 0.162654, "평지", "도보");
  //625
  graph.addEdge("본관 3층 왼쪽 갈림길", "본관 3층 왼쪽 안", 15.7731, 1.05154, "평지", "도보",
      node2X: 1080,
      node2Y: 2587,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 왼쪽 안", "본관 3층 왼쪽 갈림길", 15.7731, 1.05154, "평지", "도보");
  //626
  graph.addEdge("본관 3층 왼쪽 안", "본관 3층 엘베 앞", 29.0023, 1.93349, "평지", "도보");
  graph.addEdge("본관 3층 엘베 앞", "본관 3층 왼쪽 안", 29.0023, 1.93349, "평지", "도보");
  //627
  graph.addEdge("본관 3층 왼쪽 안", "본관 3층 오른쪽 계단 앞", 4.25245, 0.283497, "평지", "도보",
      node2X: 1059,
      node2Y: 2598,
      isInside2: 3,
      building2: "본관",
      showRoute2: false);
  graph.addEdge("본관 3층 오른쪽 계단 앞", "본관 3층 왼쪽 안", 4.25245, 0.283497, "평지", "도보");
  //628
  graph.addEdge("본관 3층 오른쪽 계단 앞", "본관 3층 오른쪽 계단", 1.20331, 0.0802206, "평지", "도보");
  graph.addEdge("본관 3층 오른쪽 계단", "본관 3층 오른쪽 계단 앞", 1.20331, 0.0802206, "평지", "도보");
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
  graph.addEdge("다향관 1층 왼쪽 계단 입구", "다향관 1층 왼쪽 계단", 1.53261, 0.102174, "평지", "도보",
      node2X: 1360,
      node2Y: 2420,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 왼쪽 계단", "다향관 1층 왼쪽 계단 입구", 1.53261, 0.102174, "평지", "도보");
  //다향관 왼쪽 계단 1층 - 2층 이동
  graph.addEdge("다향관 1층 왼쪽 계단", "다향관 2층 왼쪽 계단", 13.3333, 1, "계단위", "도보",
      node2X: 1360,
      node2Y: 2420,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 2층 왼쪽 계단", "다향관 1층 왼쪽 계단", 4.7619, 0.3, "계단아래", "도보");
  //다향관 왼쪽 계단 2층 - 3층 이동
  graph.addEdge("다향관 2층 왼쪽 계단", "다향관 3층 왼쪽 계단", 13.3333, 1, "계단위", "도보",
      node2X: 1360,
      node2Y: 2420,
      isInside2: 3,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 3층 왼쪽 계단", "다향관 2층 왼쪽 계단", 4.7619, 0.3, "계단아래", "도보");
  //632
  graph.addEdge("다향관 1층 왼쪽 계단", "다향관 1층 입구 안", 2.21879, 0.14792, "평지", "도보",
      node2X: 1372,
      node2Y: 2423,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 입구 안", "다향관 1층 왼쪽 계단", 2.21879, 0.14792, "평지", "도보");
  //633
  graph.addEdge("다향관 1층 입구 안", "다향관 1층 길1", 5.90045, 0.393363, "평지", "도보",
      node2X: 1383,
      node2Y: 2392,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길1", "다향관 1층 입구 안", 5.90045, 0.393363, "평지", "도보");
  //634
  graph.addEdge("다향관 1층 길1", "다향관 1층 길2", 9.93085, 0.662057, "평지", "도보",
      node2X: 1436,
      node2Y: 2408,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길2", "다향관 1층 길1", 9.93085, 0.662057, "평지", "도보");
  //635
  graph.addEdge("다향관 1층 길2", "다향관 1층 길3", 2.95839, 0.197226, "평지", "도보",
      node2X: 1432,
      node2Y: 2424,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길3", "다향관 1층 길2", 2.95839, 0.197226, "평지", "도보");
  //636
  graph.addEdge("다향관 1층 길3", "다향관 1층 길4", 7.20424, 0.480283, "평지", "도보",
      node2X: 1470,
      node2Y: 2437,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길4", "다향관 1층 길3", 7.20424, 0.480283, "평지", "도보");
  //637
  graph.addEdge("다향관 1층 길4", "다향관 1층 길5", 3.62771, 0.241847, "평지", "도보",
      node2X: 1467,
      node2Y: 2457,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길5", "다향관 1층 길4", 3.62771, 0.241847, "평지", "도보");
  //638
  graph.addEdge("다향관 1층 길5", "다향관 1층 길6", 15.6018, 1.04012, "평지", "도보",
      node2X: 1550,
      node2Y: 2483,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길6", "다향관 1층 길5", 15.6018, 1.04012, "평지", "도보");
  //639
  graph.addEdge("다향관 1층 길6", "다향관 1층 길7", 1.4792, 0.098613, "평지", "도보",
      node2X: 1548,
      node2Y: 2491,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길7", "다향관 1층 길6", 1.4792, 0.098613, "평지", "도보");
  //640
  graph.addEdge("다향관 1층 길7", "다향관 1층 길8", 1.53261, 0.102174, "평지", "도보",
      node2X: 1556,
      node2Y: 2494,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 길8", "다향관 1층 길7", 1.53261, 0.102174, "평지", "도보");
  //641
  graph.addEdge("다향관 1층 길8", "다향관 1층 오른쪽 계단 앞", 4.31256, 0.287504, "평지", "도보",
      node2X: 1549,
      node2Y: 2517,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 오른쪽 계단 앞", "다향관 1층 길8", 4.31256, 0.287504, "평지", "도보");
  //642
  graph.addEdge("다향관 1층 오른쪽 계단 앞", "다향관 1층 오른쪽 계단", 6.66667, 1, "계단위", "도보",
      node2X: 1566,
      node2Y: 2523,
      isInside2: 1,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 1층 오른쪽 계단", "다향관 1층 오른쪽 계단 앞", 4.7619, 0.3, "계단아래", "도보");
  //다향관 오른쪽 계단 1층 - 2층 이동
  graph.addEdge("다향관 1층 오른쪽 계단", "다향관 2층 오른쪽 계단", 9.21954, 9.21954, "평지", "도보",
      node2X: 1568,
      node2Y: 2514,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 2층 오른쪽 계단", "다향관 1층 오른쪽 계단", 9.21954, 9.21954, "평지", "도보");
  //643
  graph.addEdge("다향관 2층 왼쪽 계단", "다향관 2층 왼쪽 계단 입구", 1.53261, 0.102174, "평지", "도보");
  graph.addEdge("다향관 2층 왼쪽 계단 입구", "다향관 2층 왼쪽 계단", 1.53261, 0.102174, "평지", "도보");
  //644
  graph.addEdge("다향관 2층 오른쪽 계단", "다향관 2층 세미나실 오른쪽", 6.66667, 1, "계단위", "도보",
      node2X: 1548,
      node2Y: 2509,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 2층 세미나실 오른쪽", "다향관 2층 오른쪽 계단", 4.7619, 0.3, "계단아래", "도보");
  //645
  graph.addEdge("다향관 2층 세미나실 오른쪽", "다향관 2층 세미나실 왼쪽", 1.53261, 0.102174, "평지", "도보",
      node2X: 1545,
      node2Y: 2517,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 2층 세미나실 왼쪽", "다향관 2층 세미나실 오른쪽", 1.53261, 0.102174, "평지", "도보");
  //646
  graph.addEdge("다향관 2층 세미나실 왼쪽", "다향관 3층 오른쪽 계단", 6.66667, 1, "계단위", "도보",
      node2X: 1561,
      node2Y: 2522,
      isInside2: 2,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 3층 오른쪽 계단", "다향관 2층 세미나실 왼쪽", 4.7619, 0.3, "계단아래", "도보");
  //647
  graph.addEdge("다향관 3층 오른쪽 계단", "다향관 3층 오른쪽 계단 앞", 6.66667, 1, "계단위", "도보",
      node2X: 1576,
      node2Y: 2526,
      isInside2: 3,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 3층 오른쪽 계단 앞", "다향관 3층 오른쪽 계단", 4.7619, 0.3, "계단아래", "도보");
  //648
  graph.addEdge("다향관 3층 오른쪽 계단 앞", "다향관 3층 오른쪽 입구", 1.60441, 0.106961, "평지", "도보");
  graph.addEdge("다향관 3층 오른쪽 입구", "다향관 3층 오른쪽 계단 앞", 1.60441, 0.106961, "평지", "도보");
  //649
  graph.addEdge("다향관 3층 왼쪽 계단 입구", "다향관 3층 왼쪽 계단 입구 안", 2.16744, 0.144496, "평지", "도보",
      node2X: 1358,
      node2Y: 2435,
      isInside2: 3,
      building2: "다향관",
      showRoute2: false);
  graph.addEdge("다향관 3층 왼쪽 계단 입구 안", "다향관 3층 왼쪽 계단 입구", 2.16744, 0.144496, "평지", "도보");
  //650
  graph.addEdge("다향관 3층 왼쪽 계단 입구 안", "다향관 3층 왼쪽 계단", 2.71449, 0.180966, "평지", "도보");
  graph.addEdge("다향관 3층 왼쪽 계단", "다향관 3층 왼쪽 계단 입구 안", 2.71449, 0.180966, "평지", "도보");
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
  // 만해광장
  graph.addEdge("만해광장 중앙", "만해광장", 100000, 100000, "평지", "도보",
      node2X: 1122,
      node2Y: 2043,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("만해광장", "만해광장 중앙", 100000, 100000, "평지", "도보");
  //정문
  graph.addEdge("정문 앞", "정문", 100000, 100000, "평지", "차도",
      node2X: 2380,
      node2Y: 3389,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("정문", "정문 앞", 100000, 100000, "평지", "차도");
  //후문
  graph.addEdge("후문 앞", "후문", 100000, 100000, "평지", "도보",
      node2X: 1114,
      node2Y: 1576,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("후문", "후문 앞", 100000, 100000, "평지", "도보");
  //충무로 방향 입구
  graph.addEdge("충무로쪽 입구", "충무로 방향 입구", 100000, 100000, "내리막", "도보",
      node2X: 574,
      node2Y: 2552,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("충무로 방향 입구", "충무로쪽 입구", 100000, 100000, "오르막", "도보");
  //동대입구 방향 입구
  graph.addEdge("동대입구", "동대입구 방향 입구", 100000, 100000, "평지", "도보",
      node2X: 2587,
      node2Y: 2426,
      isInside2: 0,
      building2: "실외",
      showRoute2: true);
  graph.addEdge("동대입구 방향 입구", "동대입구", 100000, 100000, "평지", "도보");
  //346
  graph.addEdge("듀이카쪽 학교 입구", "DUICA쪽 입구", 100000, 100000, "평지", "도보",
      node2X: 1625,
      node2Y: 1936,
      isInside2: 0,
      building2: "실외",
      showRoute2: false);
  graph.addEdge("DUICA쪽 입구", "듀이카쪽 학교 입구", 100000, 100000, "평지", "도보");

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

  for (Edge edge in newGraph.edges){
    edge.time_weight /= 6;
  }
  print('nodes: ${newGraph.nodes}');
  return newGraph;
}