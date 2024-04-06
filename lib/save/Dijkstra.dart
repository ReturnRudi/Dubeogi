import 'package:tuple/tuple.dart';
import 'package:collection/collection.dart';

class Node {
  final String name;        // 노드 이름
  final double x, y;        // 노드 좌표(이미지 픽셀)
  final int isInside;       // 노드 층 수 (0이면 야외)
  final String building;    // 노드가 포함된 빌딩 이름 (야외 노드는 "실외")
  final bool showDetail;    // 길 상세 안내에 표시될 노드는 true

  Node(this.name, this.x, this.y, this.isInside, this.building, this.showDetail);

  @override
  String toString() => name;

  // 노드와 노드를 비교하기 위해 '==' 를 오버로딩
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Node && other.name == name && other.x == x && other.y == y;
  }

  @override
  int get hashCode => name.hashCode ^ x.hashCode ^ y.hashCode;
}

class Edge {
  Node node1, node2;      // 연결될 2개의 노드
  double sec_weight;      // 엣지의 소요 시간
  double kcal_weight;     // 엣지의 소모 칼로리
  String type;            // 엣지의 타입 ( 오르막, 내리막, 평지, 계단위, 계단아래, 엘베 )
  bool isRoad;            // 엣지의 차도 여부

  Edge(this.node1, this.node2, this.sec_weight, this.kcal_weight, this.type, this.isRoad);
}

class Graph {
  List<Node> nodes = [];
  List<Edge> edges = [];

  // 그래프에 노드를 추가하는 addNode
  void addNode(String name, double x, double y, int inside, String building, bool showRoute) {
    nodes.add(Node(name, x, y, inside, building, showRoute));
  }

  // 그래프 내에 특정 이름을 가진 노드가 존재하는지 찾아 반환해 주는 findNode
  Node findNode(String name) {
    return nodes.firstWhere((node) => node.name == name, orElse: () => throw Exception("Node not found"));
  }

  // 그래프 내에 엣지를 추가하는 addEdge ( 만약 노드가 없다면 노드도 자동으로 추가하도록 했다 )
  void addEdge(String node1Name, String node2Name, double weight1, double weight2, String type, bool isRoad, {double? node1X, double? node1Y, int? isInside1, double? node2X, double? node2Y, int? isInside2, String? building1, String? building2, bool? showRoute1, bool? showRoute2}) {
    if (!nodeExists(node1Name) && node1X != null && node1Y != null && isInside1 != null && building1 != null && showRoute1 != null) {
      addNode(node1Name, node1X, node1Y, isInside1, building1, showRoute1);
    }
    if (!nodeExists(node2Name) && node2X != null && node2Y != null && isInside2 != null && building2 != null && showRoute2 != null) {
      addNode(node2Name, node2X, node2Y, isInside2, building2, showRoute2);
    }
    Node node1 = findNode(node1Name);
    Node node2 = findNode(node2Name);
    edges.add(Edge(node1, node2, weight1, weight2, type, isRoad));
  }

  // 그래프 내에 특정 노드를 찾아 노드의 인덱스를 반환하는 findNodeIndex
  int findNodeIndex(List<Node> nodes, String targetNodeName) {
    for (int i = 0; i < nodes.length; ++i) {
      if (nodes[i].name == targetNodeName) {
        return i;
      }
    }
    return -1;
  }

  // 그래프 내에 특정 노드가 존재하는지 확인하는 nodeExists
  bool nodeExists(String name) {
    return nodes.any((node) => node.name == name);
  }

  // 그래프 내에 어떤 두 노드를 잇는 엣지가 존재하는지 찾아 반환해 주는 findEdge
  Edge? findEdge(String node1Name, String node2Name) {
    for (Edge edge in edges) {
      if ((edge.node1.name == node1Name && edge.node2.name == node2Name)) {
        return edge;
      }
    }
    return null;
  }

  // 그래프 내에 특정 노드를 삭제해주는 removeNode
  void removeNode(String name) {
    nodes.removeWhere((node) => node.name == name);
    edges.removeWhere((edge) => edge.node1.name == name || edge.node2.name == name);
  }

  // Dijkstra 알고리즘 함수 Dijkstra, 결과로 최단 거리 배열 dist와 이전 노드 배열 prev를 반환한다.
  Tuple2<List<double>, List<int>> Dijkstra(List<Node> nodes, List<Edge> edges, Node start, Node end, String weightSelect) {
    int startIndex = findNodeIndex(nodes, start.name);
    int endIndex = findNodeIndex(nodes, end.name);

    List<double> dist = List<double>.filled(nodes.length, double.infinity);
    List<int> prev = List<int>.filled(nodes.length, -1);

    dist[startIndex] = 0;

    PriorityQueue<Tuple2<double, int>> pq = PriorityQueue<Tuple2<double, int>>(
          (a, b) => a.item1.compareTo(b.item1),
    );

    pq.add(Tuple2<double, int>(0, startIndex));

    while (pq.isNotEmpty) {
      Tuple2<double, int> currentPair = pq.removeFirst();
      double currentDist = currentPair.item1;
      int currentNode = currentPair.item2;

      if (currentNode == endIndex) {
        break;
      }

      if (currentDist > dist[currentNode]) {
        continue;
      }

      for (Edge edge in edges) {
        if (edge.node1.name == nodes[currentNode].name) {
          int nextNode;
          nextNode = findNodeIndex(nodes, edge.node2.name);

          double weight = weightSelect == "최단" ? edge.sec_weight : edge.kcal_weight;

          double candidateDist = dist[currentNode] + weight;

          if (candidateDist < dist[nextNode]) {
            dist[nextNode] = candidateDist;
            prev[nextNode] = currentNode;
            pq.add(Tuple2<double, int>(dist[nextNode], nextNode));
          }
        }
      }
    }

    return Tuple2<List<double>, List<int>>(dist, prev);
  }
}

// Dijkstra 결과 dist와 prev를 기반으로 반대로 돌아가면서 경로를 path 리스트에 저장한 후 reverse를 통해 경로 순서대로 재배치하는 함수 reconstructPath
List<Node> reconstructPath(
    List<int> prev,
    List<Node> nodes,
    int startIndex,
    int endIndex) {
  List<Node> path = [];
  int currentNode = endIndex;

  while (currentNode != startIndex) {
    path.add(nodes[currentNode]);
    currentNode = prev[currentNode];
    if (currentNode == -1) {
      break;
    }
  }

  if (currentNode == startIndex) {
    path.add(nodes[startIndex]);
  }

  path = path.reversed.toList();
  return path;
}
