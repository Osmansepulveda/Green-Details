// Ocultar la ventana emergente cuando se hace clic fuera de ella
window.addEventListener('click', function(event) {
    var ventanaEmergente = document.getElementById("ventana-emergente");
    var carritoIcono = document.querySelector('.carrito-icono');

    if (!ventanaEmergente.contains(event.target) && !carritoIcono.contains(event.target)) {
        ventanaEmergente.style.display = 'none';
    }
});

// Espera a que el DOM esté completamente cargado
document.addEventListener("DOMContentLoaded", function() {
    var btnVolverArriba = document.getElementById('btnVolverArriba');

    // Escucha el evento de scroll de la ventana
    window.addEventListener('scroll', function() {
        // Si la posición de desplazamiento vertical es mayor que 300px, muestra el botón, de lo contrario, ocúltalo
        if (window.scrollY > 300) {
            btnVolverArriba.style.display = 'block';
        } else {
            btnVolverArriba.style.display = 'none';
        }
    });

    // Escucha el evento de click en el botón
    btnVolverArriba.addEventListener('click', function() {
        // Desplaza suavemente hacia arriba
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
});

// Contador y estructura del carrito de compras
let carrito = [];
let contadorCarrito = 0;

// Función para mostrar ventana emergente del carrito
function mostrarVentanaEmergente() {
    const ventanaEmergente = document.getElementById("ventana-emergente");
    ventanaEmergente.style.display = "block";
    actualizarCarrito();
}

// Función para añadir productos al carrito
function añadirAlCarrito(nombre, precio) {
    try {
        // Obtener la imagen del producto
        const botonPresionado = event.target;
        const productoDiv = botonPresionado.closest('.producto');
        const imagenSrc = productoDiv.querySelector('img').src;

        // Animar el botón
        botonPresionado.classList.add('animando');
        setTimeout(() => {
            botonPresionado.classList.remove('animando');
        }, 500);

        // Lógica del carrito
        const productoExistente = carrito.find(producto => producto.nombre === nombre);
        if (productoExistente) {
            // Si el producto ya existe en el carrito, solo aumenta su cantidad en 1
            productoExistente.cantidad++;
        } else {
            // Si es un producto nuevo, agregarlo al carrito y establecer la cantidad en 1
            carrito.push({ 
                nombre, 
                precio, 
                cantidad: 0, // Asegúrate de que la cantidad inicial sea 1
                imagen: imagenSrc 
            });
            contadorCarrito++; // Incrementar el contador solo para productos nuevos
        }

        // Actualizar el contador en la interfaz
        const contadorElemento = document.getElementById("contador-carrito");
        contadorElemento.textContent = carrito.reduce((total, producto) => total + producto.cantidad, 0); // Actualiza el contador total
        contadorElemento.style.display = 'block'; // Asegurarse de que el contador sea visible

        // Mostrar la ventana emergente y actualizar el carrito
        mostrarVentanaEmergente();
        actualizarCarrito();

        console.log('Carrito actualizado:', carrito);
    } catch (error) {
        console.error('Error al añadir al carrito:', error);
    }
}

// Event listeners para botones "Añadir al Carrito"
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll(".btn-añadir").forEach(boton => {
        boton.addEventListener("click", function(e) {
            e.preventDefault();
            const productoDiv = this.closest('.producto');
            const nombre = productoDiv.querySelector('h3').textContent;
            const precioTexto = productoDiv.querySelector('.precio').textContent;
            const precio = precioTexto.replace('Precio: $', '').trim();
            añadirAlCarrito(nombre, precio);
        });
    });
});

// Función para actualizar la visualización del carrito
function actualizarCarrito() {
    const carritoElemento = document.getElementById("contenido-carrito");
    if (!carritoElemento) {
        console.error('No se encontró el elemento contenido-carrito');
        return;
    }
    
    carritoElemento.innerHTML = '';

    if (carrito.length === 0) {
        carritoElemento.innerHTML = '<p>El carrito está vacío</p>';
        return;
    }

    let totalPrecio = 0; // Inicializar el totalizador de precio

    carrito.forEach(producto => {
        const itemCarrito = document.createElement("div");
        itemCarrito.className = 'carrito-item';
        
        // Formatear el precio con separador de miles
        const precioFormateado = Number(producto.precio).toLocaleString('es-CO', {
            style: 'currency',
            currency: 'COP',
            minimumFractionDigits: 0,
            maximumFractionDigits: 0
        });

        // Calcular el total por producto
        const totalProducto = producto.precio * producto.cantidad;
        totalPrecio += totalProducto; // Sumar al totalizador

        itemCarrito.innerHTML = `
            <img src="${producto.imagen}" alt="${producto.nombre}">
            <div class="carrito-item-detalles">
                <div class="carrito-item-nombre">${producto.nombre}</div>
                <div class="carrito-item-precio">${precioFormateado}</div>
                <div class="carrito-item-cantidad">
                    Cantidad: 
                    <button class="btn-disminuir" data-nombre="${producto.nombre}">-</button>
                    ${producto.cantidad}
                    <button class="btn-aumentar" data-nombre="${producto.nombre}">+</button>
                </div>
            </div>
        `;
        
        carritoElemento.appendChild(itemCarrito);
    });

    // Mostrar el totalizador de precio
    const totalFormateado = totalPrecio.toLocaleString('es-CO', {
        style: 'currency',
        currency: 'COP',
        minimumFractionDigits: 0,
        maximumFractionDigits: 0
    });
    carritoElemento.innerHTML += `<div class="total-carrito">Total: ${totalFormateado}</div>`;
}

// Event listeners para aumentar y disminuir cantidad
document.addEventListener('click', function(e) {
    if (e.target.classList.contains('btn-aumentar')) {
        e.preventDefault();
        const nombreProducto = e.target.getAttribute('data-nombre');
        const producto = carrito.find(p => p.nombre === nombreProducto);
        if (producto) {
            producto.cantidad++;
            actualizarCarrito();
            mostrarVentanaEmergente();
        }
    }

    if (e.target.classList.contains('btn-disminuir')) {
        e.preventDefault();
        const nombreProducto = e.target.getAttribute('data-nombre');
        const producto = carrito.find(p => p.nombre === nombreProducto);
        if (producto) {
            producto.cantidad--;
            if (producto.cantidad <= 0) {
                carrito = carrito.filter(p => p.nombre !== nombreProducto); // Eliminar producto si la cantidad es 0
            }
            actualizarCarrito();
            mostrarVentanaEmergente();
        }
    }
});

// Función para vaciar el carrito
function vaciarCarrito() {
    carrito = [];
    contadorCarrito = 0;
    const contadorElemento = document.getElementById("contador-carrito");
    contadorElemento.textContent = '0';
    contadorElemento.style.display = 'none'; // Ocultar el contador al vaciar
    actualizarCarrito();
}

const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');

registerBtn.addEventListener('click', () => {
    container.classList.add("active");
});

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
});

document.addEventListener('DOMContentLoaded', function() {
    const formRegistro = document.querySelector('#form-registro');
    const formLogin = document.querySelector('#form-login');

    if (formRegistro) {
        formRegistro.addEventListener('submit', function(event) {
            event.preventDefault();
            const formData = new FormData(formRegistro);
            const datosUsuario = {};
            formData.forEach((value, key) => (datosUsuario[key] = value));

            const urlRegistro = 'http://localhost:3006/registro';

            fetch(urlRegistro, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(datosUsuario),
            })
            .then(response => response.json())
            .then(data => {
                console.log('Registro exitoso:', data);
                window.location.href = '/index.html';
            })
            .catch((error) => {
                console.error('Error en el registro:', error);
            });
        });
    }

    if (formLogin) {
        formLogin.addEventListener('submit', function(event) {
            event.preventDefault();
            const formData = new FormData(formLogin);
            const datosLogin = {};
            formData.forEach((value, key) => (datosLogin[key] = value));

            const urlLogin = 'http://localhost:3006/login';

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
                window.location.href = '/index.html';
            })
            .catch((error) => {
                console.error('Error en el inicio de sesión:', error);
            });
        });
    }
});
