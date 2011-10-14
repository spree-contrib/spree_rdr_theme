Deface::Override.new(:virtual_path => %q{user_sessions/new},
                          :name => %q{replace_user_sessions_new},
                          :replace => %q{#existing-customer},
                          :text => %q{
<% if Rails.application.railties.all.map(&:railtie_name).include? "spree_social" %>
<%= render 'shared/social_users' %>
<% end %>
<div id="local_login">

  <div id="existing-customer">
    <h2>Existing Customers</h2>
    <p>If you've already registered for an account you can sign in here:</p>
    <%= render :partial => 'shared/login' %>
  </div>

  <hr/>

  <div id="new_customers">
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
</div>
})
