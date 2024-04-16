@Proyectos
Feature: Proyectos
    Background: El usuario inicia sesión en su cuenta de Clockify
        Given el usuario se encuentra el dashboard de su cuenta
        And el usuario se dirige a la sección projects

    Scenario: Crear Proyecto exitoso
        When el usuario hace click en el boton "Create new project"
        And el usuario ingresa el valor "nuevo_proyecto_1"
        And el usuario hace click en el boton "create"
        Then el usuario puede ver el nuevo proyecto en el listado

    Scenario Outline: Creación de proyecto fallida por cantidad de caracteres en nombre
        When el usuario hace click en "Create new project"
        And el usuario introduce un nombre de <char_length> caracteres
        Then la app muestra un mensaje de error "Project name has to be between 2 and 250 characters long"

        Examples:
            | char_length |
            | 2           |
            | 255         |

    Scenario: Creación de proyecto fallida por nombre existente para cliente dado
        When el usuario hace click en "Create new project"
        And el usuario ingresa el valor "nuevo_proyecto_1"
        And el usuario hace click en el boton "create"
        Then la app muestra un mensaje de error "nuevo_proyecto_1 project for client already exists."


    Scenario: Añadir Task a proyecto existente
        When el usuario hace click en "nuevo_proyecto_1"
        And el usuario ingresa el valor "nueva_task_1"
        And el usuario hace click en el boton "add"
        Then el usuario puede ver la task en el listado

    Scenario: Archivar y borrar proyecto existente
        When el usuario hace click en el boton "settings"
        And el usuario hace click en "Archive"
        And el usuario hace click en "delete"
        Then el proyecto es removido del listado de proyectos