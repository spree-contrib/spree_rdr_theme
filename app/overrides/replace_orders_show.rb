Deface::Override.new(:virtual_path => %q{orders/show},
                          :name => %q{replace_orders_show},
                          :replace => %q{#order[data-hook]},
                          :text => %q{<% @body_id = 'cart' %>

<div id="content" role="content">
  <h1>Order details</h1>

  <table id="cart-detail">
    <thead>
      <tr>
        <th colspan="2"><%= t("item") %></th>
        <th><%= t("price") %></th>
        <th>&nbsp;</th>
        <th><%= t("qty") %></th>
        <th>&nbsp;</th>
        <th><%= t("total") %></th>
      </tr>
    </thead>
    <tbody id="line_items">
      <% @order.line_items.each do |line_item| %>
        <%- variant = line_item.variant -%>
        <tr class="<%= cycle('', 'alt') %>">
          <td class="image">
            <% if variant.images.length == 0 %>
              <%= small_image(variant.product) %>
            <% else %>
              <%=  image_tag variant.images.first.attachment.url(:small)   %>
            <% end %>
          </td>
          <td class="description">
            <h4><%= link_to variant.product.name,  product_path(variant.product) %></h4>
            <%= variant_options variant %>
          </td>
          <td class="unit-price">
            <%=  product_price(line_item) %>
          </td>
          <td class="operator">
            X
          </td>
          <td class="quantity">
            <%= line_item.quantity %>
          </td>
          <td class="operator">
            =
          </td>
          <td class="total">
            <%= format_price(product_price(line_item, :format_as_currency => false) * line_item.quantity) unless line_item.quantity.nil? %>
          </td>
        </tr>
      <% end %>
      <tr class="totals">
        <td colspan="6">Item Subtotal</td>
        <td class="totals">
          <%= order_price(@order) %>
        </td>
      </tr>
      <% @order.adjustments.each do |adjustment| %>
        <tr class="totals">
          <td colspan="6">
            <%= adjustment.label %>
          </td>
          <td class="totals">
            <%= number_to_currency adjustment.amount %>
          </td>
        </tr>
      <% end %>
      <tr class="totals">
        <td colspan="6">Total</td>
        <td class="totals">
          <%= number_to_currency @order.total %>
        </td>
      </tr>
    </tbody>
  </table>

  <p class="actions">
    <%=link_to t('back_to_store'), root_path, :class => 'continue' %> &nbsp;
    or &nbsp;
    <%= link_to t("my_account"), account_path, :class => 'button' %>
  </p>

</div>})
