class Validator{
  bool emailValido(String email){
    return email.contains('@');
  }

  bool passwordValiido(String pass){
    return pass.length >= 6;
  }
}