$(document).ready(() => {
  $('#proposal-filter-btn').click(() => {
    let url = "/cities/" + $('div.my-city').attr('id');
    let categoryIds = [];
      $.each($("#categories option:selected"), function() {            
        categoryIds.push($(this).val());
      });
    let additionalFilter = $('#more_filters option:selected').val();
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'html',
      data: { category_ids: categoryIds, additional_filter: additionalFilter },
      success: (result) => {
        $('div.my-city').remove();        
        let myCity = $(result).filter('div.my-city');
        $('div#filter').after(myCity);
        $('div.no-proposal').remove();
        
        $('.datatables-fn').DataTable({
          "pagingType": "full_numbers",
          "lengthMenu": [
          [10, 25, 50, -1],
          [10, 25, 50, "Tous"]
          ],
          responsive: true,
          language: {
            search: "_INPUT_",
            searchPlaceholder: "Rechercher",
          }
        });
      },
      error: (error) => {
        console.log(error);
      }
    });
  })
})