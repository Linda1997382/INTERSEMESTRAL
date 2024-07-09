document.addEventListener('DOMContentLoaded', async function () {
    const WshlstItemsContainer = document.getElementById('Wshlst-items');

    try {
        // Obtener los elementos de la wishlist desde el servidor
        const response = await fetch('http://localhost:3000/api/Wshlst/1'); // Reemplazar con el ID real del usuario
        const WshlstItems = await response.json();

        if (response.ok) {
            // Mostrar los elementos de la wishlist en el contenedor
            WshlstItemsContainer.innerHTML = WshlstItems.map(item => `
                <li class="list-group-item">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5>${item.Titulo}</h5>
                            <p>${item.Descripcion}</p>
                            <small class="text-muted">Precio: $${item.Precio}</small>
                            <small class="text-muted">Fecha de Agregado: ${formatDate(item.FechaAgregado)}</small>
                        </div>
                        <button class="btn btn-sm btn-danger" onclick="removeFromWshlst(${item.ID})">Eliminar</button>
                    </div>
                </li>
            `).join('');

            // Calcular y mostrar el precio total (simulado)
            const totalPrice = WshlstItems.reduce((total, item) => total + item.Precio, 0);
            document.getElementById('total-price').textContent = `$${totalPrice.toFixed(2)}`;
        } else {
            WshlstItemsContainer.innerHTML = '<li class="list-group-item">Error al obtener los detalles de la wishlist</li>';
        }
    } catch (error) {
        WshlstItemsContainer.innerHTML = '<li class="list-group-item">Error al obtener los detalles de la wishlist</li>';
    }
});

// Función para formatear la fecha
function formatDate(dateString) {
    const options = { year: 'numeric', month: 'short', day: 'numeric' };
    return new Date(dateString).toLocaleDateString('es-ES', options);
}

// Función para eliminar un elemento de la wishlist
async function removeFromWishlist(wishlistItemID) {
    try {
        const response = await fetch(`http://localhost:3000/api/Wshlst/${WshlstItemID}`, {
            method: 'DELETE',
        });

        if (response.ok) {
            alert('Producto eliminado de la wishlist');
            location.reload(); // Actualizar la página para reflejar los cambios
        } else {
            alert('Error al eliminar el producto de la wishlist');
        }
    } catch (error) {
        alert('Error al eliminar el producto de la wishlist');
    }
}
// Localizar el usuario y actualizar enlaces
document.addEventListener('DOMContentLoaded', function() {
    const loginLink = document.getElementById('login-link');
    const cartLink = document.getElementById('cart-link');
    const wishlistLink = document.getElementById('wishlist-link');
    const user = JSON.parse(sessionStorage.getItem('user'));
    console.log("Usuario recuperado en wishlist.html:", user);

    if (user) {
        loginLink.href = 'Miperfil.html';
        loginLink.innerHTML = `<i class="fas fa-user"></i> Mi Perfil`;
        cartLink.href = 'cart.html';
        wishlistLink.href = 'wishlist.html';
    } else {
        cartLink.href = 'login.html';
        wishlistLink.href = 'login.html';
    }
});