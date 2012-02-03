Deface::Override.new(:virtual_path => %q{spree/checkout/_address},
                          :name => %q{replace_billing},
                          :replace => %q{#billing[data-hook]},
                          :text => %q{<% content_for :javascripts do %>
  <%= javascript_include_tag 'checkout', '/states' %>
<% end %>
<div id="content" role="content">
  <h2>Your Billing Information</h2>
  <%= form.fields_for :bill_address do |bill_form| %>
    <div id="billing">
    <ul class="inner fields">
      <li class="half">
        <%= bill_form.label :firstname, "First Name" %>
        <%= bill_form.text_field :firstname %>
      </li>
      <li class="half last">
        <%= bill_form.label :lastname, "Last Name" %>
        <%= bill_form.text_field :lastname %>
      </li>
      <li>
        <%= bill_form.label :address1, "Shipping address" %>
        <%= bill_form.text_field :address1 %>
      </li>
      <li>
        <%= bill_form.label :address2, "Shipping address 2" %>
        <%= bill_form.text_field :address2 %>
      </li>
      <li>
        <%= bill_form.label :city, "City" %>
        <%= bill_form.text_field :city %>
      </li>
      <li class="half">
        <%= bill_form.label :state, "State" %>
        <span id="bstate">
          <% have_states = !@order.bill_address.country.states.empty? %>
          <noscript>
            <%= bill_form.text_field :state_name, :class => 'required' %>
          </noscript>
          <% state_elements = [
                bill_form.collection_select(:state_id, @order.bill_address.country.states,
                                  :id, :name,
                                  {:include_blank => true},
                                  {:class => have_states ? "required" : "hidden",
                                  :disabled => !have_states}) +
                bill_form.text_field(:state_name,
                                  :class => !have_states ? "required" : "hidden",
                                  :disabled => have_states)
              ].join.gsub('"', "'").gsub("\n", "")
          %>
          <script type="text/javascript" language="javascript" charset="utf-8">
          // <![CDATA[
          document.write("<%= raw state_elements %>");
          // ]]>
          </script>
        </span>
      </li>
      <li class="half last">
        <%= bill_form.label :zipcode, "Postal code" %>
        <%= bill_form.text_field :zipcode %>
      </li>
      <li>
        <%= bill_form.label :country_id, "Country" %>
        <span id="bcountry">
          <%= bill_form.collection_select :country_id, available_countries.uniq.sort, :id, :name %>
        </span>
      </li>
      <li>
        <%= bill_form.label :phone, "Phone" %>
        <%= bill_form.text_field :phone %>
      </li>
    </ul>
    </div>
  <% end %>
  <hr/>

  <h2>Your Shipping Information</h2>
  <%= form.fields_for :ship_address do |ship_form| %>
    <div id="shipping">
      <ul class="fields">
        <li>
          <%= check_box_tag 'order[use_billing]', '1', (!(@order.bill_address.empty? && @order.ship_address.empty?) && @order.bill_address.eql?(@order.ship_address)) %>
          <label class="tick">Use my shipping address</label>
        </li>
      </ul>
      <ul class="inner fields">
        <li class="half">
          <%= ship_form.label :firstname, "First Name" %>
          <%= ship_form.text_field :firstname %>
        </li>
        <li class="half last">
          <%= ship_form.label :lastname, "Last Name" %>
          <%= ship_form.text_field :lastname %>
        </li>
        <li>
          <%= ship_form.label :address1, "Shipping address" %>
          <%= ship_form.text_field :address1 %>
        </li>
        <li>
          <%= ship_form.label :address2, "Shipping address 2" %>
          <%= ship_form.text_field :address2 %>
        </li>
        <li>
          <%= ship_form.label :city, "City" %>
          <%= ship_form.text_field :city %>
        </li>
        <li class="half">
          <%= ship_form.label :state, "State" %>
          <span id="sstate">
            <% have_states = !@order.ship_address.country.states.empty? %>
            <noscript>
              <%= ship_form.text_field :state_name, :class => 'required' %>
            </noscript>
            <% state_elements = [
                  ship_form.collection_select(:state_id, @order.bill_address.country.states,
                                    :id, :name,
                                    {:include_blank => true},
                                    {:class => have_states ? "required" : "hidden",
                                    :disabled => !have_states}) +
                  ship_form.text_field(:state_name,
                                    :class => !have_states ? "required" : "hidden",
                                    :disabled => have_states)
                ].join.gsub('"', "'").gsub("\n", "")
            %>
            <script type="text/javascript" language="javascript" charset="utf-8">
            // <![CDATA[
            document.write("<%= raw state_elements %>");
            // ]]>
            </script>
          </span>
        </li>
        <li class="half last">
          <%= ship_form.label :zipcode, "Postal code" %>
          <%= ship_form.text_field :zipcode %>
        </li>
        <li>
          <%= ship_form.label :country_id, "Country" %>
          <span id="scountry">
            <%= ship_form.collection_select :country_id, Spree::Country.all, :id, :name %>
          </span>
        </li>
        <li>
          <%= ship_form.label :phone, "Phone" %>
          <%= ship_form.text_field :phone %>
        </li>
      </ul>
    </div>

  <% end %>
  <div class="submit"><button type="submit" class="blue">Continue</button></div>
</div>})
