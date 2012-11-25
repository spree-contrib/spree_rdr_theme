Deface::Override.new(:virtual_path => %q{spree/shared/_taxonomies},
                          :name => %q{replace_taxonomies},
                          :replace => %q{#taxonomies[data-hook]},
                          :text => %q{<%= render 'spree/shared/all_products' %>})

