Deface::Override.new(:virtual_path => %q{spree/shared/_login},
                     :name => %q{tweak_remember_me_login},
                     :replace => %q{p label},
                     :text => %q{<%= f.check_box :remember_me %>
    <%= f.label :remember_me, t('remember_me'), :class => 'tick' %>
    <%= link_to t("forgot_password"), new_user_password_path, {:style => "float:right;"} %>})
