

import 'package:ruleta1/model/categoriaModel.dart';

class CargaCategoriaService {
  List<CategoriaModel> lstCategoria = <CategoriaModel>[];

  cargaCategorias() {
    try {
      lstCategoria = <CategoriaModel>[];
      //Normal
      List<String> detNormal = [];

      detNormal = [
        "Correr descalzo por todo el predio",
        "Sienta sobre otro jugador por una ronda",
        "Golpea la cabeza de otro jugador",
        "Habla sucio a otro jugador",
        "Sube a la espalda de otro jugador",
        "Besa la frente de otro jugador",
        "Gatea por el suelo en círculos",
        "Realiza ejercicios que otro jugador defina",
        "Baila frente a todos los demás jugadores",
        "Actúen romanticamente entre dos jugadores",
        "Otro jugador te hará una pregunta y debes responder con la verdad",
        "Besa los cachetes",
        "Grita con todas tus fuerzas que te gustan los caracoles",
        "Besa la espalda a otro jugador"
        "Tienes que gatear lo más sensualmente posible frente a los demás",
        "Juega a las miradas con otro jugador y quien pierda sera golpeado por todos los participantes",
        "Haz un strip tease",
        "Tomar una cucharada de picante",
        "Admite cuál es el mayor ridículo que has hecho nunca",
        "Hazte pasar por otra persona durante las siguientes 2 rondas del juego",
        "Gira 10 vueltas y corre de un extremo a otro sin detenerte",
        "Eres radio humano, los demás deben hacer que el radio funcione presionando tus botones y girando las perillas en tu cuerpo",
        "Todos los demás miembros te deben dar una patada en el trasero",
        "Todos los demás te deben dar un golpe en la cabeza",
        "Todos los demás te deben dar un golpe en las manos",
        "Dibuja te quiero con las nalgas",
        "Besa la mano de otro jugador",
        "Haz masajes por 5 minutos a otro jugador",
        "Reto grupal, con un lápiz en sus bocas deben pasar un anillo hasta dar la vuela completa, a quien se le caiga se le hara una prenda",
        "Aguanta la respiración por 1 minuto mientras tratan de hacerte reír, si no lo logras realizaras ejercidio de 30 payasitos"
      ];

      //Picante
      List<String> detPicante = [];
      detPicante = [
        "Quítate los pantalones por una ronda",
        "Sientate sobre el otro jugador mirandolo de frente",
        "Cambio de ropa con otro jugador",
        "Lamele la oreja a otro jugador",
        "Beso apasionado con un espejo",
        "Come algo de una parte del cuerpo de otro jugador",
        "Besa al siguiente jugador donde desees",
        "Elige una zona de tu cuerpo donde quiere que pase mi lengua",
        "Cuenta un sueño erótico que hayas tenido y que recuerdes",
        "Que se quite todo menos la ropa interior",
        "Deja que alguien te vista como quiera durante las siguientes rondas",
        "Dale un beso a otra persona del grupo, en la parte del cuerpo que prefieras",
        "Intenta excitar a alguien del grupo durante 1 minuto",
        "Apoyarse menton con menton con otro jugador durante dos turnos",
        "Pásate un cubo de hielo con otra persona",
        "Métete en un cuarto oscuro con otra persona durante 10 minutos",
        "Haz 20 sentadillas en ropa interior",
        "Acostarse uno sobre otro jugador durante dos rondas",
        "Muestra tu mejor foto hot a otro jugador",
        "Pasa la lengua por el cuello de alguien del grupo",
        "Besa a alguien del grupo durante un tiempo de 1 minuto",
        "Susurra algo atrevido y sugerente al oído de otra persona",
        "Dile cosas sucias a otro jugador",
        "Depilarse un brazo",
        "Recibir una bofetada de otro jugador",
        "Llamar a un número desconocido y decir que su encuentro intimo anterior estuvo muy bueno",
        "Haz un masaje a otro jugador mientras describes una situación erotica entre amnbos",
        "Elige una parte de tu cuerpo para pasarte un cubo de hielo",
        "Utiliza las manos de otro jugador y enséña cómo te gusta recibir sexo oral",
      ];

      //XPicante
      List<String> detXPicante = [];
      detXPicante = [
        "Abrazo sin camisa/blusa y sin brasier",
        "Excita a otro jugador mediante el tacto por 1 min",
        "Excita a otro jugador utilizando únicamente tu lengua",
        "Beso dedurante 5 minutos",
        "Beso de lengua dedurante 5 minutos",
        "Bebe algo sobre el cuerpo de otra persona",
        "Besa a otro jugador románticamente en un lugar nuevo en cada turno por una ronda completa",
        "Ponte una venda y adivina con que parte del cuerpo te esta tocando otro jugador",
        "Saca el pantalon a otro jugador sin utilizar las manos",
        "Escoger un video para adultos e imitarlo con el otro jugador",
        "Toca todas las partes del cuerpo que quieras pero usando solo los codos",
        "Masaje en las nalgas por 1 minuto",
        "Quitate el bras sin sacarte la blusa/ saca tu remera",
        "Besa sensualmente la entrepierna de otro jugador durante un minuto",
        "Cuanta la parte favorita de tu cuerpo y muestraselo al otro jugador",
        "Beso de lengua donde prefiera el primer jugador",
        "Sacale la blusa/ remera solo con los dientes",
        "Si hay una piscina, tendrás que entrar y sacarse todas las prendas en el agua por 50 segundos",
        "Que tu lengua toque la de alguien más",
        "Correr en ropa interrior y saltar sobre otro jugador",
        "Recibir una nalgada por parte de otro jugador",
        "Subete sobre otro jugador y muevete sensualmente por 1 minuto",
        "Intenta excitar a alguien del grupo durante 1 minuto se vale todo",
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
