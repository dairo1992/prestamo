class FuncionesGenericas {
  String numberFormat(String value) {
    var num = value.replaceAll(RegExp(r'[^0-9]'), '');
    return num == "" ? '0' : num;
  }
}
