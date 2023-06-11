import 'package:flutter/material.dart';

class Amenity {
  Icon icon;
  String name;
  String description;

  Amenity({required this.icon, required this.name, required this.description});
}

class BuildingInfoDetail {
  String name;
  String teleNumber;
  String operatingHours;
  List<Amenity> amenities;

  BuildingInfoDetail({
    required this.name,
    required this.teleNumber,
    required this.operatingHours,
    required this.amenities,
  });
}

List<BuildingInfoDetail> BuildingInfoDetails = [
  BuildingInfoDetail(
    name: '사회과학관_경영관',
    teleNumber: '02-2260-3502(경영대 학사운영실)',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '1층, 2층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '2층, 3층'),
      Amenity(icon: Icon(Icons.monetization_on_rounded), name: 'ATM(신한)', description: '2층'),
      Amenity(icon: Icon(Icons.coffee), name: '카페(그루터기)', description: '야외'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '라운지(비즈마루)', description: '1층'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '라운지(MBA)', description: '2층'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '열람실(CPA반)', description: '5층'),
      Amenity(icon: Icon(Icons.park_sharp), name: '하늘마루', description: '6층'),
    ],
  ),
  BuildingInfoDetail(
    name: '과학관',
    teleNumber: '02-2260-8713(이과대 학사운영실)',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '1층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '1층'),
    ],
  ),
  BuildingInfoDetail(
    name: '다향관',
    teleNumber: '02-2260-8964(다향관 매점)',
    operatingHours: '08:00 - 18:30 / 주말 휴무',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실(남자)', description: '1층'),
      Amenity(icon: Icon(Icons.store), name: '매점', description: '1층'),
      Amenity(icon: Icon(Icons.edit), name: '문구점', description: '1층'),
      Amenity(icon: Icon(Icons.camera_alt_rounded), name: '사진관', description: '1층'),
      Amenity(icon: Icon(Icons.book_outlined), name: '서점', description: '1층'),
      Amenity(icon: Icon(Icons.chair), name: '야외 휴게실', description: '1층'),
    ],
  ),
  BuildingInfoDetail(
    name: '대운동장',
    teleNumber: '',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.not_interested), name: '시설 정보 없음', description: ''),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '법학관_만해관',
    teleNumber: '02-2260-3098(불교대학 학사운영실)',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '1층, 2층'),
      Amenity(icon: Icon(Icons.shower), name: '샤워실(남자)', description: '3층'),
      Amenity(icon: Icon(Icons.store), name: '매점(쿱스켓)', description: '2층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '1층, 2층'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '라운지', description: '3층'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '만해광장',
    teleNumber: '',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '단상 옆'),
      Amenity(icon: Icon(Icons.sports_basketball), name: '운동장', description: ''),
      Amenity(icon: Icon(Icons.star), name: '동우탑', description: ''),
    ],
  ),
  BuildingInfoDetail(
    name: '명진관',
    teleNumber: '02-2260-3756~7(문과대학 학사운영실)',
    operatingHours: '09:00 - 17:00',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '1층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '1층'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '라운지', description: '1층'),
    ],
  ),
  BuildingInfoDetail(
    name: '문화관',
    teleNumber: '02-2260-8752(예술대학 학사운영실)',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '1층, 3층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '1층'),
      Amenity(icon: Icon(Icons.store), name: '매점(쿱스켓)', description: '1층'),
      Amenity(icon: Icon(Icons.restaurant), name: '식당(가든쿡)', description: 'B1층'),
      Amenity(icon: Icon(Icons.coffee), name: '카페(두리터)', description: 'B1층'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '본관',
    teleNumber: '02-2260-3098(불교대학 학사운영실)',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '야외'),
      Amenity(icon: Icon(Icons.savings), name: '기념품점(가온누리)', description: '1층'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '상록원',
    teleNumber: '02-2260-8977',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.store), name: '매점(쿱스켓)', description: '1층'),
      Amenity(icon: Icon(Icons.monetization_on_rounded), name: 'ATM(국민)', description: '1층'),
      Amenity(icon: Icon(Icons.restaurant), name: '식당(솔앤누들)', description: '1층'),
      Amenity(icon: Icon(Icons.restaurant), name: '버거킹', description: '1층'),
      Amenity(icon: Icon(Icons.restaurant), name: '식당(학생식당)', description: '2층'),
      Amenity(icon: Icon(Icons.restaurant), name: '식당(교직원식당)', description: '3층'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '신공학관',
    teleNumber: '02-2260-3861(공과대학 학사운영실)',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '3층, 4층'),
      Amenity(icon: Icon(Icons.shower), name: '샤워실(남자)', description: '5층'),
      Amenity(icon: Icon(Icons.shower), name: '샤워실(여자)', description: '7층'),
      Amenity(icon: Icon(Icons.store), name: '매점(CU)', description: '1층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '3층, 9층'),
      Amenity(icon: Icon(Icons.monetization_on_rounded), name: 'ATM(신한)', description: '1층'),
      Amenity(icon: Icon(Icons.restaurant), name: '식당(아워홈)', description: '1층'),
      Amenity(icon: Icon(Icons.restaurant), name: '식당(탐나는 식탁)', description: '1층'),
      Amenity(icon: Icon(Icons.restaurant), name: '식당(아임카츠)', description: '1층'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '원흥관',
    teleNumber: '02-2260-3861(공과대학 학사운영실)',
    operatingHours: '연중무휴',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '1층 ~ 2층 계단, 3층, 4층 입구 앞'),
      Amenity(icon: Icon(Icons.shower), name: '샤워실(남자)', description: '3층'),
      Amenity(icon: Icon(Icons.shower), name: '샤워실(여자)', description: '3층'),
      Amenity(icon: Icon(Icons.store), name: '매점(쿱스켓)', description: '3층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '3층'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '라운지(i-space)', description: '3층'),
      Amenity(icon: Icon(Icons.monetization_on_rounded), name: 'ATM(신한)', description: '4층'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '정각원',
    teleNumber: '',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.not_interested_rounded), name: '시설 정보 없음', description: ''),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '정보문화관p',
    teleNumber: '',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '3층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '3층'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '정보문화관q',
    teleNumber: '',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '3층'),
    ],
  ),
  BuildingInfoDetail(
    name: '중앙도서관',
    teleNumber: '02-2260-8622~3 / 02-2260-3459~60',
    operatingHours: '09:00 - 21:00',
    amenities: [
      Amenity(icon: Icon(Icons.store), name: '매점(쿱스켓)', description: '4층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '3층'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '라운지(IF존)', description: '2층'),
    ],
  ),
  BuildingInfoDetail(
    name: '체육관',
    teleNumber: '02-2260-3481(사범대학 체육교육과)',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.not_interested_rounded), name: '시설 정보 없음', description: ''),
    ],
  ),
  BuildingInfoDetail(
    name: '학림관',
    teleNumber: '02_2260-3108~10(사범대학 학사운영실)',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '2층, 4층'),
      Amenity(icon: Icon(Icons.store), name: '매점(쿱스켓)', description: 'B1층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: 'B1층, 1층, 2층'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '라운지', description: '1층'),
      Amenity(icon: Icon(Icons.monetization_on_rounded), name: 'ATM(신한)', description: '1층'),
    ],
  ),
  BuildingInfoDetail(
    name: '학생회관',
    teleNumber: '',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '1층'),
      Amenity(icon: Icon(Icons.shower), name: '샤워실(남자)', description: '2층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '1층'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '라운지(i-space)', description: '1층'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '혜화관',
    teleNumber: '02-2260-8719(경찰사법대학 학사운영실)',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '1층'),
      Amenity(icon: Icon(Icons.shower), name: '샤워실(여자)', description: '1층'),
      Amenity(icon: Icon(Icons.store), name: '매점(쿱스켓)', description: '4층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '1층'),
      Amenity(icon: Icon(Icons.table_bar_rounded), name: '라운지', description: '2층'),
      Amenity(icon: Icon(Icons.monetization_on_rounded), name: 'ATM(국민)', description: '4층'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '학술관',
    teleNumber: '02-2260-3632~4(미래융합대학 학사운영실)',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.local_drink), name: '자판기', description: '3층'),
      Amenity(icon: Icon(Icons.print), name: '프린터', description: '1층'),
      Amenity(icon: Icon(Icons.coffee), name: '카페(카페두리터)', description: 'B1층'),
    ],
  ),
];