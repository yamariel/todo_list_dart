import 'dart:io';

class UserChoise {
  int userChoise() {
    print('1. Créer une tâche');
    print('2. Lister les tâches');
    print('3. Marquer une tâche terminée');
    print('4. Supprimer une tâche');
    print('0. Quitter\n');
    print('Votre choix :');
    final choice = int.tryParse(stdin.readLineSync() ?? '');

    if (choice == null) {
      print("Veuillez entrer un nombre.");
      return -1;
    }

    return choice;
  }
}
