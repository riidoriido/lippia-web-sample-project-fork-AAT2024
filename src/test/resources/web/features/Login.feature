@Login
Feature: Login
    Background: El usuario navega al sitio
        Given el usuario abre el navegador y navega a "https://clockify.me/"
        And el usuario hace click en el boton de "Login"

    Scenario: Login exitoso con email
        When el usuario introduce el valor "alguien@ejemplo.com"
        And el usuario hace click en "continue with email"
        And el usuario ingresa el codigo de verificación enviado al correo
        Then el usuario accede a la app de Clockify y puede ver el Timetracker


    Scenario: Login exitoso con Google
        When el usuario hace click el boton "Continue with google"
        And el usuario elige la cuenta con la que quiere acceder
        Then el usuario puede acceder a la app y administrar su cuenta

    Scenario: Login exitoso manual
        When el usuario hace click en el boton "Log in manually"
        And el usuario introduce el valor "alguien@ejemplo.com" y en el campo contraseña "123456"
        And el usuario hace click en el boton "log in"
        Then el usuario puede acceder a la app y administrar su cuenta

    Scenario Outline: Login fallido manual por <causa>
        When el usuario hace click en el boton "Log in manually"
        And el usuario introduce el valor <email> y en el campo contraseña <password>
        Then la app muestra un mensaje de error <error>
        And el boton "log in" no es clickeable

        Examples:
            | email               | password | error                     | causa                  |
            |                     | 123456   | Email is required         | email faltante         |
            | alguien@ejemplo.com | 123456   | Invalid email or password | credenciales inválidas |
            | alguienejemplocom   | 123456   | Email format is not valid | email no válido        |

    Scenario: Login fallido por email inválido
        When el usuario introduce el valor "alguienejemplocom"
        Then la app muestra un mensaje de error "Email format is not valid"
        And el boton "continue with email" no es clickeable

    Scenario: Login fallido por email faltante
        When el usuario borra el mail introducido previamente
        Then la app muestra un mensaje de error "Email is required"
        And el boton "continue with email" no es clickeable