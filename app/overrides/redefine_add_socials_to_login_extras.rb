if Rails.application.railties.all.map(&:railtie_name).include? "spree_social"

  Deface::Override.new(:virtual_path => "spree/user_registrations/new",
                       :name => "add_socials_to_login_extras",
                       :disabled => true)

  Deface::Override.new(:virtual_path => "spree/user_sessions/new",
                       :name => "add_socials_to_login_extras",
                       :disabled => true)

  Deface::Override.new(:virtual_path => "spree/users/show",
                       :name => "add_socials_to_account_summary",
                       :disabled => true)
end
