require 'securerandom'
ALLOWED_ID_LENGTH = 6

class ShortenerController < ActionController::Base
  def showinputfield
    @all_pointers = Pointer.all
  end

  def performshortening
    params_long_url = params[:longurl]
    where_to_redirect = '/showbadlongurlerrorpage'
    if params_long_url.start_with?('http://', 'https://')
      pointer = Pointer.find_by(:url => params_long_url)
      if pointer
        session[:cryptic_id_for_longurl] = pointer.cryptic_id
      else
        newly_generated_cryptic_id = ('a'..'f').to_a.sample + SecureRandom.hex[0..4]
        Pointer.create( { :cryptic_id => newly_generated_cryptic_id,
                          :url        => params_long_url } )
        session[:cryptic_id_for_longurl] = newly_generated_cryptic_id
      end
      where_to_redirect = '/showresultofshortening'
    end
    redirect_to where_to_redirect
  end

  def showresultofshortening
    @short_url = "http://#{ request.host_with_port }/#{ session[:cryptic_id_for_longurl] }"
  end

  def redirectorshowbadshorturlerrorpage
    params_cryptic_id = params[:id]
    shape_of_cryptic_id_is_ok =
      params_cryptic_id.length == ALLOWED_ID_LENGTH &&
        params_cryptic_id.gsub(/[^a-z0-9]/, '').length == ALLOWED_ID_LENGTH
    pointer = Pointer.find_by(:cryptic_id => params_cryptic_id)
    if shape_of_cryptic_id_is_ok && pointer
      redirect_to pointer.url
    else
      render 'showbadshorturlerrorpage'
    end
  end
end

