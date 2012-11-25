Deface::Override.new(:virtual_path => %q{spree/checkout/_payment},
                          :name => %q{replace_payment},
                          :replace => %q{#payment[data-hook]},
                          :text => %q{<div id="content" role="content">
  <ul id="payment" class="fields">
    <h2>Your prefered payment option</h2>
    <% @order.available_payment_methods.each do |method| %>
      <li class="options">
        <%= radio_button_tag "order[payments_attributes][][payment_method_id]", method.id, method == @order.payment_method %>
        <label><%= t(method.name, :scope => :payment_methods, :default => method.name) %></label>
      </li>
    <% end %>

    <hr />
    <% @order.available_payment_methods.each_with_index do |method, i| %>
      <%= render "spree/checkout/payment/#{method.method_type}", :payment_method => method, :checked => (@order.try(:payment).try(:payment_method_id) || method.id if i == 0)  %>
    <% end %>
  </ul>
  <br>
  <div class="submit"><button type="submit" class="blue">Continue</button></div>
</div>})
