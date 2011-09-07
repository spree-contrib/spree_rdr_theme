if Rails.application.railties.all.map(&:railtie_name).include? "spree_social"

  Deface::Override.new(:virtual_path => "user_registrations/new",
                       :name => "add_socials_to_login_extras",
                       :disabled => true)

  Deface::Override.new(:virtual_path => "user_sessions/new",
                       :name => "add_socials_to_login_extras",
                       :disabled => true)

end
