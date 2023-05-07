import 'dart:ui';
import 'package:tuple/tuple.dart';
import 'package:collection/collection.dart';

class Node {
  final String name;
  final double x, y;
  final bool isInside;
  final String building;

  Node(this.name, this.x, this.y, this.isInside, this.building);

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
  int weight;
  String type;
  String edgeAttribute;

  Edge(this.node1, this.node2, this.weight, this.type, this.edgeAttribute);
}

class Graph {
  List<Node> nodes = [];
  List<Edge> edges = [];

  void addNode(String name, double x, double y, bool inside, String building) {
    nodes.add(Node(name, x, y, inside, building));
  }

  Node findNode(String name) {
    return nodes.firstWhere((node) => node.name == name, orElse: () => throw Exception("Node not found"));
  }

  void addEdge(String node1Name, String node2Name, int weight, String type, String edgeAttribute, {double? node1X = null, double? node1Y = null, bool? inside1 = null, double? node2X = null, double? node2Y = null, bool? inside2 = null, String? building1 = null, String? building2 = null}) {
    if (!nodeExists(node1Name) && node1X != null && node1Y != null && inside1 != null && building1 != null) {
      addNode(node1Name, node1X, node1Y, inside1, building1);
    }
    if (!nodeExists(node2Name) && node2X != null && node2Y != null && inside2 != null && building2 != null) {
      addNode(node2Name, node2X, node2Y, inside2, building2);
    }
    Node node1 = findNode(node1Name);
    Node node2 = findNode(node2Name);
    edges.add(Edge(node1, node2, weight, type, edgeAttribute));
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

  // A* algorithm
  Tuple2<List<int>, List<int>> aStar(List<Node> nodes, List<Edge> edges, Node start, Node end) {
    int startIndex = findNodeIndex(nodes, start.name);
    int endIndex = findNodeIndex(nodes, end.name);

    List<int> dist = List<int>.filled(nodes.length, 1 << 32);
    List<int> prev = List<int>.filled(nodes.length, -1);

    dist[startIndex] = 0;

    PriorityQueue<Tuple2<int, int>> pq = PriorityQueue<Tuple2<int, int>>(
          (a, b) => a.item1.compareTo(b.item1),
    );

    pq.add(Tuple2<int, int>(0, startIndex));

    while (pq.isNotEmpty) {
      Tuple2<int, int> currentPair = pq.removeFirst();
      int currentDist = currentPair.item1;
      int currentNode = currentPair.item2;

      if (currentNode == endIndex) {
        break;
      }

      if (currentDist > dist[currentNode]) {
        continue;
      }

      for (Edge edge in edges) {
        if (edge.node1.name == nodes[currentNode].name || edge.node2.name == nodes[currentNode].name) {
          int nextNode;
          if (edge.node1.name == nodes[currentNode].name) {
            nextNode = findNodeIndex(nodes, edge.node2.name);
          } else { // This should be an else block, not an if block
            nextNode = findNodeIndex(nodes, edge.node1.name);
          }

          int candidateDist = dist[currentNode] + edge.weight;

          if (candidateDist < dist[nextNode]) {
            dist[nextNode] = candidateDist;
            prev[nextNode] = currentNode;
            pq.add(Tuple2<int, int>(candidateDist, nextNode));
          }
        }
      }
    }

    return Tuple2<List<int>, List<int>>(dist, prev);
  }
}
