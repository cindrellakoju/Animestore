    function increment(productId) {
    var input = document.getElementById('quantity-' + productId);
    var value = parseInt(input.value, 10);
    value = isNaN(value) ? 1 : value;
    value++;
    input.value = value;

  toggleCheckoutButton(); // Update total price
}

// Function to decrement quantity
function decrement(productId) {
  var input = document.getElementById('quantity-' + productId);
  var value = parseInt(input.value, 10);
  value = isNaN(value) ? 1 : value;
  value = value <= 1 ? 1 : value - 1;
  input.value = value;

  toggleCheckoutButton(); // Update total price
}

// Function to calculate total price and toggle checkout button
function toggleCheckoutButton() {
  var checkboxes = document.querySelectorAll('.tickbox input[type="checkbox"]');
  var checkoutButton = document.getElementById('checkout-section');
  var totalPrice = 0;

  for (var i = 0; i < checkboxes.length; i++) {
      var checkbox = checkboxes[i];
      var quantityInput = document.getElementById('quantity-' + checkbox.id);
      var unitPriceElement = checkbox.parentElement.parentElement.querySelector('.unit-price');
      var unitPrice = parseFloat(unitPriceElement.textContent.replace('Rs.', ''));

      if (checkbox.checked) {
          var quantity = parseInt(quantityInput.value);
          totalPrice += quantity * unitPrice;
      }
  }

  // Add delivery charge
  var deliveryCharge = 200;
  totalPrice += deliveryCharge;

  var cartTotalElement = document.getElementById('cart-total');
  var totalSpanElement = cartTotalElement.querySelector('.unit-price');
  totalSpanElement.textContent = 'Rs ' + totalPrice.toFixed(2); // Display total with 2 decimal places

  if (totalPrice > 0) {
      checkoutButton.style.display = 'block';
  } else {
      checkoutButton.style.display = 'none';
  }
}

// Add event listeners to quantity inputs
var quantityInputs = document.querySelectorAll('.quantity-input');
quantityInputs.forEach(function(input) {
  input.addEventListener('change', function() {
      toggleCheckoutButton(); // Update total price
  });
});

// Add event listeners to delete buttons
var deleteButtons = document.querySelectorAll('.delete-btn');
deleteButtons.forEach(function(button) {
  button.addEventListener('click', function() {
      var item = this.closest('.items');
      var checkbox = item.querySelector('input[type="checkbox"]');
      var quantityInput = item.querySelector('.quantity-input');

      checkbox.checked = false;
      quantityInput.value = 1;

      item.remove(); // Remove the item from the DOM

      toggleCheckoutButton(); // Update total price
  });
});