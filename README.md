# 3A - Codolingo - Front-End

## Run

### Dummy

`flutter run -t ./lib/main_dummy.dart --flavor dummy`

### Dev

`flutter run -t ./lib/main_dev.dart --flavor dev`

### Staging

`flutter run -t ./lib/main_staging.dart --flavor staging`

### Production

`flutter run -t ./lib/main_prod.dart --flavor prod`

## Génération des assets

Lorsqu'un asset est ajouté, il est nécessaire de lancer une commande pour pouvoir y accéder à partir de l'objet Asset : 

`dart run build_runner build`

## Tests

- Lancement des tests : `flutter test`
- Génération des mocks en utilisant mockito : `dart run build_runner build`

## Providers

Il existe deux types de providers dans le projet : 
- Live : Se connecte à une api pour recevoir les données du Backend
- Dummy : Récupère les données en local comme réponse du Backend

Les repositories utilisés ne sont pas les mêmes en fonction du provider utilisé.

## Injection de dépendance 

L'application utilise GetIt pour pouvoir injecter des dépendances dans l'application.
L'injection de dépendance est utile car elle permet de tester beaucoup plus facilement des parties de l'application.

Il est possible d'injecter une dépendance en utilisant GetIt comme ceci : 

```dart
final getIt = GetIt.instance;
ApiRepository repository = getIt.get<ApiRepository>();
```

Une dépendance peut être ajoutée dans le système d'injection de dépendance en l'ajoutant dans les providers :
- Dummy : ./lib/providers/dummy_provider.dart
- Live : ./lib/providers/live_provider.dart
- Les deux : ./lib/providers/provider.dart

Attention, ce n'est pas parce qu'on peut injecter des repositories partout qu'il faut le faire : 
- Un ViewModel ne peut que utiliser des Repositories
- Un Repository ne peut que utiliser des Repositories, des Services et des Transformers
- Un Service ne peut que utiliser des Services
- Un Transformer ne peut que utiliser des Transformers

## Troubleshoot

Impossible de lancer l'application : (Missing MainActivity)

`adb uninstall <PACKAGE>`