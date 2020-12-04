module ProposalsHelper
  def tweet(proposal)
    title = @proposal.title
    first_name = @proposal.user.first_name
    last_name = @proposal.user.last_name
    tweet = "#projet_agora #{first_name} a proposé une initiative citoyenne dans sa ville intitulée : #{title}. Vous aussi ! vous pouvez le faire, cela est possible à travers notre site ! https://agora-prd.herokuapp.com/" 
    TwitterBot.new.tweet(tweet)
  end
end