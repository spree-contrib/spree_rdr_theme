Deface::Override.new(:virtual_path => %q{spree/checkout/_address},
                          :name => %q{remove_address_buttons},
                          :remove => %q{[data-hook='buttons']},
                          :closing_selector => %q{})
