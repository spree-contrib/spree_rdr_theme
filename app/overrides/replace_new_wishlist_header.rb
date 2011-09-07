Deface::Override.new(:virtual_path => 'wishlists/new',
                     :name => 'replace_new_wishlist_header',
                     :replace => 'h1',
                     :text => %q{<% @body_id = 'cart' %>
<h1>New Wish List</h1>})
