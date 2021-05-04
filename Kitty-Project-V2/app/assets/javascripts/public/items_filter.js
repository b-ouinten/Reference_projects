$(document).ready(() => {
  $("#category").change(() => {
    let categoryId = $("#category").val();
    let url = "/categories/" + categoryId + "/items";
    if (categoryId == '') {
      url = '/items';
    }

    const Http = new XMLHttpRequest();
    Http.open("GET", url, true);
    Http.send();

    Http.onreadystatechange = (e) => {
      result = Http.responseText;
      $('div#items-container').remove(); 
      let items_container = $(result).filter('div#items-container');
      $('#category-selector').after(items_container);
    }
  });
});