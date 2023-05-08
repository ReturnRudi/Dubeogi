// BuildingInfo class 사용하기 위해 필요한 변수들

//다향관 명진관 과학관 대운동장앞 법학관 혜화관 경영관 사회과학관 문화관 학술관
// 이용시간?
// 전화번호
// 편의시설정보...



class BuildingInfoDetails {

  final List<dynamic> amens; // Icon_path, 내용, 세부내용

  const BuildingInfoDetails({
    required this.amens,
  });
}

BuildingInfoDetails b1 = const BuildingInfoDetails(

  amens:[
    [0,'전화번호',1234],
    [1,'샤워실1',3],
    [2,'자판기',3],
    [0,'샤워실58',12],
  ]
);

BuildingInfoDetails b2 = const BuildingInfoDetails(
    amens:[
      [0,'전화번호',5678],
      [1,'샤워실372',372],
      [2,'자판기기',30],
      [0,'샤워실58',13],
    ]
);
