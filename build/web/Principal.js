$(document).ready(function() {
    // Agregar curso
    $('#addCourseButton').on('click', function() {
        const name = $('#courseName').val();
        const grade = $('#courseGrade').val();

        if (name && grade) {
            // Agregar fila a la tabla con los botones Editar, Borrar e Ingresar
            $('#coursesTableBody').append(`
                <tr>
                    <td>${name}</td>
                    <td>${grade}</td>
                    <td>
                        <span class="action-icons" onclick="openEditModal(this)">✏ Editar</span>
                        <span class="action-icons" onclick="deleteCourse(this)">🗑 Borrar</span>
                        <button class="btn btn-info" onclick="openListadoAlumnos('${name}')">Ingresar</button>
                    </td>
                </tr>
            `);
            // Limpiar el formulario y cerrar el modal
            $('#addCourseForm')[0].reset();
            $('#addCourseModal').modal('hide');
        }
    });

    // Actualizar curso
    $('#updateCourseButton').on('click', function() {
        const name = $('#editCourseName').val();
        const grade = $('#editCourseGrade').val();
        const currentRow = $(this).data('row');

        if (name && grade) {
            // Actualizar la fila del curso con los nuevos datos
            $(currentRow).find('td:eq(0)').text(name);
            $(currentRow).find('td:eq(1)').text(grade);
            $('#editCourseModal').modal('hide');
        }
    });
});

// Función para abrir el modal de edición
function openEditModal(row) {
    const currentRow = $(row).closest('tr');
    const courseName = currentRow.find('td:eq(0)').text();
    const courseGrade = currentRow.find('td:eq(1)').text();

    // Establecer los valores actuales en el modal de edición
    $('#editCourseName').val(courseName);
    $('#editCourseGrade').val(courseGrade);
    $('#updateCourseButton').data('row', currentRow); // Guardar la fila actual para actualizar
    $('#editCourseModal').modal('show');
}

// Función para eliminar un curso
function deleteCourse(row) {
    $(row).closest('tr').remove(); // Eliminar la fila seleccionada
}

// Función para abrir el listado de alumnos
function openListadoAlumnos(courseName) {
    localStorage.setItem('selectedCourse', courseName); // Guardar el curso seleccionado
    window.location.href = 'ListadoAlumnos.jsp'; // Redirigir al listado de alumnos
}
