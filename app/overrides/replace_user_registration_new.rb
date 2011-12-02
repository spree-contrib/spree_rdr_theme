 Deface::Override.new(:virtual_path => %q{spree/user_registrations/new},
                          :name => %q{replace_user_registration_new},
                          :replace => %q{#new-customer},
                          :text => %q{<div id="new_customers">
    <h2>New Customers</h2>
    <p>You can register for a new account below:</p>
    <%= form_for(:user, :url => registration_path(User.new)) do |f| %>
      <%= render 'spree/shared/user_form', :f => f %>
      <p>
        <button type="submit">Register</button>
      </p>
    <% end %>
  </div>})
