// Function to calculate total cost and display it
var totalPrice = 0;
function calculateTotal() {
    var items = document.querySelectorAll('.items');

    // Iterate over each item
    items.forEach(function(item) {
        var quantity = parseInt(item.querySelector('.quantity-section h4 span').textContent);
        var price = parseFloat(item.querySelector('.price .unit-price').textContent.replace('Rs.', ''));
        var totalItemPrice = quantity * price;
        totalPrice += totalItemPrice;
    });

    // Add delivery charge
    totalPrice += 200;

    // Display the grand total
    document.getElementById('total-price').textContent = 'Rs. ' + totalPrice.toFixed(2);
}

// Call calculateTotal function when the page loads
window.onload = function() {
    calculateTotal();
};




// // Function to handle order button click
// function buy() {

//     localStorage.setItem('ckitems', JSON.stringify(cart_items1));
//     // Send AJAX request to Django view
//     var xh = new XMLHttpRequest();
//     xh.open('POST', '/order/', true);
    
//     // Add CSRF token to the request headers
//     var csrftoken = getCookie('csrftoken');
//     xh.setRequestHeader('X-CSRFToken', csrftoken);

//     xh.setRequestHeader('Content-Type', 'application/json');
//     xh.onreadystatechange = function () {
//         if (xh.readyState === 4) {
//             if (xh.status === 200) {
//                 // Redirect to the checkout page after successful response
//                 window.location.href = '/order/totalPrice';
//                 // alert("Your order has been placed")
//             } else {
//                 // Handle error responses if needed
//             }
//         }
//     };
//     xh.send(localStorage.getItem('ckitems'));
// };




// // Function to handle order button click
// function buy() {
//     // Retrieve cart items from local storage
//     var cartItems = JSON.parse(localStorage.getItem('ckitems'));

//     // Send AJAX request to Django view
//     var xhr = new XMLHttpRequest();
//     xhr.open('POST', '/order/totalPrice/', true);
    
//     // Add CSRF token to the request headers
//     var csrftoken = getCookie('csrftoken');
//     xhr.setRequestHeader('X-CSRFToken', csrftoken);

//     xhr.setRequestHeader('Content-Type', 'application/json');
//     xhr.onreadystatechange = function () {
//         if (xhr.readyState === 4) {
//             if (xhr.status === 200) {
//                 // Redirect to the checkout page after successful response
//                 window.location.href = '/order/totalPrice';
//                 // alert("Your order has been placed")
//             } else {
//                 // Handle error responses if needed
//             }
//         }
//     };
//     // Send cart items as JSON string in the request body
//     xhr.send(JSON.stringify(cartItems));
// }

// Function to handle order button click
function buy() {
    // Retrieve cart items from local storage
    var cartItems = JSON.parse(localStorage.getItem('checkedItems'));

    // Retrieve total price
    var totalPrice = parseFloat(document.getElementById('total-price').textContent.replace('Rs.', ''));

    // Create data object to be sent in the request body
    var requestData = {
        cartItems: cartItems,
        totalPrice: totalPrice
    };

    // Send AJAX request to Django view
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/order/', true);
    
    // Add CSRF token to the request headers
    var csrftoken = getCookie('csrftoken');
    xhr.setRequestHeader('X-CSRFToken', csrftoken);

    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                // Redirect to the checkout page after successful response
                window.location.href = '/order';
                // alert("Your order has been placed")
            } else {
                // Handle error responses if needed
            }
        }
    };
    // Send requestData as JSON string in the request body
    xhr.send(JSON.stringify(requestData));
}



// Function to retrieve CSRF token from cookies
function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
};