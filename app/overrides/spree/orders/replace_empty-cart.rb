Deface::Override.new(:virtual_path => %q{spree/orders/edit},
                          :name => %q{replace_empty-cart},
                          :remove => %q{#empty-cart[data-hook]})
