<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Asistencia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .attendance-table {
            width: 100%;
            margin: 20px auto;
        }

        .attendance-table th, .attendance-table td {
            text-align: center;
            vertical-align: middle;
        }

        .attendance-table th {
            background-color: #32485C;
            color: white;
        }

        .disabled-row {
            background-color: #f8d7da;
            color: #721c24;
        }

        /* Contenedor con altura fija y scroll */
        .table-container {
            max-height: 500px; /* Altura fija del contenedor */
            overflow-y: auto;  /* Desplazamiento vertical */
        }

        /* Para hacer que el encabezado se mantenga fijo cuando hay scroll */
        .table-container thead th {
            position: sticky;
            top: 0;
            background-color: #32485C;
            z-index: 1;
        }
    </style>
</head>
<body>
    <nav class="navbar bg-body-tertiary" style="background-color: #32485C;">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/Principal.jsp">
                <img src="<%= request.getContextPath() %>/TERCER_AVANCE/View/img/slg-logo-removebg-preview.png" alt="logo-institución" width="80px" height="80px">
            </a>
            <h1 class="text-center text-white">Marcar Asistencia</h1>
        </div>
    </nav>

    <div class="container">
        <h3 class="mt-5 text-center">Hoja de Asistencia</h3>
        <div class="table-container">
            <table class="table table-bordered attendance-table">
                <thead>
                    <tr>
                        <th>Estudiantes</th>
                        <th>Presente</th>
                        <th>Tarde</th>
                        <th>Ausente</th>
                    </tr>
                </thead>
                <tbody id="attendanceTableBody">
                    <!-- Fila para marcar/desmarcar todos -->
                    <tr>
                        <td><strong>Marcar/Desmarcar todos</strong></td>
                        <td><input type="checkbox" class="form-check-input" id="checkAllPresente"></td>
                        <td><input type="checkbox" class="form-check-input" id="checkAllTarde"></td>
                        <td><input type="checkbox" class="form-check-input" id="checkAllAusente"></td>
                    </tr>
                    <!-- Los alumnos se cargarán dinámicamente aquí -->
                </tbody>
            </table>
        </div>
        <div class="text-center mt-2">
            <button class="btn btn-primary" onclick="guardarAsistencia()">Guardar Asistencia</button>
        </div>

        <!-- Botón para regresar a la página de Listado de Alumnos -->
        <div class="text-center mt-2">
            <button class="btn btn-secondary" onclick="goBack()">⬅️ Volver al Listado de Alumnos</button>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Obtener el curso seleccionado del localStorage
        const selectedCourse = localStorage.getItem('selectedCourse');

        if (!selectedCourse) {
            alert('No se ha seleccionado ningún curso.');
            window.location.href = '<%= request.getContextPath() %>/ListadoAlumnos.jsp'; // Redirigir si no hay curso seleccionado
        }

        // Cargar alumnos del curso seleccionado
        function loadAttendanceTable() {
            const students = JSON.parse(localStorage.getItem(selectedCourse)) || [];
            const attendanceTableBody = document.getElementById('attendanceTableBody');

            // Mantener la fila de control (marcar/desmarcar todos)
            const controlRow = attendanceTableBody.querySelector('tr:first-child');
            attendanceTableBody.innerHTML = ''; // Limpiar la tabla
            if (controlRow) {
                attendanceTableBody.appendChild(controlRow); // Reinsertar la fila de control
            } else {
                attendanceTableBody.innerHTML = `
                    <tr>
                        <td><strong>Marcar/Desmarcar todos</strong></td>
                        <td><input type="checkbox" class="form-check-input" id="checkAllPresente"></td>
                        <td><input type="checkbox" class="form-check-input" id="checkAllTarde"></td>
                        <td><input type="checkbox" class="form-check-input" id="checkAllAusente"></td>
                    </tr>`;
            }

            // Recorre y agrega cada estudiante a la tabla
            students.forEach(student => {
                const isDisabled = student.disabled || false; // Propiedad disabled para alumnos eliminados
                const row = `
                    <tr class="${isDisabled ? 'disabled-row' : ''}">
                        <td>${student.lastName} ${student.firstName}</td>
                        <td><input type="checkbox" class="form-check-input presente" ${isDisabled ? 'disabled' : ''}></td>
                        <td><input type="checkbox" class="form-check-input tarde" ${isDisabled ? 'disabled' : ''}></td>
                        <td><input type="checkbox" class="form-check-input ausente" ${isDisabled ? 'disabled' : ''}></td>
                    </tr>`;
                attendanceTableBody.innerHTML += row;
            });

            setupControlCheckboxes(); // Configurar eventos para los checkboxes de control
        }

        // Configurar eventos para los checkboxes de control
        function setupControlCheckboxes() {
            document.getElementById('checkAllPresente').addEventListener('change', function() {
                const checkboxes = document.querySelectorAll('.presente:not(:disabled)');
                checkboxes.forEach(checkbox => checkbox.checked = this.checked);
            });

            document.getElementById('checkAllTarde').addEventListener('change', function() {
                const checkboxes = document.querySelectorAll('.tarde:not(:disabled)');
                checkboxes.forEach(checkbox => checkbox.checked = this.checked);
            });

            document.getElementById('checkAllAusente').addEventListener('change', function() {
                const checkboxes = document.querySelectorAll('.ausente:not(:disabled)');
                checkboxes.forEach(checkbox => checkbox.checked = this.checked);
            });
        }

        // Función para guardar la asistencia
        function guardarAsistencia() {
            alert('Asistencia guardada correctamente');
        }

        // Función para regresar a la página de Listado de Alumnos
        function goBack() {
            window.location.href = '<%= request.getContextPath() %>/ListadoAlumnos.jsp'; // Regresa al listado de alumnos
        }

        // Cargar la tabla de asistencia
        document.addEventListener('DOMContentLoaded', loadAttendanceTable);
// Función para agregar un estudiante
$('#addStudentButton').on('click', function() {
    const lastName = $('#newStudentLastName').val();
    const firstName = $('#newStudentFirstName').val();

    if (lastName && firstName) {
        // Obtenemos el curso seleccionado
        const selectedCourse = localStorage.getItem('selectedCourse');

        // Obtener los estudiantes existentes del curso o inicializar un arreglo vacío
        const students = JSON.parse(localStorage.getItem(selectedCourse)) || [];

        // Agregar nuevo estudiante
        students.push({ lastName, firstName });

        // Guardamos los estudiantes del curso en localStorage
        localStorage.setItem(selectedCourse, JSON.stringify(students));

        // Limpiar el formulario y cerrar el modal
        $('#addStudentForm')[0].reset();
        $('#addStudentModal').modal('hide');

        // Recargar la lista de estudiantes en la tabla
        loadStudents();
    }
})
    </script>
</body>
</html>