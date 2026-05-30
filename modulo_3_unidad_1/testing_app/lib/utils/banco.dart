class Banco {
  double _saldo = 1000;  

  double consultarSaldo() {
    return _saldo;
  }

  void depositar(double monto){
    if (monto > 0) {
      _saldo += monto;
    } 
  }

  void retirar(double monto){
    if(monto > 0 && monto <= _saldo) {
      _saldo -= monto;
    } else {
      print('Monto de retiro inválido.');
    }
  }
}