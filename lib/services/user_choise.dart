import 'dart:io';

class UserChoise {
  int userChoise() {
    print('1. Créer une tâche');
    print('2. Lister les tâches');
    print('3. Marquer une tâche terminée');
    print('4. Supprimer une tâche');
    print('0. Quitter\n');
    print('Votre choix :');
    int choise = int.tryParse(stdin.readLineSync() ?? '') ?? 1;
    return choise;
  }
}
