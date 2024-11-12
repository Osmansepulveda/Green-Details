const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');

// Verifica que el botón de registro y el formulario existan
const formRegistro = document.querySelector('#form-registro');

if (registerBtn && formRegistro) {
    registerBtn.addEventListener('click', () => {
        container.classList.add("active"); // Asegúrate de que esto muestre el formulario de registro
    });
}

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
});

document.addEventListener('DOMContentLoaded', function() {
    const formRegistro = document.querySelector('#form-registro');
    const formLogin = document.querySelector('#form-login');

    if (formRegistro) {
        formRegistro.addEventListener('submit', function(event) {
            event.preventDefault(); // Evita el envío del formulario por defecto

            // Obtén los datos del formulario
            const formData = new FormData(formRegistro);
            const datosUsuario = {};
            formData.forEach((value, key) => (datosUsuario[key] = value));

            // Aquí colocas la URL de tu API de registro
            const urlRegistro = 'http://localhost/phpmyadmin/index.php?route=/sql&pos=0&db=green_details&table=sesiones';

            fetch(urlRegistro, {
                method: 'POST', // Método HTTP para el registro
                headers: {
                    'Content-Type': 'application/json', // Asegúrate de que tu API soporte JSON
                },
                body: JSON.stringify(datosUsuario), // Convertimos los datos del usuario a JSON
            })
            .then(response => response.json())
            .then(data => {
                console.log('Registro exitoso:', data);
                // Redirige al usuario después de un registro exitoso
                window.location.href = '/index.html';
            })
            .catch((error) => {
                console.error('Error en el registro:', error);
                // Aquí deberías manejar el error, por ejemplo, mostrando un mensaje al usuario
            });
        });
    }

    // Manejo del formulario de inicio de sesión
    if (formLogin) {
        formLogin.addEventListener('submit', function(event) {
            event.preventDefault(); // Evita el envío del formulario por defecto

            // Obtén los datos del formulario
            const formData = new FormData(formLogin);
            const datosLogin = {};
            formData.forEach((value, key) => (datosLogin[key] = value));

            // Aquí colocas la URL de tu API de inicio de sesión
            const urlLogin = 'http://localhost/phpmyadmin/index.php?route=/sql&pos=0&db=green_details&table=usuarios';

            fetch(urlLogin, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(datosLogin),
            })
            .then(response => response.json())
            .then(data => {
                console.log('Inicio de sesión exitoso:', data);
                // Redirige al usuario después de un inicio de sesión exitoso
                window.location.href = '/index.html';
            })
            .catch((error) => {
                console.error('Error en el inicio de sesión:', error);
            });
        });
    }
});
