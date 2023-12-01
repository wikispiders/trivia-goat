import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget implements PreferredSizeWidget{
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'WHO SAID THAT?',  // Título deseado
        style: TextStyle(
          fontWeight: FontWeight.bold,  // Aplicar estilo de negrita
          color: Colors.white,  // Color rosa
        ),
      ),
      centerTitle: true,  // Centrar el título
      backgroundColor: Theme.of(context).primaryColor,  // Color del fondo del AppBar
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
