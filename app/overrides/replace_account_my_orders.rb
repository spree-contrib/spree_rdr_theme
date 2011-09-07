Deface::Override.new(:virtual_path => %q{users/show},
                          :name => %q{replace_account_my_orders},
                          :replace => %q{[data-hook='account_my_orders']},
                          :sequence => {:after => 'remove_account_summary' },
                          :text => %q{<div data-hook="account_my_orders">
<h3><%= t("my_orders") %></h3>
<% if @orders.present? %>
  <table id="cart-detail">
    <thead>
      <tr>
        <th><%= t("order_number") %></th>
        <th><%= t("order_date") %></th>
        <th><%= t("status") %></th>
        <th><%= t("shipment_state") %></th>
        <th><%= t("total") %></th>
      </tr>
    </thead>
    <tbody>
    <% @orders.each do |order| %>
      <tr class="<%= cycle('even', 'odd') %>">
        <td><%= link_to order.number, order_url(order) %></td>
        <td class="normal"><%=order.created_at.to_date%></td>
        <td class="normal"><%= t(order.state).titleize %></td>
        <td class="normal"><%= order.shipment_state.capitalize %></td>
        <td class="normal"><%= number_to_currency order.total %></td>
      </tr>
    <% end %>
    </tbody>
  </table>
<% else %>
  <p><%= t(:you_have_no_orders_yet) %></p>
<% end %>
</div>
<div data-hook="account_summary"></div>

})
