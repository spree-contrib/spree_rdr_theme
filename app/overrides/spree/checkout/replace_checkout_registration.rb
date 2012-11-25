Deface::Override.new(:virtual_path => %q{spree/checkout/registration},
                          :name => %q{replace_checkout_registration},
                          :replace => %q{#registration},
                          :text => %q{<div id="checkout" role="checkout" class="clearfix">
  <div id="title" role="title">CHECKOUT</div>
  <!-- START MAIN CONTENT -->
  <div id="main-content" role="main-content">
    <%= render "spree/shared/error_messages", :target => @order %>
    <div id="tabs" role="tabs">
      <ul>
        <li class='active'><span class="number">1</span><span class="title">Create an Account</span></li>
        <li><span class="number">2</span><span class="title">Your Address</span></li>
        <li><span class="number">3</span><span class="title">Shipping Options</span></li>
        <li><span class="number">4</span><span class="title">Payment Options</span></li>
        <li><span class="number">5</span><span class="title">Place Order</span></li>
      </ul>
    </div>
    <div id="content" role="content">
      <div id="existing-customer">
        <h2>Existing Customers</h2>
        <p>If you've already registered for an account on you can sign in here:</p>
        <%= render :partial => 'spree/shared/login' %>
      </div>

      <hr>

	    <%= render :template => 'spree/user_registrations/new' %>

      <hr>
      <% if Spree::Config[:allow_guest_checkout] %>
        <div id="guest_checkout" data-hook class="columns omega eight">
          <%= render :partial => 'spree/shared/error_messages', :locals => { :target => @order } %>
          <h2><%= t(:guest_user_account) %></h2>
          <%= form_for @order, :url => update_checkout_registration_path, :method => :put, :html => { :id => 'checkout_form_registration' } do |f| %>
            <p>
              <%= f.label :email, t(:email) %><br />
              <%= f.email_field :email, :class => 'title' %>
            </p>
            <p><%= f.submit t(:continue), :class => 'button primary' %></p>
          <% end %>
        </div>
      <% end %>
    </div>
  </div>
  <!-- END MAIN CONTENT -->
  <%= render 'summary' %>
</div>})
