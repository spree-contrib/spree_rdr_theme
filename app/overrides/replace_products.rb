Deface::Override.new(:virtual_path => %q{spree/shared/_products},
                          :name => %q{replace_products},
                          :replace => %q{#products[data-hook]},
                          :closing_selector => %q{},
                          :text => %q{<% @body_id = 'product-list' %>

<div class="list" id="products" data-hook>
<% products.each do |product| %>
  <% if Spree::Config[:show_zero_stock_products] || product.has_stock? %>
    <div class="product">
      <h2><%= link_to product.name, product_path(product) %></h2>
      <p class="image">
      </p>
      <div class="details">
        <p class="stock"><%= product.has_stock? ? "IN STOCK" : "OUT OF STOCK" %></p>
        <p class="prices">
          <span class="price discounted"><%= number_to_currency(product.price * 1.2) %></span>&nbsp;
          <span class="price selling"><%= number_to_currency(product.price) %></span></p>
        <p><%= link_to 'View More', product_path(product), :class => 'button' %></p>
      </div>
      <p class="description">
        <%= truncate strip_tags(product.description), :length => 300 %>
      </p>
    </div>
  <% end %>
<% end %>
</div>})
