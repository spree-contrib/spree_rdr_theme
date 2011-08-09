Deface::Override.new(:virtual_path => %q{checkout/payment/_gateway},
                     :name => %q{remove_gateway_icons},
                     :remove => %q{code[erb-loud]:contains('image_tag')},
                     :sequence => {:before => 'replace_gateway_fields' })

