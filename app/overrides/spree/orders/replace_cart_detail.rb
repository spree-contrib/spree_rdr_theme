Deface::Override.new(:virtual_path => %q{spree/orders/_form},
                          :name => %q{replace_cart_detail},
                          :replace => %q{#cart-detail[data-hook]},
                          :text => %q{<table id="cart-detail" data-hook>
  <thead>
    <tr data-hook="cart_items_headers">
      <th colspan="2"><%= t("item") %></th>
      <th><%= t("price") %></th>
      <th>&nbsp;</th>
      <th><%= t("qty") %></th>
      <th>&nbsp;</th>
      <th><%= t("total") %></th>
      <th>&nbsp;</th>
    </tr>
  </thead>
  <tbody id="line_items" data-hook>
    <%= order_form.fields_for :line_items do |item_form| %>
      <%= render 'line_item', :variant => item_form.object.variant, :line_item => item_form.object, :item_form => item_form %>
    <% end %>
    <tr class="actions">
      <td colspan="4">&nbsp;</td>
      <td colspan="2">
        <button type="submit" class="update"><%= t("update") %></button>
      </td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr class="totals">
      <td colspan="6">&nbsp;</td>
      <td colspan="2" class="totals">
        <%= t(:subtotal) %>: <span class="order-total"><%= @order.item_total %></span>
      </td>
    </tr>
  </tbody>
</table>})
