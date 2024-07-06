
# Challenge Pin App

## Estructura del Proyecto
```plaintext
lib/
├── bloc/
│   ├── post/
│   │   ├── post_cubit.dart
│   │   └── post_state.dart
│   ├── comment/
│   │   ├── comment_cubit.dart
│   │   └── comment_state.dart
├── models/
│   ├── comment.dart
│   └── post.dart 
├── screens/
│   ├── post_detail_screen.dart
│   └── post_list_screen.dart
├── services/
│   ├── api_service.dart
│   └── service_locator.dart
├── utils/
│   ├── blocs.dart
│   ├── models.dart
│   ├── screens.dart
│   └── services.dart
└── main.dart
```
- bloc/
contienen las clases específicas para la gestión del estado de los posts y comentarios.

- models/
mantiene los modelos para representar la estructura de los comentarios y los posts.

- screens/
incliye las pantallas para mostrar la lista de posts y los detalles del post seleccionado

- services/
contiene api_service.dart para manejar las solicitudes HTTP y service_locator.dart para la configuración de la inyección de dependencias.

- utils/
agrupa archivos archivos de barril para facilitar su importación.
