Deface::Override.new(:virtual_path => %q{spree/checkout/_payment},
                          :name => %q{remove_payment_buttons},
                          :remove => %q{[data-hook='buttons']})
