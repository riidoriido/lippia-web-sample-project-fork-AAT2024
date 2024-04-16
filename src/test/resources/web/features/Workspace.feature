@Workspace
Feature: Workspace

    Background: El usuario inicia sesión en su cuenta de Clockify
        Given el usuario se encuentra el dashboard de su cuenta
        And el usuario se dirige a la sección workspaces


    Scenario: Crear workspace nuevo exitoso
        When el usuario hace click en "Create new Workspace"
        And el usuario introduce el valor "Test Workspace #1"
        And el usuario hace click en el botón "Create"
        Then el usuario puede ver el nuevo Workspace "Test Workspace #1" en el listado

    Scenario Outline: Creación de workspace fallada por cantidad de caracteres en nombre
        When el usuario hace click en "Create new Workspace"
        And el usuario introduce un nombre de <char_length> caracteres
        Then la app muestra un mensaje de error "Workspace name has to be between 2 and 250 characters long"
        And el boton "Create" no es clickeable

        Examples:
            | char_length |
            | 2           |
            | 255         |

    Scenario: Borrar workspace
        When el usuario hace click en el boton "delete"
        And el usuario ingresa el valor "delete"
        And el usuario hace click en el boton "Delete workspace"
        Then el usuario puede ver que el workspace fue eliminado

    Scenario: Editar workspace
        When el usuario hace click en el boton "settings"
        And se encuentra en la seccion "workspace settings"
        When el usuario ingresa el valor "workspace editado"
        And el usuario vuelve al listado
        Then el usuario puede ver el workspace con el nombre actualizado

    Scenario: Cambiar workspace activo
        When el usuario hace click en el boton "settings"
        And el usuario vuelve al listado
        Then el usuario puede ver el workspace ahora activo


