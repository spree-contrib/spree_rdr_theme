Deface::Override.new(:virtual_path => %q{spree/checkout/_delivery},
                          :name => %q{replace_shipping_method},
                          :replace => %q{#shipping_method[data-hook]},
                          :text => %q{<div id="content" role="content">
  <h2>Choose A Shipping Method</h2>
  <ul class="fields">

    <div id="methods">
      <p class="field radios">
        <% @order.rate_hash.each do |shipping_method| %>
          <label>
            <%= radio_button(:order, :shipping_method_id, shipping_method[:id]) %>
            <%= shipping_method[:name] %> <%= number_to_currency shipping_method[:cost] %>
          </label><br />
        <% end %>
      </p>
    </div>
    <% if Spree::Config[:shipping_instructions] && @order.rate_hash.present? %>
      <p id="minstrs" data-hook>
        <%= form.label :special_instructions, t("shipping_instructions") %><br />
        <%= form.text_area :special_instructions, :cols => 40, :rows => 7 %>
      </p>
    <% end %>
  </ul>

  <div class="submit"><button type="submit" class="blue">Continue</button></div>
</div>})
