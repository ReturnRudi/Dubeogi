import 'package:flutter/material.dart';

// BuildingInfo class 사용하기 위해 필요한 변수들
//다향관 명진관 과학관 대운동장앞 법학관 혜화관 경영관 사회과학관 문화관 학술관
// 이용시간?
// 전화번호
// 편의시설정보...

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
    name: '다향관',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),
  BuildingInfoDetail(
    name: '명진관',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),BuildingInfoDetail(
    name: '과학관',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),BuildingInfoDetail(
    name: '대운동장앞',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),BuildingInfoDetail(
    name: '법학관',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),BuildingInfoDetail(
    name: '혜화관',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),BuildingInfoDetail(
    name: '경영관',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),BuildingInfoDetail(
    name: '사회과학관',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),BuildingInfoDetail(
    name: '문화관',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),BuildingInfoDetail(
    name: '학술관',
    teleNumber: '010-1234-5678',
    operatingHours: '09:00 - 18:00',
    amenities: [
      Amenity(icon: Icon(Icons.shower), name: '샤워실 1', description: '샤워실 설명 1'),
      Amenity(icon: Icon(Icons.local_drink), name: '자판기 1', description: '자판기 설명 1'),
      // ... 다른 시설 정보들
    ],
  ),
];




