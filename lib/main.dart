// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/checkstatus.dart';
import 'package:tictactoe/confetti.dart';

void main() {
  runApp(const MaterialApp(
    title: "TicT ac Toe",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map crosses = {
    "horiz1": false,
    "horiz2": false,
    "horiz3": false,
    "vert1": false,
    "vert2": false,
    "vert3": false,
    "slash": false,
    "backslash": false,
    "null": true
  };

  String youricon = "cross";

  Map board = {
    "1": "not",
    "2": "not",
    "3": "not",
    "4": "not",
    "5": "not",
    "6": "not",
    "7": "not",
    "8": "not",
    "9": "not",
  };
  int yourscore = 0;
  int oppscore = 0;
  bool isDim = false;
  bool playgame = true;
  bool isPop = false;
  won() async {
    setState(() {
      yourscore++;
    });
    print("You won");
    setState(() {
      isPop = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isPop = false;
      board = {
        "1": "not",
        "2": "not",
        "3": "not",
        "4": "not",
        "5": "not",
        "6": "not",
        "7": "not",
        "8": "not",
        "9": "not",
      };

      crosses = {
        "horiz1": false,
        "horiz2": false,
        "horiz3": false,
        "vert1": false,
        "vert2": false,
        "vert3": false,
        "slash": false,
        "backslash": false,
        "null": true
      };
      playgame = true;
    });
  }

  lose() async {
    setState(() {
      oppscore++;
      isDim = true;
      playgame = false;
    });
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isDim = false;
      board = {
        "1": "not",
        "2": "not",
        "3": "not",
        "4": "not",
        "5": "not",
        "6": "not",
        "7": "not",
        "8": "not",
        "9": "not",
      };

      crosses = {
        "horiz1": false,
        "horiz2": false,
        "horiz3": false,
        "vert1": false,
        "vert2": false,
        "vert3": false,
        "slash": false,
        "backslash": false,
        "null": true
      };
      playgame = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
      duration: Duration(milliseconds: 600),
      width: double.infinity,
      height: double.infinity,
      color: isDim ? Colors.redAccent : Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text("$yourscore",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Opp",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text("$oppscore",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Opponent Scored",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 600),
                            opacity: (crosses["horiz1"]) ? 1 : 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 1 / 3,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 600),
                            opacity: (crosses["horiz2"]) ? 1 : 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 1 / 3,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 600),
                            opacity: (crosses["horiz3"]) ? 1 : 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 1 / 3,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 600),
                            opacity: (crosses["vert1"]) ? 1 : 0,
                            child: Container(
                              height: MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 1 / 3,
                              width: 5,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 600),
                            opacity: (crosses["vert2"]) ? 1 : 0,
                            child: Container(
                              height: MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 1 / 3,
                              width: 5,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 600),
                            opacity: (crosses["vert3"]) ? 1 : 0,
                            child: Container(
                              height: MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 1 / 3,
                              width: 5,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: (crosses["slash"]) ? 1 : 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform(
                              alignment: FractionalOffset.center,
                              transform: Matrix4.identity()
                                ..rotateZ(45 * 3.1415927 / 180),
                              child: Container(
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: (crosses["backslash"]) ? 1 : 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform(
                              alignment: FractionalOffset.center,
                              transform: Matrix4.identity()
                                ..rotateZ(-45 * 3.1415927 / 180),
                              child: Container(
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                child: IconButton(
                                  iconSize: 60,
                                  onPressed: () {
                                    if (board["1"] == "not" && playgame) {
                                      SystemSound.play(SystemSoundType.click);
                                      setState(() {
                                        board["1"] = youricon;
                                        crosses[checkStatus(board, youricon)] =
                                            true;
                                        if (checkStatus(board, youricon) !=
                                            "null") {
                                          setState(() {
                                            playgame = false;
                                            won();
                                          });
                                        }
                                      });
                                    }
                                  },
                                  icon: returnIcon(board["1"]),
                                ),
                              ),
                              IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  if (board["2"] == "not" && playgame) {
                                    SystemSound.play(SystemSoundType.click);
                                    setState(() {
                                      board["2"] = youricon;
                                      crosses[checkStatus(board, youricon)] =
                                          true;
                                      if (checkStatus(board, youricon) !=
                                          "null") {
                                        setState(() {
                                          playgame = false;
                                          won();
                                        });
                                      }
                                    });
                                  }
                                },
                                icon: returnIcon(board["2"]),
                              ),
                              IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  if (board["3"] == "not" && playgame) {
                                    SystemSound.play(SystemSoundType.click);
                                    setState(() {
                                      board["3"] = youricon;
                                      crosses[checkStatus(board, youricon)] =
                                          true;
                                      if (checkStatus(board, youricon) !=
                                          "null") {
                                        setState(() {
                                          playgame = false;
                                          won();
                                        });
                                      }
                                    });
                                  }
                                },
                                icon: returnIcon(board["3"]),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  if (board["4"] == "not" && playgame) {
                                    SystemSound.play(SystemSoundType.click);
                                    setState(() {
                                      board["4"] = youricon;
                                      crosses[checkStatus(board, youricon)] =
                                          true;
                                      if (checkStatus(board, youricon) !=
                                          "null") {
                                        setState(() {
                                          playgame = false;
                                          won();
                                        });
                                      }
                                    });
                                  }
                                },
                                icon: returnIcon(board["4"]),
                              ),
                              IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  if (board["5"] == "not" && playgame) {
                                    SystemSound.play(SystemSoundType.click);
                                    setState(() {
                                      board["5"] = youricon;
                                      crosses[checkStatus(board, youricon)] =
                                          true;
                                      if (checkStatus(board, youricon) !=
                                          "null") {
                                        setState(() {
                                          playgame = false;
                                          won();
                                        });
                                      }
                                    });
                                  }
                                },
                                icon: returnIcon(board["5"]),
                              ),
                              IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  if (board["6"] == "not" && playgame) {
                                    SystemSound.play(SystemSoundType.click);
                                    setState(() {
                                      board["6"] = youricon;
                                      crosses[checkStatus(board, youricon)] =
                                          true;
                                      if (checkStatus(board, youricon) !=
                                          "null") {
                                        setState(() {
                                          playgame = false;
                                          won();
                                        });
                                      }
                                    });
                                  }
                                },
                                icon: returnIcon(board["6"]),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  if (board["7"] == "not" && playgame) {
                                    SystemSound.play(SystemSoundType.click);
                                    setState(() {
                                      board["7"] = youricon;
                                      crosses[checkStatus(board, youricon)] =
                                          true;
                                      if (checkStatus(board, youricon) !=
                                          "null") {
                                        setState(() {
                                          playgame = false;
                                          won();
                                        });
                                      }
                                    });
                                  }
                                },
                                icon: returnIcon(board["7"]),
                              ),
                              IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  if (board["8"] == "not" && playgame) {
                                    SystemSound.play(SystemSoundType.click);
                                    setState(() {
                                      board["8"] = youricon;
                                      crosses[checkStatus(board, youricon)] =
                                          true;
                                      if (checkStatus(board, youricon) !=
                                          "null") {
                                        setState(() {
                                          playgame = false;
                                          won();
                                        });
                                      }
                                    });
                                  }
                                },
                                icon: returnIcon(board["8"]),
                              ),
                              IconButton(
                                iconSize: 60,
                                onPressed: () {
                                  if (board["9"] == "not" && playgame) {
                                    SystemSound.play(SystemSoundType.click);
                                    setState(() {
                                      board["9"] = youricon;
                                      crosses[checkStatus(board, youricon)] =
                                          true;
                                      if (checkStatus(board, youricon) !=
                                          "null") {
                                        setState(() {
                                          playgame = false;
                                          won();
                                        });
                                      }
                                    });
                                  }
                                },
                                icon: returnIcon(board["9"]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          lose();
                        },
                        child: Text("Lose")),
                    AnimatedOpacity(
                      opacity: isPop ? 1 : 0,
                      duration: Duration(milliseconds: 700),
                      child: ConfettiSample(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget returnIcon(String word) {
    if (word == "tic") {
      return Icon(Icons.check);
    } else if (word == "cross") {
      return Icon(Icons.close);
    } else {
      return Text("");
    }
  }
}
