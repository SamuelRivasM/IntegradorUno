<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="index.css">
    <!--<link href="../../Login/web/css/estilos.css" rel="stylesheet" type="text/css"/>-->
    <title>Login - SLG System</title>
    <style>
        body {
            background-image: url('https://sanluisgonzaga.edu.pe/img/PORTADA-WEBULTIMOS.webp');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden; 
            position: relative;
        }
        .background-blur {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            filter: blur(8px);
            z-index: 1;
        }
        .login-container {
            position: relative; 
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
            z-index: 2;
            margin: 15px;
            max-width: 400px;
            width: 100%; 
        }

        @media (max-width: 576px) {
            .login-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="background-blur"></div> <!-- Fondo borroso -->

    <div class="container col-lg-3 login-container">
        <!--En action antes iba "Principal.jsp"  "Controlador" <-- esto debe ir pero para ir probando será Principal  -->
        <form action="Controlador" method="POST" id="loginForm">
            <div class="form-group text-center mb-3">
                <img src="img/loginLogo.png" alt="logo" height="80" width="80"/>
                <p><strong>BIENVENIDOS AL SISTEMA DE LA INSTITUCIÓN EDUCATIVA SAN LUIS GONZAGA N6151</strong></p>
            </div>
            <div class="form-group">
                <label>USUARIO:</label>
                <input id="usuario" class="form-control" type="text" name="txtnom" placeholder="Ingrese su usuario" required>
            </div>
            <div class="form-group">
                <label>PASSWORD:</label>
                <input id="contrasena" type="password" placeholder="Ingrese su contraseña" name="txtPass" class="form-control" required>
            </div>
            <input id="loginButton" class="btn btn-primary btn-block mt-3 w-100" type="submit" name="accion" value="Ingresar">
           <!-- <button type="button" id="loginButton" class="btn btn-primary w-100">Ingresara</button>-->
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <!-- <script>
        document.getElementById('loginButton').addEventListener('click', function(event) {
            const usuario = document.getElementById('usuario').value;
            const contrasena = document.getElementById('contrasena').value;

            if (usuario === 'a' && contrasena === '1234') {
                window.location.href = 'Panel.jsp';
            } else {
                alert('Usuario o contraseña incorrectos');
            }
        });
    </script>-->
</body>
</html>