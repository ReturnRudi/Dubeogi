import 'package:tuple/tuple.dart';
import 'package:collection/collection.dart';

class Node {
  final String name;
  final double x, y;
  final int isInside;
  final String building;
  final bool showRoute;

  Node(this.name, this.x, this.y, this.isInside, this.building, this.showRoute);

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Node && other.name == name && other.x == x && other.y == y;
  }

  @override
  int get hashCode => name.hashCode ^ x.hashCode ^ y.hashCode;
}

class Edge {
  Node node1, node2;
  double time_weight;
  double comfy_weight;
  String type;
  String edgeAttribute;

  Edge(this.node1, this.node2, this.time_weight, this.comfy_weight, this.type, this.edgeAttribute);
}

class Graph {
  List<Node> nodes = [];
  List<Edge> edges = [];

  void addNode(String name, double x, double y, int inside, String building, bool showRoute) {
    nodes.add(Node(name, x, y, inside, building, showRoute));
  }

  Node findNode(String name) {
    return nodes.firstWhere((node) => node.name == name, orElse: () => throw Exception("Node not found"));
  }

  void addEdge(String node1Name, String node2Name, double weight1, double weight2, String type, String edgeAttribute, {double? node1X = null, double? node1Y = null, int? isInside1 = null, double? node2X = null, double? node2Y = null, int? isInside2 = null, String? building1 = null, String? building2 = null, bool? showRoute1 = null, bool? showRoute2 = null}) {
    if (!nodeExists(node1Name) && node1X != null && node1Y != null && isInside1 != null && building1 != null && showRoute1 != null) {
      addNode(node1Name, node1X, node1Y, isInside1, building1, showRoute1);
    }
    if (!nodeExists(node2Name) && node2X != null && node2Y != null && isInside2 != null && building2 != null && showRoute2 != null) {
      addNode(node2Name, node2X, node2Y, isInside2, building2, showRoute2);
    }
    Node node1 = findNode(node1Name);
    Node node2 = findNode(node2Name);
    edges.add(Edge(node1, node2, weight1, weight2, type, edgeAttribute));
  }



  int findNodeIndex(List<Node> nodes, String targetNodeName) {
    for (int i = 0; i < nodes.length; ++i) {
      if (nodes[i].name == targetNodeName) {
        return i;
      }
    }
    return -1;
  }

  Graph excludeEdgesByType(String type) {
    Graph newGraph = Graph();
    newGraph.nodes = List.from(nodes);

    for (final edge in edges) {
      if (edge.type != type) {
        newGraph.edges.add(edge);
      }
    }

    return newGraph;
  }

  Graph includeEdgesByType(String type) { //도보/차도만 존재하는 그래프 생성 메소드
    Graph newGraph = Graph();

    for (final edge in edges) {
      if (edge.edgeAttribute == type) {
        newGraph.edges.add(edge);
        // Add nodes connected by the edge if they are not already in the list
        if (!newGraph.nodeExists(edge.node1.name)) {
          newGraph.nodes.add(edge.node1);
        }
        if (!newGraph.nodeExists(edge.node2.name)) {
          newGraph.nodes.add(edge.node2);
        }
      }
    }

    return newGraph;
  }

  Graph filterEdges(String requiredAttribute) {
    Graph newGraph = Graph();
    newGraph.nodes = List.from(nodes);

    for (final edge in edges) {
      if (edge.edgeAttribute == requiredAttribute) {
        newGraph.edges.add(edge);
      }
    }

    return newGraph;
  }

  bool nodeExists(String name) {
    return nodes.any((node) => node.name == name);
  }

  Edge? findEdge(String node1Name, String node2Name) {
    for (Edge edge in edges) {
      if ((edge.node1.name == node1Name && edge.node2.name == node2Name)) {
        return edge;
      }
    }
    return null;  // return null if no edge found
  }

  void removeNode(String name) {
    nodes.removeWhere((node) => node.name == name);
    edges.removeWhere((edge) => edge.node1.name == name || edge.node2.name == name);
  }

  // A* algorithm
/*  Tuple2<List<double>, List<int>> aStar(List<Node> nodes, List<Edge> edges, Node start, Node end) {
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

          double candidateDist = dist[currentNode] + edge.time_weight;

          if (candidateDist < dist[nextNode]) {
            dist[nextNode] = candidateDist;
            prev[nextNode] = currentNode;
            pq.add(Tuple2<double, int>(candidateDist, nextNode));
          }
        }
      }
    }

    return Tuple2<List<double>, List<int>>(dist, prev);
  }*/
  Tuple2<List<double>, List<int>> aStar(List<Node> nodes, List<Edge> edges, Node start, Node end, String weight_select) {
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

          double weight = weight_select == "최단" ? edge.time_weight : edge.comfy_weight; // Select weight based on useTimeWeight

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

List<Node> reconstructPath(
    //Astar 결과 지나온 노드들을 반대로 돌아가면서 경로를 path 리스트에 저장한 후 reverse를 통해 경로 순서대로 재배치한다.
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
