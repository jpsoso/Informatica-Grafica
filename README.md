# Informática Gráfica - Prácticas de Laboratorio

Este repositorio contiene las prácticas de la asignatura **Informática Gráfica** (curso 2025-26) de la **Universidad de Granada (UGR)**. Los proyectos están desarrollados utilizando **Godot Engine 4**.

## Estructura del Repositorio

El repositorio está organizado en carpetas correspondientes a cada práctica. A continuación se presenta un índice con enlaces a cada proyecto y un resumen de los conceptos abordados.

| Práctica | Título | Conceptos Clave |
| :--- | :--- | :--- |
| **[Práctica 1](./P1)** | **Escena básica y modos de visualización** | Nodos, Geometría básica, Materiales, Cámara orbital |
| **[Práctica 2](./P2)** | **Carga de modelos externos y normales** | Carga de mallas (.glb/.obj), Wireframe, Cálculo de normales, Objetos por revolución |
| **[Práctica 3](./P3)** | **Grafos de escena** | Modelos jerárquicos, Objetos articulados, Animación, Árbol de escena |
| **[Práctica 4](./P4)** | **Iluminación, materiales y texturas** | Iluminación local, Tipos de luz, Mapeado UV, Texturas |
| **[Práctica 5](./P5)** | **Interacción con ratón y selección de objetos** | Raycasting, Entrada de ratón, Selección de objetos, Instanciación dinámica |

---

## Descripción Detallada

### [Práctica 1: Escena básica y modos de visualización](./P1)
**Objetivo:** Familiarizarse con el entorno de desarrollo de Godot, el sistema de nodos y la creación de escenas 3D simples.
* **Actividades:**
    * Crear una escena 3D con geometría básica (cubo y pirámide).
    * Aplicar distintos materiales a los objetos y cambiar el color albedo.
    * Implementar una cámara orbital controlada por teclado y ratón.
    * Añadir una fuente de luz direccional.

### [Práctica 2: Carga de modelos externos y normales](./P2)
**Objetivo:** Comprender la representación de mallas triangulares, cargar modelos externos y la generación procedimental.
* **Actividades:**
    * Implementar la visualización en modo alambre (wireframe) activada por tecla.
    * Cargar modelos 3D en formatos `.glb` y `.obj`.
    * Cálculo algorítmico de normales para objetos suaves y con aristas vivas (sombreado por vértice vs. píxel).
    * Creación de mallas mediante la revolución de un perfil 2D (ej. un peón de ajedrez).

### [Práctica 3: Grafos de escena](./P3)
**Objetivo:** Diseñar e implementar modelos jerárquicos de objetos articulados.
* **Actividades:**
    * Diseñar el grafo de escena para un objeto articulado (ej. una grúa) con al menos tres grados de libertad.
    * Implementar el modelo en Godot utilizando la jerarquía de nodos `Node3D`.
    * Crear scripts para animar articulaciones específicas.
    * Activar y desactivar animaciones de forma interactiva.

### [Práctica 4: Iluminación, materiales y texturas](./P4)
**Objetivo:** Comprender el modelo de iluminación local y aplicar texturas y materiales avanzados.
* **Actividades:**
    * Configurar una escena con múltiples fuentes de luz: `DirectionalLight3D`, `OmniLight3D` y `SpotLight3D`.
    * Configurar materiales con distintas propiedades físicas (Metálico, Rugosidad, Transparencia).
    * Aplicar texturas a objetos y calcular coordenadas UV procedimentalmente para objetos de revolución.

### [Práctica 5: Interacción con ratón y selección de objetos](./P5)
**Objetivo:** Detectar e interpretar la interacción del usuario mediante el ratón en el espacio 3D.
* **Actividades:**
    * Añadir colisionadores (`CollisionShape3D`) a los objetos de la escena.
    * Implementar un `RayCast3D` desde la cámara para detectar objetos bajo el cursor.
    * Seleccionar objetos e identificar sus propiedades mediante scripts.
    * Instanciar nuevos objetos (ej. cubos) en posiciones 3D específicas determinadas por clics en el suelo.

---

## Herramientas Utilizadas

![Godot Engine](https://img.shields.io/badge/Godot_Engine-4.x-%23478cbf?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/Language-GDScript-%23478cbf?logo=godot-engine&logoColor=white)

## Autor
* **Jesús Pereira**