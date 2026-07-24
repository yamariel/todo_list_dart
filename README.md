# 📋 Todo List CLI en Dart

## Description

Ce projet est une application de gestion de tâches en ligne de commande (CLI) développée en **Dart**.

L'application permet de créer, consulter, mettre à jour et supprimer des tâches. Les données sont sauvegardées dans un fichier **JSON**, ce qui permet de conserver les tâches même après la fermeture du programme.

---

## Fonctionnalités

* ✅ Créer une tâche normale ou urgente
* ✅ Lister toutes les tâches
* ✅ Marquer une tâche comme terminée
* ✅ Supprimer une tâche
* ✅ Sauvegarde automatique dans un fichier JSON
* ✅ Chargement automatique des tâches au démarrage
* ✅ Gestion des exceptions personnalisées

---

## Architecture du projet

```text
lib/
├── enums/
│   └── priority.dart
│
├── exceptions/
│   ├── task_format.dart
│   └── task_not_found.dart
│
├── models/
│   ├── task.dart
│   ├── normal_task.dart
│   └── urgent_task.dart
│
├── repositories/
│   ├── repository.dart
│   └── task_repository.dart
│
├── services/
│   ├── task_service.dart
│   └── user_choise.dart
│
bin/
└── main.dart

test/
└── task_repository_test.dart
```

---

## Concepts Dart utilisés

Ce projet met en œuvre plusieurs notions importantes de Dart :

* Classes abstraites
* Héritage
* Interfaces (`implements`)
* Génériques (`Repository<T>`)
* Exceptions personnalisées
* Sérialisation et désérialisation JSON
* Lecture et écriture de fichiers
* Tests unitaires

---

## Utilisation

Lancer l'application :

```bash
dart run bin/main.dart
```

Menu principal :

```text
1. Créer une tâche
2. Lister les tâches
3. Marquer une tâche terminée
4. Supprimer une tâche
0. Quitter
```

---

## Sauvegarde

Les tâches sont enregistrées dans le fichier :

```text
tasks.json
```

Chaque tâche est enregistrée sous le format suivant :

```json
{
  "type": "normal",
  "id": 1,
  "title": "Apprendre Dart",
  "priority": "medium",
  "date": "2026-07-24 10:00:00.000",
  "isCompleted": false
}
```

---

## Tests

Les tests unitaires se trouvent dans le dossier :

```text
test/
```

Pour exécuter les tests :

```bash
dart test
```

---

## Auteur

Projet réalisé par **[Ariel Yamien](https://github.com/yamariel)** dans le cadre d'un exercice de développement en **Dart CLI**.
