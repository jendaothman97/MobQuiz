import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final db = FirebaseFirestore.instance;

  int q1 = 0;
  int q2 = 0;
  int q3 = 0;
  int score = 0;

  Future submitResult(score) async {
    var collection = FirebaseFirestore.instance.collection('leaderboard');
    var user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print("please sign in first");
      return;
    }

    if (q1 == 1) {
      score += 10;
    }
    if (q2 == 1) {
      score += 10;
    }
    if (q3 == 2) {
      score += 10;
    }
    print("ur score is ${score}");

    setState(() {
      q1 = q2 = q3 = 0;
    });

    Map<String, dynamic> data = {"user_name": user.displayName, "score": score};

    try {
      await collection.doc(user.uid).set(data);
    } catch (e) {
      print("Error, couldnt save result in database");
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('MobQuiz'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 10.0),
                              child: Text(
                                '1 + 1 = ?',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('2'),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: q1,
                            activeColor: Colors.purpleAccent,
                            // Change the active radio button color here
                            fillColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            // Change the fill color when selected
                            splashRadius: 20,
                            // Change the splash radius when clicked
                            onChanged: (value) {
                              setState(() {
                                q1 = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          minVerticalPadding: 0,
                          title: const Text('4'),
                          leading: Radio<int>(
                            value: 2,
                            groupValue: q1,
                            activeColor: Colors.purpleAccent,
                            fillColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            splashRadius: 25,
                            onChanged: (value) {
                              setState(() {
                                q1 = value!;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 10.0),
                              child: Text(
                                '2 + 2 = ?',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('4'),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: q2,
                            activeColor: Colors.purpleAccent,
                            fillColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            splashRadius: 20,
                            onChanged: (value) {
                              setState(() {
                                q2 = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('9'),
                          leading: Radio<int>(
                            value: 2,
                            groupValue: q2,
                            activeColor: Colors.purpleAccent,
                            fillColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            splashRadius: 25,
                            onChanged: (value) {
                              setState(() {
                                q2 = value!;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 10.0),
                              child: Text(
                                '3 + 3 = ?',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('7'),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: q3,
                            activeColor: Colors.purpleAccent,
                            fillColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            splashRadius: 20,
                            onChanged: (value) {
                              setState(() {
                                q3 = value!;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('6'),
                          leading: Radio<int>(
                            value: 2,
                            groupValue: q3,
                            activeColor: Colors.purpleAccent,
                            fillColor:
                                MaterialStateProperty.all(Colors.purpleAccent),
                            splashRadius: 25,
                            onChanged: (value) {
                              setState(() {
                                q3 = value!;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //Submit Button
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                    ),
                    onPressed: () async {
                      await submitResult(0);
                      var result = await db
                          .collection('leaderboard')
                          .orderBy('score', descending: true)
                          .get();

                      result.docs.forEach((res) {
                        print(res.get('score'));
                      });
                    },
                    child: const Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
