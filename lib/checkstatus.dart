checkStatus(Map board, String icon) {
  List tic = [];
  board.forEach((key, value) {
    if (value == icon) {
      tic = [...tic, int.parse(key)];
    }
  });
  print(tic);
  if (tic.contains(1) && tic.contains(2) && tic.contains(3)) {
    return "horiz1";
  } else if (tic.contains(4) && tic.contains(5) && tic.contains(6)) {
    return "horiz2";
  } else if (tic.contains(7) && tic.contains(8) && tic.contains(9)) {
    return "horiz3";
  } else if (tic.contains(1) && tic.contains(4) && tic.contains(7)) {
    return "vert1";
  } else if (tic.contains(2) && tic.contains(5) && tic.contains(8)) {
    return "vert2";
  } else if (tic.contains(3) && tic.contains(6) && tic.contains(9)) {
    return "vert3";
  } else if (tic.contains(3) && tic.contains(5) && tic.contains(7)) {
    return "slash";
  } else if (tic.contains(1) && tic.contains(5) && tic.contains(9)) {
    return "backslash";
  } else {
    return "null";
  }
}
