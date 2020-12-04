class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @categories = Category.all
    
    # For proposals filter in city page (data comming from AJAX request, see filter public/filter.js)
    category_ids = params[:category_ids]
    additional_filter = params[:additional_filter]
    
    if (category_ids.nil? && additional_filter.nil?) # no data comming from AJAX request, REST request case
      @proposals = @city.proposals.where(is_online: true).sort { |p1, p2| p2.votes_count <=> p1.votes_count }
    else  # There are a data comming from AJAX request, so it's the AJAX request
      if category_ids
        @proposals = @city.proposals.where(is_online: true, category_id: category_ids)
      else
        @proposals = @city.proposals.where(is_online: true)
      end

      case additional_filter
      when '1' #
        @proposals = @proposals.order('created_at').reverse
      when '2', '' #
        @proposals = @proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }
      when '3' #
        @proposals = @proposals.sort { |p1, p2| p2.comments_count <=> p1.comments_count }
      end
    end

    @ongoing_proposals = @proposals.select { |p| !p.is_expired? && p.votes_count < 5 }
    @completed_proposals = @proposals.select { |p| p.is_expired? || p.votes_count >= 5 }
  end
end