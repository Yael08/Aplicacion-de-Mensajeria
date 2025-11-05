import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/profile_dialog.dart';

//Clase que muestra un menu de opciones al presionar el boton
class OptionsDialog {
  static void show(BuildContext context) async {
    final result = await showMenu<String>(
      context: context,
      //Posicion donde se despliega el menu
      position: const RelativeRect.fromLTRB(1000, 80, 0, 0),
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      items: [
        // Opción: Ver perfil
        const PopupMenuItem<String>(
          value: 'perfil',
          child: Text('Ver perfil', style: TextStyle(color: Colors.white)),
        ),
         // Opción: Bloquear usuario
        const PopupMenuItem<String>(
          value: 'bloquear',
          child: Text('Bloquear', style: TextStyle(color: Colors.white)),
        ),
         // Opción: Eliminar chat
        const PopupMenuItem<String>(
          value: 'eliminar',
          child: Text('Eliminar chat', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
    // Si se da click fuera del menu se cierra
    if (result == null) return;

    switch (result) {
      case 'perfil':
      // Muestra el perfil
        ProfileDialog.show(context);
        break;

      case 'bloquear':
      //Muestra una ventana notificando el bloqueo
        _showSimpleDialog(
          context,
          title: 'Contacto bloqueado',
          message:
              'Has bloqueado a “Mi coquita 🥵”. Ya no podrás recibir mensajes.',
          color: Colors.orange,
        );
        break;

      case 'eliminar':
      //Muestra una ventana notificando la eliminacion del chat
        _showSimpleDialog(
          context,
          title: 'Chat eliminado',
          message: 'El chat ha sido eliminado correctamente.',
          color: Colors.red,
        );
        break;
    }
  }

  static void _showSimpleDialog(
    BuildContext context, {
    required String title,
    required String message,
    required Color color,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          //Creación de la ventana
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          content: Text(message, style: const TextStyle(color: Colors.white70)),
          actions: [
            // Botón para cerrar la ventana
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cerrar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
