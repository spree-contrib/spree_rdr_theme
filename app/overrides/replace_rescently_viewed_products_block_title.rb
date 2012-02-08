Deface::Override.new(:virtual_path => 'shared/_recently_viewed_products',
                     :name => 'replace_rescently_viewed_products_block_title',
                     :replace => "h3",
                     :text => %q{<h2><%= t(:recently_viewed) %></h2>})
