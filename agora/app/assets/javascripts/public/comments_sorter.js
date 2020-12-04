$(document).ready(() => {
  let CommentsSorter = $('select#comments-sorter');
  CommentsSorter.change(() => {
    let proposalId = $('div.my-proposal').attr('id');
    let url = '/proposals/' + proposalId;
    let sortValue = CommentsSorter .val();
    $.ajax({
      url: url,
      type: 'GET',
      data: { sortValue: sortValue },
      success: (result) => {
        $('div#proposal-comments-container').remove();    
        let updatedProposalCommentsContainer = $(result).filter('div.debate-space').children('div#proposal-comments-container');
        $('div.debate-space').append(updatedProposalCommentsContainer);
      },
      error: (error) => {
        console.log(error);
      }
    })
  });
});