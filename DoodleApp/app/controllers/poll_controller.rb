class PollController < ActionController::Base
  def doodle
    @all_options = Option.all
    @all_participants = Participant.all

    @all_participant_names_as_a_single_hash = {}
    @all_choices_as_hash_of_hashes = {}
    @all_participants.each do |participant|
      @all_participant_names_as_a_single_hash[participant.id] = participant.participant_name
      @all_choices_as_hash_of_hashes[participant.id] = {}
      participant.options.each do |option|
        @all_choices_as_hash_of_hashes[participant.id][option.id] = true
      end
    end # @all_participants.each do |participant|

    @vote_counts_as_hash = {}
    @all_options.each do |option|
      @vote_counts_as_hash[option.id] = option.participants.count
    end
  end # def doodle

  def addnewoption
    Option.create({:option_name => params[:option_name]})

    redirect_to '/doodle'
  end

  def savenewchoices
    participant =
      Participant
      .create( { :participant_name => params[:your_name] } )

    params
    .keys
    .select { |k| k.start_with?('option') }
    .map { |k| k.gsub(/^option/, '').to_i }
    .each do |option_id|
      attrs = { :participant_id => participant.id,
                :option_id      => option_id }
      ActualChoice.create(attrs)
    end

    redirect_to '/doodle'
  end

  def showeditform_p
    params_participant_id = params[:id].to_i

    @participant = Participant.find_by(:id => params_participant_id)

    @all_options = Option.all

    @choices_as_hash = {}
    @participant.options.each do |option|
      @choices_as_hash[option.id] = true
    end
  end

  def saveeditedchoices
    params_participant_id = params[:id].to_i

    all_options = Option.all

    incoming_choices_as_hash = {}
    params
    .keys
    .select { |k| k.start_with?('option') }
    .map { |k| k.gsub(/^option/, '').to_i }
    .each do |option_id|
      incoming_choices_as_hash[option_id] = true
    end

    existing_choices_as_hash = {}
    Participant
    .find_by(:id => params_participant_id)
    .options
    .each do |option|
      existing_choices_as_hash[option.id] = true
    end

    all_options.each do |option|
      if incoming_choices_as_hash[option.id] != existing_choices_as_hash[option.id]
        attrs = { :option_id      => option.id,
                  :participant_id => params_participant_id }
        choice = existing_choices_as_hash[option.id]
        if choice
          ActualChoice.find_by(attrs).destroy
        else
          ActualChoice.create(attrs)
        end
      end
    end

    redirect_to '/doodle'
  end

  def showeditform_o
    params_option_id = params[:id].to_i

    @option = Option.find_by(:id => params_option_id)
  end

  def saveeditedoption
    params_option_id = params[:id].to_i

    Option
    .find_by(:id => params_option_id)
    .update( { :option_name => params[:new_option_name] } )

    redirect_to '/doodle'
  end

  def resetpolloptions
    ActualChoice.destroy_all
    Participant.destroy_all
    Option.destroy_all

    redirect_to '/doodle'
  end

  def deleteparticipant
    params_participant_id = params[:id].to_i

    participant = Participant.find_by(:id => params_participant_id)

    participant.destroy
    participant.options.destroy_all

    redirect_to '/doodle'
  end
end

