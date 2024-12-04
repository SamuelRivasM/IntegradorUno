        // Mostrar el enlace "Asistencia" solo si estamos en la pantalla de Listado de Alumnos
        document.addEventListener('DOMContentLoaded', function() {
            const isListadoAlumnos = localStorage.getItem('selectedCourse') !== null;
            const attendanceLink = document.getElementById('attendanceLink');
            
            if (isListadoAlumnos) {
                attendanceLink.style.display = 'inline'; // Mostrar el enlace
            } else {
                attendanceLink.style.display = 'none'; // Ocultar el enlace
            }
        });

        // Redirigir a la pantalla de Marcar Asistencia
        function redirectToAttendance() {
            window.location.href = 'MarcarAsistencia.jsp';
        }

        // Obtener el curso seleccionado del localStorage
        const selectedCourse = localStorage.getItem('selectedCourse');

        // Inicializa alumnos por defecto por curso
        const defaultStudents = {
            "Comunicación": [
                { lastName: 'Pérez', firstName: 'Juan' },
                { lastName: 'González', firstName: 'María' },
                { lastName: 'Martínez', firstName: 'Carlos' },
                { lastName: 'Hernández', firstName: 'Laura' },
                { lastName: 'Ramos', firstName: 'Sofía' },
            ],
            "Matemática": [
                { lastName: 'Lopez', firstName: 'Ana' },
                { lastName: 'Vásquez', firstName: 'Luis' },
                { lastName: 'Torres', firstName: 'Carmen' },
                { lastName: 'Núñez', firstName: 'Diego' },
                { lastName: 'Castillo', firstName: 'Jazmín' },
            ],
            "Ciencia y Ambiente": [
                { lastName: 'Mendoza', firstName: 'Elias' },
                { lastName: 'Córdova', firstName: 'Patricia' },
                { lastName: 'Valenzuela', firstName: 'José' },
                { lastName: 'Pineda', firstName: 'Natalia' },
                { lastName: 'Reyes', firstName: 'Roberto' },
            ],
            "Historia y Geografía": [
                { lastName: 'Ramírez', firstName: 'Verónica' },
                { lastName: 'Marcos', firstName: 'Fernando' },
                { lastName: 'Gómez', firstName: 'Paola' },
                { lastName: 'Salazar', firstName: 'Miguel' },
                { lastName: 'Aguilar', firstName: 'Gabriela' },
            ]
        };

        // Cargar alumnos desde localStorage o inicializar con valores por defecto
        function loadStudents() {
            const students = JSON.parse(localStorage.getItem(selectedCourse)) || defaultStudents[selectedCourse] || [];
            const studentsTableBody = document.getElementById('studentsTableBody');
            studentsTableBody.innerHTML = '';

            students.forEach((student, index) => {
                const row = `<tr>
                    <td>${student.lastName}</td>
                    <td>${student.firstName}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="openEditStudentModal(${index})">Editar</button>
                        <button class="btn btn-danger btn-sm" onclick="deleteStudent(${index})">Borrar</button>
                        <button class="btn btn-info btn-sm" onclick="openNotificationModal()">Notificar</button>
                    </td>
                </tr>`;

                studentsTableBody.innerHTML += row;
            });

            // Si no hay alumnos, mostrar la notificación
            if (students.length === 0) {
                alert(`¡Bienvenido al curso ${selectedCourse} sección ${selectedCourse}! Sé el primero en apuntarte al curso...!!!`);
            }
        }

        // Abrir modal de notificación
        function openNotificationModal() {
            $('#notificationModal').modal('show');
        }

        // Función para enviar notificación usando EmailJS
        $('#sendNotificationButton').on('click', function() {
            const email = $('#notificationEmail').val();
            const comment = $('#notificationComment').val();
            const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            // Validar el correo electrónico
            if (!emailPattern.test(email)) {
                alert('Por favor, ingrese un correo electrónico válido.');
                return;
            }

            // Usar EmailJS para enviar el correo
            emailjs.send("service_muujmar", "template_ri610s7", {
                to_email: email,
                from_name: "Sistema SLG",
                message: comment
            })
            .then(function(response) {
                alert(`La notificación fue enviada exitosamente a ${email} con el mensaje: "${comment}".`);
                $('#notificationModal').modal('hide');
                $('#notificationForm')[0].reset();
            }, function(error) {
                alert("Hubo un error al enviar el correo. Por favor, intente nuevamente.");
                console.log("Error de envío:", error); // Para depuración
            });
        });

        // Función para volver al panel principal
        function goBack() {
            window.location.href = 'Principal.jsp';
        }

        // Función para agregar un alumno al curso
        $('#addStudentButton').on('click', function() {
            const lastName = $('#newStudentLastName').val();
            const firstName = $('#newStudentFirstName').val();

            if (lastName && firstName) {
                const students = JSON.parse(localStorage.getItem(selectedCourse)) || [];

                // Agregar nuevo alumno al curso
                students.push({ lastName, firstName });

                // Guardar el curso con los nuevos alumnos en localStorage
                localStorage.setItem(selectedCourse, JSON.stringify(students));

                // Limpiar el formulario y cerrar el modal
                $('#addStudentForm')[0].reset();
                $('#addStudentModal').modal('hide');

                // Recargar la lista de alumnos
                loadStudents();
            }
        });

        // Cargar los alumnos al abrir la página
        $(document).ready(function() {
            loadStudents();
        });

        // Función para abrir el modal de edición de estudiante
        function openEditStudentModal(index) {
            const students = JSON.parse(localStorage.getItem(selectedCourse)) || [];
            const student = students[index];

            $('#editStudentLastName').val(student.lastName);
            $('#editStudentFirstName').val(student.firstName);
            $('#updateStudentButton').data('index', index);
            $('#editStudentModal').modal('show');
        }

        // Actualizar estudiante
        $('#updateStudentButton').on('click', function() {
            const index = $(this).data('index');
            const lastName = $('#editStudentLastName').val();
            const firstName = $('#editStudentFirstName').val();

            const students = JSON.parse(localStorage.getItem(selectedCourse)) || [];
            students[index] = { lastName, firstName };
            localStorage.setItem(selectedCourse, JSON.stringify(students));

            $('#editStudentModal').modal('hide');
            loadStudents();
        });

        // Función para eliminar estudiante
        function deleteStudent(index) {
            const students = JSON.parse(localStorage.getItem(selectedCourse)) || [];
            if (students[index]) {
                students[index].disabled = true; // Marcar como deshabilitado
            }
            localStorage.setItem(selectedCourse, JSON.stringify(students));
            loadStudents();
        }
// Guardar los estudiantes en localStorage
$('#addStudentButton').on('click', function() {
    const lastName = $('#newStudentLastName').val();
    const firstName = $('#newStudentFirstName').val();

    if (lastName && firstName) {
        const selectedCourse = localStorage.getItem('selectedCourse');
        const students = JSON.parse(localStorage.getItem(selectedCourse)) || [];

        students.push({ lastName, firstName });

        // Guardar los estudiantes en localStorage
        localStorage.setItem(selectedCourse, JSON.stringify(students));

        // Limpiar el formulario y cerrar el modal
        $('#addStudentForm')[0].reset();
        $('#addStudentModal').modal('hide');

        loadStudents();  // Recargar la lista de estudiantes
    }
})

$(document).ready(function() {
    // Establecer curso seleccionado si no existe
    if (!localStorage.getItem('selectedCourse')) {
        localStorage.setItem('selectedCourse', 'Comunicación'); // Curso predeterminado
    }

    // Cargar los estudiantes al abrir la página
    loadStudents();
});

function deleteStudent(index) {
    const students = JSON.parse(localStorage.getItem(selectedCourse)) || [];
    if (students[index]) {
        students.splice(index, 1); // Eliminar estudiante
    }
    localStorage.setItem(selectedCourse, JSON.stringify(students));
    loadStudents(); // Recargar tabla
}

function loadStudents() {
    const selectedCourse = localStorage.getItem('selectedCourse') || 'Comunicación'; // Curso predeterminado
    const students = JSON.parse(localStorage.getItem(selectedCourse)) || defaultStudents[selectedCourse] || [];

    const studentsTableBody = document.getElementById('studentsTableBody');
    studentsTableBody.innerHTML = '';

    students.forEach((student, index) => {
        const row = `<tr>
            <td>${student.lastName}</td>
            <td>${student.firstName}</td>
            <td>
                <button class="btn btn-warning btn-sm" onclick="openEditStudentModal(${index})">Editar</button>
                <button class="btn btn-danger btn-sm" onclick="deleteStudent(${index})">Borrar</button>
                <button class="btn btn-info btn-sm" onclick="openNotificationModal()">Notificar</button>
            </td>
        </tr>`;
        studentsTableBody.innerHTML += row;
    });

    if (students.length === 0) {
        alert(`¡Bienvenido al curso ${selectedCourse}! Sé el primero en agregar alumnos.`);
    }
}



