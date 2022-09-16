
import 'dart:math';

class Safe {
  final int _size;
  late List<List<bool>> _map;
  Safe(this._size,bool value) {
    _map = List.generate(_size, (index) => List.filled(_size, value)) ;
  }

  int getSize() => _size;
  bool getCell(int x, int y) => _map[x][y];
  void setCell(int x,int y, bool value) => _setMethod(x, y, value);
  void _setMethod(int x, int y, bool value) => _map[y][x] = value;

  bool isWin() {
    Set<bool> objects = <bool>{};
    for(List<bool> row in _map) {
      objects.addAll(row);
    }
    return objects.length == 1;
  }

  @override
  String toString() {
    String str = "";
    for (final row in _map) {
      for(final cell in row){
        str += "${cell?1:0}\t";
      }
      str += "\n";
    }
    return str;
  }
}
extension MapGeneration on Safe{
  void generation(int iteration)
  {
    var rng = Random(DateTime.now().millisecondsSinceEpoch);
    for(int i = 0; i < iteration; i++){
      int x = rng.nextInt(_map.length);
      int y = rng.nextInt(_map.length);
      bool value = rng.nextBool();
      setCell(x, y, value);
    }
  }
}
class SafeGame extends Safe {
  SafeGame(int size) : super(size, Random(DateTime.now().millisecondsSinceEpoch).nextBool());

  @override
  _setMethod(int x, int y, bool value) {
    for(int i = 0; i < _map.length; i++){//change horizontal
      _map[i][y] = !_map[i][y];
    }
    for(int i = 0; i < _map.length; i++){//change vertical
      _map[x][i] = !_map[x][i];
    }
    _map[x][y] = !_map[x][y];
  }
}