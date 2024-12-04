<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Alumnos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">SLG System</a>
            <div class="ms-auto">
                <!-- Botón de asistencia que se muestra solo en Listado de Alumnos -->
                <span id="attendanceLink" style="display: none;">
                    <button class="btn btn-light" onclick="redirectToAttendance()">Asistencia</button>
                </span>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1 class="text-center">Listado de Alumnos</h1>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addStudentModal">Agregar</button>
        <button class="btn btn-secondary" onclick="goBack()">⬅️ Volver al Panel</button>
        <table class="table table-bordered mt-4" id="studentsTable">
            <thead>
                <tr>
                    <th>Apellidos</th>
                    <th>Nombres</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="studentsTableBody">
                <!-- Alumnos se cargarán aquí -->
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.lastName}</td>
                        <td>${student.firstName}</td>
                        <td>
                            <button class="btn btn-warning btn-sm" onclick="openEditStudentModal(${student.index})">Editar</button>
                            <button class="btn btn-danger btn-sm" onclick="deleteStudent(${student.index})">Borrar</button>
                            <button class="btn btn-info btn-sm" onclick="openNotificationModal()">Notificar</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Modal para agregar alumno -->
    <div class="modal fade" id="addStudentModal" tabindex="-1" aria-labelledby="addStudentModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form id="addStudentForm">
                        <div class="mb-3">
                            <label for="newStudentLastName" class="form-label">Apellidos</label>
                            <input type="text" class="form-control" id="newStudentLastName" required>
                        </div>
                        <div class="mb-3">
                            <label for="newStudentFirstName" class="form-label">Nombres</label>
                            <input type="text" class="form-control" id="newStudentFirstName" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="addStudentButton">Agregar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para editar alumno -->
    <div class="modal fade" id="editStudentModal" tabindex="-1" aria-labelledby="editStudentModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form id="editStudentForm">
                        <div class="mb-3">
                            <label for="editStudentLastName" class="form-label">Apellidos</label>
                            <input type="text" class="form-control" id="editStudentLastName" required>
                        </div>
                        <div class="mb-3">
                            <label for="editStudentFirstName" class="form-label">Nombres</label>
                            <input type="text" class="form-control" id="editStudentFirstName" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="updateStudentButton">Actualizar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de notificación -->
    <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="notificationModalLabel">Enviar Notificación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <form id="notificationForm">
                        <div class="mb-3">
                            <label for="notificationEmail" class="form-label">Correo Electrónico</label>
                            <input type="email" class="form-control" id="notificationEmail" required>
                        </div>
                        <div class="mb-3">
                            <label for="notificationComment" class="form-label">Mensaje</label>
                            <textarea class="form-control" id="notificationComment" rows="3"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="sendNotificationButton">Enviar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdn.emailjs.com/dist/email.min.js"></script>
    <script src="JSListadoAlumnos.js">

    </script>
</body>
</html>