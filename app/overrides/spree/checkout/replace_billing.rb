Deface::Override.new(:virtual_path => %q{spree/checkout/_address},
                          :name => %q{replace_billing},
                          :replace => %q{#billing[data-hook]},
                          :text => %q{
<div id="content" role="content">
  <h2>Your Billing Information</h2>
  <fieldset id="billing" data-hook>
  <%= form.fields_for :bill_address do |bill_form| %>
    <legend><%= t(:billing_address) %></legend>
    <div class="inner" data-hook="billing_inner">
      <p class="field" id="bfirstname">
        <%= bill_form.label :firstname, t(:first_name) %><span class="req">*</span><br />
        <%= bill_form.text_field :firstname, :class => 'required' %>
      </p>
      <p class="field" id="blastname">
        <%= bill_form.label :lastname, t(:last_name) %><span class="req">*</span><br />
        <%= bill_form.text_field :lastname, :class => 'required' %>
      </p>
      <% if Spree::Config[:company] %>
        <p class="field" id="bcompany">
          <%= bill_form.label :company, t(:company) %><br />
          <%= bill_form.text_field :company %>
        </p>
      <% end %>
      <p class="field" id="baddress1">
        <%= bill_form.label :address1, t(:street_address) %><span class="req">*</span><br />
        <%= bill_form.text_field :address1, :class => 'required' %>
      </p>
      <p class="field" id="baddress2">
        <%= bill_form.label :address2, t(:street_address_2) %><br />
        <%= bill_form.text_field :address2 %>
      </p>

      <p class="field" id="bcity">
        <%= bill_form.label :city, t(:city) %><span class="req">*</span><br />
        <%= bill_form.text_field :city, :class => 'required' %>
      </p>

      <p class="field" id="bcountry">
        <%= bill_form.label :country_id, t(:country) %><span class="req">*</span><br />
        <span id="bcountry">
          <%= bill_form.collection_select :country_id, available_countries, :id, :name, {}, {:class => 'required'} %>
        </span>
      </p>

      <% if Spree::Config[:address_requires_state] %>
        <p class="field" id="bstate">
          <% have_states = !@order.bill_address.country.states.empty? %>
          <%= bill_form.label :state, t(:state) %><span class="req">*</span><br />
          <noscript>
            <%= bill_form.text_field :state_name, :class => 'required' %>
          </noscript>
          <% state_elements = [
             bill_form.collection_select(:state_id, @order.bill_address.country.states,
                                :id, :name,
                                {:include_blank => true},
                                {:class => have_states ? 'required' : 'hidden',
                                :disabled => !have_states}) +
             bill_form.text_field(:state_name,
                                :class => !have_states ? 'required' : 'hidden',
                                :disabled => have_states)
             ].join.gsub('"', "'").gsub("\n", "")
          %>
          <%= javascript_tag do -%>
            document.write("<%== state_elements %>");
          <% end -%>
        </p>
      <% end %>

      <p class="field" id="bzipcode">
        <%= bill_form.label :zipcode, t(:zip) %><span class="req">*</span><br />
        <%= bill_form.text_field :zipcode, :class => 'required' %>
      </p>
      <p class="field" id="bphone">
        <%= bill_form.label :phone, t(:phone) %><span class="req">*</span><br />
        <%= bill_form.text_field :phone, :class => 'required' %>
      </p>
      <% if Spree::Config[:alternative_billing_phone] %>
        <p class="field" id="baltphone">
          <%= bill_form.label :alternative_phone, t(:alternative_phone) %><br />
          <%= bill_form.text_field :alternative_phone %>
        </p>
      <% end %>
    </div>
  <% end %>
</fieldset>
  <hr/>

  <h2>Your Shipping Information</h2>
  <fieldset id="shipping" data-hook>
  <%= form.fields_for :ship_address do |ship_form| %>
    <legend><%= t(:shipping_address) %></legend>
    <p class="field checkbox" data-hook="use_billing">
      <%= check_box_tag 'order[use_billing]', '1', (!(@order.bill_address.empty? && @order.ship_address.empty?) && @order.bill_address.eql?(@order.ship_address)) %> 
      <%= label_tag :order_use_billing, t(:use_billing_address), :id => 'use_billing' %>
    </p>
    <div class="inner" data-hook="shipping_inner">
      <p class="field" id="sfirstname">
        <%= ship_form.label :firstname, t(:first_name) %><span class="req">*</span><br />
        <%= ship_form.text_field :firstname, :class => 'required' %>
      </p>
      <p class="field" id="slastname">
        <%= ship_form.label :lastname, t(:last_name) %><span class="req">*</span><br />
        <%= ship_form.text_field :lastname, :class => 'required' %>
      </p>
      <% if Spree::Config[:company] %>
        <p class="field" id="scompany">
          <%= ship_form.label :company, t(:company) %><br />
          <%= ship_form.text_field :company %>
        </p>
      <% end %>
      <p class="field" id="saddress1">
        <%= ship_form.label :address1, t(:street_address) %><span class="req">*</span><br />
        <%= ship_form.text_field :address1, :class => 'required' %>
      </p>
      <p class="field" id="saddress2">
        <%= ship_form.label :address2, t(:street_address_2) %><br />
        <%= ship_form.text_field :address2 %>
      </p>

      <p class="field" id="scity">
        <%= ship_form.label :city, t(:city) %><span class="req">*</span><br />
        <%= ship_form.text_field :city, :class => 'required' %>
      </p>

      <p class="field" id="scountry">
        <%= ship_form.label :country_id, t(:country) %><span class="req">*</span><br />
        <span id="scountry">
          <%= ship_form.collection_select :country_id, available_countries, :id, :name, {}, {:class => 'required'} %>
        </span>
      </p>

      <% if Spree::Config[:address_requires_state] %>
        <p class="field" id="sstate">
          <% have_states = !@order.ship_address.country.states.empty? %>
          <%= ship_form.label :state, t(:state) %><span class="req">*</span><br />
          <noscript>
            <%= ship_form.text_field :state_name, :class => 'required' %>
          </noscript>
          <% state_elements = [
             ship_form.collection_select(:state_id, @order.ship_address.country.states,
                                :id, :name,
                                {:include_blank => true},
                                {:class => have_states ? 'required' : 'hidden',
                                :disabled => !have_states}) +
             ship_form.text_field(:state_name,
                                :class => !have_states ? 'required' : 'hidden',
                                :disabled => have_states)
             ].join.gsub('"', "'").gsub("\n", "")
          %>
          <%= javascript_tag do -%>
            document.write("<%== state_elements %>");
          <% end %>
        </p>
      <% end %>

      <p class="field" id="szipcode">
        <%= ship_form.label :zipcode, t(:zip) %><span class="req">*</span><br />
        <%= ship_form.text_field :zipcode, :class => 'required' %>
      </p>
      <p class="field" id="sphone">
        <%= ship_form.label :phone, t(:phone) %><span class="req">*</span><br />
        <%= ship_form.text_field :phone, :class => 'required' %>
      </p>
      <% if Spree::Config[:alternative_shipping_phone] %>
        <p class="field" id="saltphone">
          <%= ship_form.label :alternative_phone, t(:alternative_phone) %><br />
          <%= ship_form.text_field :alternative_phone %>
        </p>
      <% end %>
    </div>
  <% end %>
</fieldset>
  <div class="submit"><button type="submit" class="blue">Continue</button></div>
</div>})
