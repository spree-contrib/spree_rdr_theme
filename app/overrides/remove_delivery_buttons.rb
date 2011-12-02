Deface::Override.new(:virtual_path => %q{spree/checkout/_delivery},
                          :name => %q{remove_delivery_buttons},
                          :remove => %q{[data-hook='buttons']})
