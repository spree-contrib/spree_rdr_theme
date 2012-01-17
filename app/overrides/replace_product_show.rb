Deface::Override.new(:virtual_path => %q{spree/products/show},
                          :name => %q{replace_product_show},
                          :replace => %q{[data-hook='product_show']},
                          :closing_selector => %q{},
                          :text => %q{<div data-hook="product_show">
  <% @body_id = 'product-details' %>

    <%= content_for :banner do %>
      <h1>Products</h1>
      <%= image_tag "store/satellite-radios-bg.jpg", :alt => "Satellite Radios" %>
    <% end %>

    <h2><%= @product.name %></h2>
    <div id="product-images" data-hook>
      <div id="main-image">
        <%= render 'image' %>
      </div>
      <div id="thumbnails" data-hook>
        <%= render 'thumbnails', :product => @product %>
      </div>
      <br><br>
    </div>

    <div id="cart-form"  data-hook="cart_form">
      <%= form_for :order, :url => populate_orders_url do |f| %>
        <div data-hook="inside_product_cart_form" %>
          <% if product_price(@product) %>
            <%= hidden_field_tag (@product.has_variants? ? :quantity : "variants[#{@product.master.id}]"), 1, :class => "title", :size => 3 %>

            <dl class="part-numbers clearfix">
              <dt>PART NUMBER</dt>
              <dd><%= @product.sku %></dd>
            </dl>

            <dl class="prices clearfix">
              <dt>Price</dt>
              <dd><span class="price discounted"><%= number_to_currency (@product.price * 1.2) %></span></dd>
              <dt>Sale Price</dt>
              <dd><span class="price selling"><%= number_to_currency(@product.price) %></span></dd>
            </dl>
            <dl class="shipping">
              <dt>Shipping</dt>
              <dd><span class="price">FREE</span></dd>
            </dl>
            <dl class="stock">
              <dt>In Stock</dt>
              <dd><span class="stock"><%= @product.has_stock? ? "YES" : "NO" %></span></dd>
            </dl>

            <hr />
          <% end %>

          <p><button type="submit">Add to cart</button></p>
        <% end %>
      </div>
    </div>

    <div id="product-description" data-hook="product_description">
        <%= product_description(@product) rescue t("product_has_no_description") %>
    </div>
</div>},
                          :disabled => false,
                          :sequence => 100)

