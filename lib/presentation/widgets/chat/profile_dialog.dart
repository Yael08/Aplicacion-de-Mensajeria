import 'package:flutter/material.dart';

//Clase que muestra la informacion del perfil
class ProfileDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          //creacion de ventana
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), //Espaciado interno
              color: Colors.grey[900],
            ),
            child: Column(
              children: [
                 //Foto del perfil circular
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM7DNYo6lNyNF5dLDaeuVbMqVNVBxKGaFSZA&s',
                  ),
                ),
                const SizedBox(height: 10),
                //Nombre del usuario
                const Text(
                  'Mi coquita 🥵',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Numero telefonico
                const SizedBox(height: 10),
                const Text(
                  'Número: +52 442 123 4567',
                  style: TextStyle(color: Colors.white70),
                ),
                //Estado en linea del contacto
                const SizedBox(height: 5),
                const Text(
                  'Estado: En línea',
                  style: TextStyle(color: Colors.greenAccent),
                ),
                //Empuja el botón al fondo del cuadro
                const Spacer(),
                //Boton para cerrar el dialogo
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),  //Cierra el diálogo
                  label: const Text('Cerrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
