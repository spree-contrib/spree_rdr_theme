Deface::Override.new(:virtual_path => %q{spree/checkout/_summary},
                          :name => %q{replace_order_summary'},
                          :replace => %q{[data-hook='order_summary']},
                          :text => %q{<div id="aside" role="aside">
  <div id="order" role="order">

    <h3><%= t(:order_summary) %></h3>

    <table class="items">
      <% for line_item in @order.line_items %>
        <% variant = line_item.variant %>
        <tr>
          <td class="qty">(<%= line_item.quantity %>)</td>
          <td class="description"><%= variant.product.name %></td>
          <td class="price"><%= number_to_currency(line_item.price) %></td>
        </tr>
      <% end %>
    </table>

    <table class="total">
      <tr>
        <th>Subtotal</th>
        <td><%= number_to_currency @order.item_total %></td>
      </tr>
      <% @order.adjustments.each do |adjustment| %>
        <tr>
          <th><%= adjustment.label %></th>
          <td class="amount"><%= number_to_currency adjustment.amount -%></td>
        </tr>
      <% end %>
      <tr class="total">
        <th>Total</th>
        <td><%= number_to_currency @order.total %></td>
      </tr>
    </table>

  </div>
</div>})
