import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Pantalla del catálogo de productos
class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de aplicación con título
      appBar: AppBar(
        title: Text(
          'Catálogo',
          style: titleTextStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),

      /// Color de fondo de la pantalla
      backgroundColor: backgroundColor, // Color de fondo general de la aplicación
       body: Padding(
        padding: EdgeInsets.all(mediumSpacing), // Padding general de la pantalla
        child: Column(
          children: [
            Container(
              width: double.infinity,/// Ancho completo de la pantalla
              height: 40.0, // Altura fija de la barra de búsqueda
              padding: EdgeInsets.all(smallSpacing), // Padding interno
              decoration: BoxDecoration(
                color: grayLight,
                borderRadius: BorderRadius.circular(smallSpacing), // Bordes redondeados
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: grayDark), // Icono de búsqueda
                  SizedBox(width: smallSpacing), // Espacio entre el icono y el texto
                  Text('Buscar productos...',
                    style: bodyTextStyle.copyWith(color: grayDark), // Estilo del texto
                  ),
                ],
              ),
            ),
            SizedBox(height: smallSpacing),
            Container(
              width: double.infinity,/// Ancho completo de la pantalla
              height: 31.0, // Altura fija de la barra de búsqueda
              child: Row(
                children: [
                  Container(
                    width: 54,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(largeSpacing), // Bordes redondeados
                    ),
                    child: Center(
                      child: Text('Todo',
                        style: bodyTextStyle.copyWith(color: whiteColor), // Estilo del texto
                      ),
                    ),
                  ),
                  SizedBox(width: smallSpacing),
                  Container(
                    width: 92,
                    decoration: BoxDecoration(
                      color: grayLight,
                      borderRadius: BorderRadius.circular(largeSpacing), // Bordes redondeados
                    ),
                    child: Center(
                      child: Text('Accesorios',
                        style: bodyTextStyle.copyWith(color: grayDark), // Estilo del texto
                      ),
                    ),
                  ),
                  SizedBox(width: smallSpacing),
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: grayLight,
                      borderRadius: BorderRadius.circular(largeSpacing), // Bordes redondeados
                    ),
                    child: Center(
                      child: Text('Motor',
                        style: bodyTextStyle.copyWith(color: grayDark), // Estilo del texto
                      ),
                    ),
                  ),
                  SizedBox(width: smallSpacing),
                  Container(
                    width: 68,
                    decoration: BoxDecoration(
                      color: grayLight,
                      borderRadius: BorderRadius.circular(largeSpacing), // Bordes redondeados
                    ),
                    child: Center(
                      child: Text('Llantas',
                        style: bodyTextStyle.copyWith(color: grayDark), // Estilo del texto
                      ),
                    ),
                  ),
                  SizedBox(width: smallSpacing),
                  Container(
                    width: 95,
                    decoration: BoxDecoration(
                      color: grayLight,
                      borderRadius: BorderRadius.circular(largeSpacing), // Bordes redondeados
                    ),
                    child: Center(
                      child: Text('Suspensión',
                        style: bodyTextStyle.copyWith(color: grayDark), // Estilo del texto
                      ),
                    ),
                  ),
                  SizedBox(width: smallSpacing),
                ],
              ),
            ),
            SizedBox(height: smallSpacing),
            Expanded(
              child: GridView.builder(
                itemCount: productos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: mediumSpacing,
                  mainAxisSpacing: mediumSpacing,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final producto = productos[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          BorderRadius.circular(smallSpacing),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Imagen
                        Container(
                          height: 173.0,
                          decoration: BoxDecoration(
                            color: grayLight,
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(smallSpacing),
                              topRight:
                                  Radius.circular(smallSpacing),
                            ),
                          ),
                        ),

                        /// Contenido
                        Padding(
                          padding:
                              EdgeInsets.all(smallSpacing), // Padding interno
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, //
                            children: [
                              /// Nombre
                              Text(
                                producto.nombre, // Nombre del producto
                                maxLines: 2, // Máximo 2 líneas
                                overflow:
                                    TextOverflow.ellipsis, // Texto con puntos suspensivos si es muy largo
                                style: subtitleTextStyle, // Estilo del texto
                              ),

                              SizedBox(height: smallSpacing / 2), // Espacio entre el nombre y el precio

                              // Precio
                              Text('\$${producto.precio.toStringAsFixed(0)}', // Precio del producto
                                style:
                                  bodyTextStyle.copyWith(
                                    fontWeight: FontWeight.bold, // Texto en negrita
                                    color: primaryColor,
                                  ),
                              ),
                              SizedBox(height: smallSpacing), // Espacio entre el precio y el botón

                              /// Botón Agregar
                              SizedBox(width: double.infinity, // Ancho completo
                                height: 32, // Altura fija
                                child: ElevatedButton( /// Botón para agregar el producto
                                  onPressed: () { 
                                    // Acción futura
                                  },
                                  style:
                                      ElevatedButton.styleFrom(
                                    backgroundColor:
                                        primaryColor,
                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius
                                              .circular(
                                                  smallSpacing),
                                    ),
                                  ),
                                  child: Text(
                                    'Agregar',
                                    style: bodyTextStyle
                                        .copyWith(
                                      color: whiteColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}

/// Modelo de datos para un producto
class Producto {
  final String nombre;
  final double precio;

  Producto({
    required this.nombre,
    required this.precio,
  });
}

/// Lista de productos de ejemplo
final List<Producto> productos = [
  Producto(nombre: 'Filtro aire Chevrolet Spark', precio: 92000),
  Producto(nombre: 'Pastillas freno Mazda 3', precio: 140000),
  Producto(nombre: 'Llanta Hankook 215-55 R17', precio: 420000),
  Producto(nombre: 'Aceite Motul 5W40', precio: 65000),
  Producto(nombre: 'Amortiguador delantero Renault Logan', precio: 310000),
  Producto(nombre: 'Batería MAC SilverPlus', precio: 395000),
];

