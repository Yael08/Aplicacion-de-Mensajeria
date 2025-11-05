import 'package:flutter/material.dart';

//Clase que muestra la ventana de la llamada
class CallDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //Impide cerrar tocando fuera del dialogo
      builder: (context) {
        bool isSpeakerOn = false;
        bool isMuted = false;

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              //Creación de la ventana
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(20), //Espaciado interno
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[900],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Foto del perfil circular
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM7DNYo6lNyNF5dLDaeuVbMqVNVBxKGaFSZA&s',
                      ),
                    ),

                    const SizedBox(height: 15),

                    //Nombre del contacto
                    const Text(
                      'Mi coquita 🥵',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    //Texto de estado de llamada
                    const Text(
                      'Llamando...',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),

                    const Spacer(),

                    //Comportamiento de los botones
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Altavoz
                        _callButton(
                          Icons.volume_up,
                          isSpeakerOn ? Colors.blue : Colors.grey,
                          'Altavoz',
                          onTap: () => setState(() {
                            isSpeakerOn = !isSpeakerOn;
                          }),
                        ),
                        //Microfono
                        _callButton(
                          Icons.mic_off,
                          isMuted ? Colors.blue : Colors.grey,
                          'Silencio',
                          onTap: () => setState(() {
                            isMuted = !isMuted;
                          }),
                        ),
                        //Finalizar llamada
                        _callButton(
                          Icons.call_end,
                          Colors.red,
                          'Colgar',
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  //Metodo que crea un boton reutilizable
  static Widget _callButton(
    IconData icon,  // Icono que se mostrara dentro del boton
    Color color,    // Color de fondo del boton circular
    String label, { // Texto descriptivo que aparecera debajo del boton
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap, // Acción al presionar el boton
          //Personalizacion del boton
          child: CircleAvatar(
            radius: 28,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 28),
          ),
        ),
        // Espaciado entre el boton y el texto inferior
        const SizedBox(height: 5),
        // Etiqueta descriptiva del boton
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
