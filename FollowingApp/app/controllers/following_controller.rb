class FollowingController < ActionController::Base
  def mainpage
    @all_users = User.order(:user_name)

    if session[:signed_in_user_id]
      id_hash = { :id => session[:signed_in_user_id] }
      @signed_in_user_name =
        User
        .find_by(id_hash)
        .user_name
      user_as_follower =
        Follower
        .find_by(id_hash)
      user_as_followed_person =
        FollowedPerson
        .find_by(id_hash)

      @followed_people =
        user_as_follower
        .followed_people
        .order(:user_name)
      @followed_people_as_set_of_ids =
        @followed_people
        .map(&:id)
        .to_set

      @followers =
        user_as_followed_person
        .followers
        .order(:user_name)

      level_two_followed_people_as_array_of_ids = []
      @followed_people.each do |followed_person|
        followed_person_in_a_follower_role =
          Follower
          .find_by( :id => followed_person.id )
        level_two_followed_people_as_array_of_ids +=
          followed_person_in_a_follower_role
          .followed_people
          .map(&:id)
      end
      people_you_may_know_as_set_of_ids =
        level_two_followed_people_as_array_of_ids.to_set -
        @followed_people_as_set_of_ids -
        [session[:signed_in_user_id]].to_set
      @people_you_may_know =
        User.find(people_you_may_know_as_set_of_ids.to_a)
    end # if session[:signed_in_user_id]
  end # def mainpage

  def signin
    session[:signed_in_user_id] = params[:id].to_i
    redirect_to '/following'
  end

  def signout
    session[:signed_in_user_id] = nil
    redirect_to '/following'
  end

  def togglefollow
    params_user_id = params[:id].to_i

    user_pair_hash = { :follower_id        => session[:signed_in_user_id],
                       :followed_person_id => params_user_id }

    relationship = FollowerRelationship.find_by(user_pair_hash)
    if relationship
      relationship.destroy
    else
      FollowerRelationship.create(user_pair_hash)
    end

    redirect_to '/following'
  end
end

