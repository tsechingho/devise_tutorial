class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # action name should be the same name as the provider for the request callbacks
  def facebook
    @user = User.find_with_facebook_oauth(env['omniauth.auth'], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', :kind => 'Facebook')
      # sign in user and force all authentication callbacks to be called
      sign_in_and_redirect @user, :event => :authentication
    else
      # The session could automatically be clean up, because Devise removes all the data
      # starting with 'devise.' from the session whenever a user signs in.
      session['devise.facebook_data'] = env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def twitter
    @user = User.find_with_twitter_oauth(env['omniauth.auth'], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', :kind => 'Twitter')
      sign_in_and_redirect @user, :event => :authentication
    else
      session['devise.twitter_data'] = env['omniauth.auth'].except('extra') # avoid CookieOverflow
      redirect_to new_user_registration_url
    end
  end

  # if response get 404, it will trigger OmniAuth process
  # also see call_through_to_app method in OmniAuth::Strategy of oa-core
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end