Deface::Override.new(:virtual_path => %q{spree/checkout/payment/_gateway},
                          :name => %q{remove_cart_code},
                          :remove => %q{[data-hook='cart_code']})
