Deface::Override.new(:virtual_path => %q{spree/checkout/_confirm},
                     :name => %q{remove_confirm_buttons},
                     :remove => %q{[data-hook='buttons']})
