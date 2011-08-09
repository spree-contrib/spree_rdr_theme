Deface::Override.new(:virtual_path => %q{checkout/_confirm},
                          :name => %q{replace_confirm},
                          :replace => %q{#order_details[data-hook]},
                          :text => %q{<div id="content" role="content">
  <div id="order-items" style="padding:0 30px 30px 0">
    <h2>Items In Your Order</h2>
    <ul>
    <% @order.line_items.each do |line_item| %>
      <li>
        <%= line_item.quantity %> <%= line_item.variant.product.name %> for
        <%= number_to_currency (line_item.price * line_item.quantity)-%>
      </li>
    <% end %>
    </ul>
    <%= link_to "edit", cart_path %>
  </div>

  <div id="order-email" style="padding:30px 30px 30px 0">
    <h2>Order Contact Details</h2>
    <h4>Email</h4>
    <%= @order.email %>
  </div>

  <% ["ship", "bill"].each do |addr_type| %>
    <% address = @order.send("#{addr_type}_address") %>
    <div id="order-#{addr_type}_address" style="float:left; padding:30px 30px 30px 0">
      <h4><%= addr_type.capitalize %> Address</h4>
      <p>
        <%= address.full_name %><br />
        <%= address.address1 %><br />
        <% unless address.address2.blank? %>
          <%= address.address2 %><br />
        <% end %>
        <%= address.city %>&nbsp;
        <% if address.state_id.blank? %>
          <br /><%= address.state_name %><br />
        <% else %>
          <%= address.state.abbr %><br />
        <% end %>
        <%= address.country.try(:name) %> <%= address.zipcode %>
      </p>
      <%= link_to "edit", checkout_state_path('payment') %>
    </div>
  <% end %>

    <div id="order-payment" style="padding:30px 30px 30px 0; clear:both">
      <h2>Payment Details</h2>
      <h4><%= @order.payment.payment_method.name %></h4>

      <%= @order.payment.source.name %><br />
      <%= @order.payment.source.display_number %>

      <%= link_to "edit", checkout_state_path('payment') %>
    </div>
  <div>

  </div>
  <div class="submit">
    <button class="blue" type="submit">Place your order</button>
  </div>
</div>})
