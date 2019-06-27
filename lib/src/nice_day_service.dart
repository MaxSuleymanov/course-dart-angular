class NiceDayService {
  int _count = 0;
  String wish() {
    _count++;
    return 'Day №$_count. Have a nice day!';
    //return 'Have a nice day!';
  }
}
