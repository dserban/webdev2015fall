class StartTheDarkController < ActionController::Base
  def mainpage
    @all_participants =
      Participant
      .where
      .not(:id => 1)
    @all_chosen_activities =
      ChosenActivity
      .where
      .not(:id => 1)
      .map(&:augment)
      .sort { |a, b| b.participant_count <=> a.participant_count }

    if session[:signed_in_user_id]
      id_hash =
        { :id => session[:signed_in_user_id] }
      @signed_in_participant = Participant.find_by(id_hash)

      author_id_hash =
        { :activity_author_id => session[:signed_in_user_id] }
      @allow_new_activity_to_be_authored =
        !ChosenActivity.exists?(author_id_hash)
    end
  end

  def chooseactivity
    params_activity_id = params[:id].to_i

    id_hash = { :id => session[:signed_in_user_id] }
    User
    .find_by(id_hash)
    .update( { :chosen_activity_id => params_activity_id } )

    redirect_to '/mainpage'
  end

  def addactivity
    attrs = { :activity_author_id   => session[:signed_in_user_id],
              :activity_description => params[:activity_description] }
    chosen_activity = ChosenActivity.create(attrs)

    id_hash = { :id => session[:signed_in_user_id] }
    User
    .find_by(id_hash)
    .update( { :chosen_activity_id => chosen_activity.id } )

    redirect_to '/mainpage'
  end

  def signin
    session[:signed_in_user_id] = params[:id].to_i

    redirect_to '/mainpage'
  end

  def signout
    session[:signed_in_user_id] = nil

    redirect_to '/mainpage'
  end
end

