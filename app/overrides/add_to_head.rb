Deface::Override.new(:virtual_path => %q{spree/shared/_head},
                          :name => %q{add_to_head},
                          :insert_after => %q{code[erb-loud]:contains('stylesheet_link_tag')},
                          :text => %q{<link href="<%=request.protocol%>fonts.googleapis.com/css?family=Arvo:regular,italic,bold,bolditalic" rel="stylesheet" type="text/css">})
