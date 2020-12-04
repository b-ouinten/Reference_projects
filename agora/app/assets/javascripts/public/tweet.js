$(document).ready(() => {
  function showNotification(from, align){
    $.notify({
      icon: "add_alert",
      message: "Félicitation ! Votre proposition a été tweetée, vous pouvez la retrouver sur Twitter avec le hashtag <strong># projet_agora<strong>"
      
    },{
      type: 'success',
      timer: 4000,
      placement: {
        from: from,
        align: align
      }
    });
  }

  let tweetBtn = $('#tweet-btn');
  tweetBtn.click(() => {
    let MyProposalId = $('.my-proposal')[0].id;
    let url = '/proposals/' + MyProposalId; 
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'html',
      data: { tweet: 'tweet' },
      success: () => {
        showNotification('top','center');
      },
      error: (error) => {
        console.log(error);
      }
    });
  })
})