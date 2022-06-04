

import 'package:ruleta1/model/categoriaModel.dart';

class CargaCategoriaService {
  List<CategoriaModel> lstCategoria = <CategoriaModel>[];

  cargaCategorias() {
    try {
      lstCategoria = <CategoriaModel>[];
      //Normal
      List<String> detNormal = [];

      detNormal = [
        "Quítate los pantalones por una ronda",
        "Besa al siguiente jugador donde desees",
        "Háblale sucio",
        "Sientate sobre el otro jugador",
        "Besa en el cuello",
        "Cambio de ropa con otro jugador",
        "Lamele la oreja",
        "Baila sensualmente ",
        "Actuen como si se estuvieran besando",
        "Que tu lengua toque la de alguien más",
        "Besa los cachetes",
        "Come algo de una parte del cuerpo de otro jugador",
        "Tienes que gatear lo más sensualmente posible frente a los demás",
        "Haz gemidos mientras otro jugador este sobre ti",
        "Haz un strip tease",
        "Tienes que bajarle el cierre del pantalón a otro jugador",
        "Toma un objeto y haz tu baile más sensual con ella",
        "Quítate tres prendas de tu cuerpo",
        "Con los ojos vendados un miembro del grupo te dara un beso y tendras que adivinar quien fue",
        "Actua que estas teniendo intimidad con el otro jugador",
      ];

      //Picante
      List<String> detPicante = [];
      detPicante = [
        "Bebe algo sobre el cuerpo de otra persona",
        "Elige una zona de tu cuerpo donde quiere que pase mi lengua",
        "Cuenta un sueño erótico que hayas tenido y que recuerdes",
        "Que se quite todo menos la ropa interior",
        "Deja que alguien te vista como quiera durante las siguientes rondas",
        "Dale un beso a otra persona del grupo, en la parte del cuerpo que prefieras",
        "Intenta excitar a alguien del grupo durante 1 minuto",
        "Usa la ropa interior de alguien del grupo durante media hora",
        "Pásate un cubo de hielo con otra persona durante un minuto hasta que se deshaga",
        "Métete en un cuarto oscuro con otra persona durante 10 minutos",
        "Haz 20 sentadillas en ropa interior",
        "Estírate encima de otra persona durante la siguiente ronda",
        "Manda un nuds a alguien del grupo y asegurate que luego lo borre",
        "Pasa la lengua por el cuello de alguien del grupo",
        "Besa a alguien del grupo durante un tiempo de 1 minuto",
        "Susurra algo atrevido y sugerente al oído de otra persona",
        "Cambio de ropa con otro jugador",
        "Dile cosas sucias a otro jugador",
        "Depilarse un brazo",
        "Recibir una bofetada de otro jugador",
        "Llamar a un número desconocido y decir que su encuentro intimo anterior estuvo muy bueno",
        "Hazme un masaje mientras describes una situación sexual perfecta para ti",
        "Elige una parte de tu cuerpo para pasarte un cubo de hielo",
        "Utiliza mis manos y enséñame cómo te gusta recibir sexo oral",
      ];

      //XPicante
      List<String> detXPicante = [];
      detXPicante = [
        "Abrazo sin camisa/blusa y sin brasier",
        "Excita a otro jugador mediante el tacto por 1 min",
        "Excita a otro jugador utilizando únicamente tu lengua",
        "Beso dedurante 5 minutos",
        "Beso de lengua dedurante 5 minutos",
        "Besa a otro jugador románticamente en un lugar nuevo en cada turno por una ronda completa",
        "Ponte una venda y adivina con que parte del cuerpo te esta tocando otro jugador",
        "Saca el pantalon a otro jugador sin utilizar las manos",
        "Escoger un video para adultos e imitenlo con el otro jugador",
        "Toca todas las partes del cuerpo que quieras pero usando solo los codos",
        "Masaje en las nalgas por 1 minuto",
        "Quitate el bras sin sacarte la blusa/ saca tu remera",
        "Besa sensualmente la entrepierna de otro jugador durante un minuto",
        "Cuanta la parte favorita de tu cuerpo y muestraselo al otro jugador",
        "Beso de lengua donde prefiera el primer jugador",
        "Sacale la blusa/ remera solo con los dientes",
        "Si hay una piscina, tendrás que nadar desnudo con otra persona",
        "Cambio de ropa con otro jugador",
        "Depilarse un brazo",
        "Recibir una bofetada de otro jugador",
        "Llamar a un número desconocido y decir que su encuentro intimo anterior estuvo muy bueno",
        "Intenta excitar a alguien del grupo durante 1 minuto",
        "Beso de 3 personas durante 30 seg ",
        "Beso de 4 personas durante 30 seg",
        "Beso de picos grupal",
        "Quédate a oscuras con otro miembro del grupo",
        "Haz 20 sentadillas en ropa interior",
        "Toma un baño o ducha con alguien del grupo",
      ];

      //Normal
      lstCategoria.add(CategoriaModel.fromString("0", "Normal", detNormal));
      lstCategoria.add(CategoriaModel.fromString("1", "Picante", detPicante));
      lstCategoria
          .add(CategoriaModel.fromString("2", "Extra Picante", detXPicante));
    } catch (e) {
      print(e);
    }
  }
}
