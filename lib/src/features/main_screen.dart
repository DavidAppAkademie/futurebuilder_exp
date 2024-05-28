import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // State
  int? tnCount;
  late Future<int?> tnCountFuture;

  @override
  void initState() {
    super.initState();
    // starte mit der Bearbeitung bzw. dem Auspacken des Pakets
    tnCountFuture = getTeilnehmerCount(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: tnCountFuture,
              builder: (context, snapshot) {
                /* 
                1. Uncompleted (Ladend)
                2. Completed with data (Fertig)
                3. Completed with error (Fehler)
                 */

                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  // FALL: Future ist komplett und hat Daten!
                  return Text("Die TN Anzahl ist: ${snapshot.data}");
                } else if (snapshot.connectionState != ConnectionState.done) {
                  // FALL: Sind noch im Ladezustand
                  return const CircularProgressIndicator();
                } else {
                  // FALL: Es gab nen Fehler
                  return const Icon(Icons.error);
                }
              },
            ),
            FilledButton(
              onPressed: () async {
                tnCount = await tnCountFuture;

                // baue die Build methode neu
                setState(() {});
              },
              child: const Text("Los!"),
            ),
          ],
        ),
      ),
    );
  }

  Future<int?> getTeilnehmerCount(int batchNumber) async {
    // simuliere Datenbankanfrage Dauer...
    await Future.delayed(const Duration(seconds: 3));

    // // simuliere fehler
    // throw Exception();

    if (batchNumber < 1) {
      return null;
    }
    if (batchNumber > 7) {
      return null;
    }
    if (batchNumber == 7) {
      return 20;
    }
    if (batchNumber == 6) {
      return 18;
    }
    if (batchNumber == 5) {
      return 24;
    }
    if (batchNumber == 4) {
      return 20;
    }
    if (batchNumber == 3) {
      return 35;
    }
    if (batchNumber == 2) {
      return 30;
    }
    if (batchNumber == 1) {
      return 33;
    }
    return null;
  }
}
