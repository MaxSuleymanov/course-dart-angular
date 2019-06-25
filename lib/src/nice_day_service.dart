class NiceDayService {
  int _count = 0;
  String wish() {
    _count++;
    //print('nice day service ' + _count.toString());
    return 'Have a nice day!';
  }
}
