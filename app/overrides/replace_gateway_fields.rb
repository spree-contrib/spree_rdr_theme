Deface::Override.new(:virtual_path => %q{checkout/payment/_gateway},
                          :name => %q{replace_gateway_fields},
                          :replace => %q{[data-hook='card_number']},
                          :text => %q{<li class="payment_method <%= payment_method.id %>" style="display:<%= checked == payment_method.id ? "block" : "none" %>;">
  <h2>Your Credit Card Information</h2>
  <% ['mastercard', 'visa', 'american-express', 'discover'].each do |card| %>
    <%= image_tag "store/icons/#{card}-curved-32px.png", :alt => card.capitalize %>
  <% end %>
</li>

<li class="payment_method <%= payment_method.id %> three-quart" style="display:<%= checked == payment_method.id ? "block" : "none" %>;">
  <label>Credit card number</label>
  <% options_hash = Rails.env.production? ? {:autocomplete => "off"} : {} %>
  <%= text_field_tag "#{param_prefix}[number]", '', options_hash.merge(:class => 'required', :size => 19, :maxlength => 19) %>
</li>

<li class="payment_method <%= payment_method.id %> quart last" style="display:<%= checked == payment_method.id ? "block" : "none" %>;">
  <label>Security code</label>
  <%= text_field_tag "#{param_prefix}[verification_value]", '', options_hash.merge(:class => 'required', :size => 5) %>
</li>

<li class="payment_method <%= payment_method.id %>" style="display:<%= checked == payment_method.id ? "block" : "none" %>;">
  <label>Expiration</label>
  <%= select_month(Date.today, {:prefix => param_prefix, :field_name => 'month', :use_month_numbers => true}, :class => 'required half') %>
  <%= select_year(Date.today, {:prefix => param_prefix, :field_name => 'year', :start_year => Date.today.year, :end_year => Date.today.year + 15}, :class => 'required half last') %>
</li>})
