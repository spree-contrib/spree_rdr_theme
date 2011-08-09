Deface::Override.new(:virtual_path => %q{user_sessions/new},
                          :name => %q{replace_user_sessions_new},
                          :replace => %q{#existing-customer},
                          :text => %q{<div id="existing-customer" style="margin:50px 4% 0 0;width:48%;float:left;">
    <h2>Existing Customers</h2>
    <p>If you've already registered for an account you can sign in here:</p>
    <%= render :partial => 'shared/login' %>
  </div>

  <div id="new_customers" style="margin:50px 0 0 0;width:48%;float:left;"">
    <h2>New Customers</h2>
    <p>You can register for a new account here on RailsDog Radio below:</p>
    <%= form_for(:user, :url => registration_path(User.new)) do |f| %>

        <% if session[:omniauth] %>
          <p>
            <%= f.label :email, t("email") %>
            <%= f.text_field :email, :class => 'title'  %>
          </p>
        <% else %>
          <%= render 'shared/user_form', :f => f %>
        <% end %>
        <p>
          <button type="submit">Register</button>
        </p>
      <% end %>


  </div>
})
