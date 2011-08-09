Deface::Override.new(:virtual_path => %q{checkout/registration},
                     :name => %q{remove_checkout_registration_header},
                     :remove => %q{h2},
                     :sequence => {:before => 'replace_checkout_registration' })
