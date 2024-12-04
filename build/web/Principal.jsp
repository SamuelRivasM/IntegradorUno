<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <title>Panel Principal</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">SLG System</a>
                <div class="dropdown ms-auto">
                    <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="img/loginLogo.png" alt="perfil" height="50" width="50" class="rounded-circle">
                        Docente<!---->
                        <a>${nom}</a>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end text-center" aria-labelledby="navbarDropdown">
                       <!-- <li><span class="dropdown-item-text">example@gmail.com</span></li>-->
                        <li><hr class="dropdown-divider"></li>
                        <!-- En el botón se llamará al controlador -->
                        <li><a class="dropdown-item" href="Controlador?accion=Salir">Salir</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container mt-4">
            <h1>Bienvenido, <strong>docente ${nom} </strong></h1>
        </div>    
        <div class="container">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCourseModal">Agregar Curso</button>
            <table class="table table-bordered mt-4" id="coursesTable">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Grado Y Sección</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
            <tbody id="coursesTableBody">
                <tr>
                    <td>Comunicación</td>
                    <td>2 F</td>
                    <td>
                        <span class="action-icons" onclick="openEditModal(this)">✏️ Editar</span>
                        <span class="action-icons" onclick="deleteCourse(this)">🗑️ Borrar</span>
                        <button class="btn btn-info" onclick="openListadoAlumnos('Comunicación')">Ingresar</button>
                    </td>
                </tr>
                <tr>
                    <td>Matemática</td>
                    <td>4 A</td>
                    <td>
                        <span class="action-icons" onclick="openEditModal(this)">✏️ Editar</span>
                        <span class="action-icons" onclick="deleteCourse(this)">🗑️ Borrar</span>
                        <button class="btn btn-info" onclick="openListadoAlumnos('Matemática')">Ingresar</button>
                    </td>
                </tr>
                <tr>
                    <td>Ciencia y Ambiente</td>
                    <td>3 D</td>
                    <td>
                        <span class="action-icons" onclick="openEditModal(this)">✏️ Editar</span>
                        <span class="action-icons" onclick="deleteCourse(this)">🗑️ Borrar</span>
                        <button class="btn btn-info" onclick="openListadoAlumnos('Ciencia y Ambiente')">Ingresar</button>
                    </td>
                </tr>
                <tr>
                    <td>Historia y Geografía</td>
                    <td>1 B</td>
                    <td>
                        <span class="action-icons" onclick="openEditModal(this)">✏️ Editar</span>
                        <span class="action-icons" onclick="deleteCourse(this)">🗑️ Borrar</span>
                        <button class="btn btn-info" onclick="openListadoAlumnos('Historia y Geografía')">Ingresar</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Modal para agregar curso -->
    <div class="modal fade" id="addCourseModal" tabindex="-1" aria-labelledby="addCourseModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCourseModalLabel">Agregar Curso</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <form id="addCourseForm">
                        <div class="mb-3">
                            <label for="courseName" class="form-label">Nombre del Curso</label>
                            <input type="text" class="form-control" id="courseName" required>
                        </div>
                        <div class="mb-3">
                            <label for="courseGrade" class="form-label">Grado y Sección</label>
                            <input type="text" class="form-control" id="courseGrade" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="addCourseButton">Añadir</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para editar curso -->
    <div class="modal fade" id="editCourseModal" tabindex="-1" aria-labelledby="editCourseModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form id="editCourseForm">
                        <div class="mb-3">
                            <label for="editCourseName" class="form-label">Nombre del Curso</label>
                            <input type="text" class="form-control" id="editCourseName" required>
                        </div>
                        <div class="mb-3">
                            <label for="editCourseGrade" class="form-label">Grado y Sección</label>
                            <input type="text" class="form-control" id="editCourseGrade" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="updateCourseButton">Actualizar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="Principal.js"></script>
    <script>
        function openListadoAlumnos(courseName) {
            localStorage.setItem('selectedCourse', courseName);
            window.location.href = 'ListadoAlumnos.jsp';
        }
    </script>
    <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>-->
    </body>
    
</html>
