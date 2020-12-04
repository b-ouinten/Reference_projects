$(document).ready(() => {
  let file_field = $('#proposal_picture');
  file_field.change(() => {
      let file_field_input = file_field[0];
      if (file_field_input.files && file_field_input.files[0]) {
        let reader = new FileReader();
        
        reader.onload = (e) => {
          $('#picture').attr('src', e.target.result);
        };
      
        reader.readAsDataURL(file_field[0].files[0]);
    };
  })
})