$(document).ready(() => {
  let quantitySelectors = $('select#quantity');
  quantitySelectors.change((e) => {
    let changedSelector = $(e.target);
    changedSelector.blur();
    let recId = changedSelector.closest('tr').attr('id');
    let quantity = changedSelector.val();
    let cartItemsContainer = changedSelector.closest('div.container');
    let cartItemsContainerId = cartItemsContainer.attr('id') 
    let url = '';
    if (cartItemsContainerId == 'provisional-cart-items') {
      url = '/provisional_cart_items/' + recId;
    } else if (cartItemsContainerId == 'cart-items') {
      url = '/cart_items/' + recId;
    }

    $.ajax({
      url: url,
      type: 'PUT',
      dataType: 'html',
      data: 'quantity=' + quantity,
      success: (result) => {
        let totalQuantities = $(result).filter('p#total-quantities').text();
        let total = $(result).filter('p#total').text();
        $('span#items-count').text(totalQuantities);
        $('td#total-quantities').text(totalQuantities);
        $('td#total').text(total+'€');
      },
      error: (error) => {

      }
    });
  });
});