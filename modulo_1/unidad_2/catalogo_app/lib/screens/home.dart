import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'catalogo.dart';

/// Pantalla principal de la aplicación después del login
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de aplicación con título
      appBar: AppBar(
        title: Text(
          'Home',
          style: titleTextStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),

      /// Color de fondo de la pantalla
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(largeSpacing),
        child: Container(
          width: double.infinity,

          /// Ancho completo de la pantalla
          height: MediaQuery.of(context).size.height / 3,

          /// La altura se calcula como un tercio de la altura total de la pantalla usando MediaQuery
          padding: EdgeInsets.all(mediumSpacing),
          decoration: BoxDecoration(
            color: whiteColor, // Color blanco para el contenedor
            borderRadius: BorderRadius.circular(smallSpacing), // Bordes redondeados
          ),
          child: Column(
            /// Alinear el contenido desde arriba y a la izquierda
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Título de bienvenida
              Text(
                'Hola Fernando',
                style: headingTextStyle,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: mediumSpacing),

              /// Mensaje de confirmación de login
              Text(
                'Este es tu dashboard.',
                style: bodyTextStyle,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: largeSpacing),

              /// Botón para abrir el catálogo
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CatalogoScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                    vertical: mediumSpacing, // Altura del botón
                    horizontal: largeSpacing, // Ancho del botón
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonBorderRadius),
                  ),
                ),
                child: Text(
                  'Ver Catálogo',
                  style: titleTextStyle.copyWith(color: whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
