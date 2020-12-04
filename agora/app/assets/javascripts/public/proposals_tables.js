$(document).ready(function() {
  $('.datatables-s').DataTable({
    "pagingType": "simple",
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
});