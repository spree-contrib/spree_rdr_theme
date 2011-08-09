Deface::Override.new(:virtual_path => %q{orders/show},
                     :name => %q{remove_orders_show_header},
                     :remove => %q{h1},
                     :sequence => {:before => 'replace_orders_show' })

