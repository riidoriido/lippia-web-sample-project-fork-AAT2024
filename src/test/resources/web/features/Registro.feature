@Registro
Feature: Registro

    Background: El usuario navega al sitio
        Given el usuario abre el navegador y navega a "https://clockify.me/"
        And el usuario hace click en el boton de "Sign Up Free"

    Scenario: El usuario se registra en la aplicación de manera exitosa
        When el usuario introduce el valor "alguien@ejemplo.com"
        And el usuario hace click en el checkbox de ToS
        And el usuario hace click en "continue with email"
        And el usuario ingresa el codigo de verificación enviado al correo
        Then el usuario accede a la app de Clockify y puede ver el Timetracker

    Scenario: Registro fallido por ToS
        When el usuario introduce el valor "alguien@ejemplo.com"
        And el usuario intenta hacer click en "continue with email"
        Then la app muestra un mensaje de error "You must accept the terms of service" y el boton "continue with email" no es clickeable

    Scenario: Registro fallido por email faltante
        When el usuario deja el campo de email vacío
        And el usuario hace click en el checkbox de ToS
        Then la app muestra el boton "continue with email" no clickeable

    Scenario: Registro fallido por email inválido
        When el usuario introduce el valor "alguienejemplocom"
        Then la app muestra un mensaje de error "Email format is not valid"
        And el boton "continue with email" no es clickeable

    Scenario: Ingreso por Google
        When el usuario hace click en el checkbox de ToS
        And el usuario hace click el boton "Continue with google"
        And el usuario elige la cuenta con la que quiere acceder
        Then el usuario puede dar acceso a la app para iniciar sesion con su cuenta

