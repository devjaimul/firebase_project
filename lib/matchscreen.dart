
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test01/custom_card.dart';
import 'package:test01/entities.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  List<Cricket> matchList = [];

  @override
  void initState() {
    super.initState();
    fetchMatches();
  }

  Future<void> fetchMatches() async {
    final snapshot = await firebaseFireStore.collection('matches').get();
    final List<Cricket> loadedMatches = snapshot.docs.map((doc) {
      return Cricket(
        team1Name: doc['team1Name'],
        team2Name: doc['team2Name'],
        team1: doc['team1'],
        team2: doc['team2'],
        matchName: doc['matchName'],
      );
    }).toList();

    setState(() {
      matchList = loadedMatches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: matchList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: matchList.length,
        itemBuilder: (context, index) {
          return CustomCard(cricket: matchList[index]);
        },
      ),
    );
  }
}
