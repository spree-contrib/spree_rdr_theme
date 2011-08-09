Deface::Override.new(:virtual_path => %q{checkout/edit},
                          :name => %q{replace_checkout},
                          :replace => %q{#checkout[data-hook]},
                          :closing_selector => %q{},
                          :text => %q{<div id="checkout" role="checkout" class="clearfix">
  <div id="title" role="title">CHECKOUT</div>
  <!-- START MAIN CONTENT -->
  <div id="main-content" role="main-content">
    <%= render "shared/error_messages", :target => @order %>
    <div id="tabs" role="tabs">
      <ul>
        <li><span class="number">1</span><span class="title">Create an Account</span></li>
        <li <%= @order.address?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">2</span><span class="title">Your Address</span></li>
        <li <%= @order.delivery?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">3</span><span class="title">Shipping Options</span></li>
        <li <%= @order.payment?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">4</span><span class="title">Payment Options</span></li>
        <li <%= @order.confirm? && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">5</span><span class="title">Place Order</span></li>
      </ul>
    </div>
    <%= form_for @order, :url => update_checkout_path(@order.state) do |form| %>
      <%= render @order.state, :form => form %>
    <% end %>
  </div>
  <!-- END MAIN CONTENT -->
  <%= render 'summary' %>
</div>})
