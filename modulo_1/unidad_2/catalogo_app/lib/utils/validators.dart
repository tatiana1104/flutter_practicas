class Validator {
  // Validación del email - correo electronico
  static String? email(String? value) { 

    // Validar si el valor es nulo o esta vacio
    if (value == null || value.isEmpty) return 'El correo es obligatorio';

    // Expresion regular para validar el formato del correo
    final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',);

    // si no cumple con el formato
    if (!emailRegExp.hasMatch(value)) return 'Formato de correo invalido'; 
    return null;
  }

  // validar contraseña
  static String? password(String? value) { 

    // si el valor es nulo o esta vacio
    if (value == null || value.isEmpty) return 'La contraseña es obligatoria'; 

    //Validar la longitud minima  caracteres
    if (value.length < 6) return 'Debe tener al menos 6 caracteres';

    //Validar que contenga al menos una Mayuscula
    // La expresion r'[A-Z]' buscar cualquier letra mayuscula del alfabeto ingles
    final hasUpperCase = RegExp(r'[A-Z]');

    // si no contiene ninguna mayuscula
    if (!hasUpperCase.hasMatch(value)) {
      return 'Debe contener al menos una letra mayuscula';
    }

    // Todo esta correcto
    return null;
  }

  
}
