Deface::Override.new(:virtual_path => %q{shared/_head},
                          :name => %q{add_to_head},
                          :replace => %q{code[erb-loud]:contains('stylesheet_link_tag')},
                          :closing_selector => %q{},
                          :text => %q{<link href="<%=request.protocol%>fonts.googleapis.com/css?family=Arvo:regular,italic,bold,bolditalic" rel="stylesheet" type="text/css" >
<%= stylesheet_link_tag 'rdr' %>},
                          :disabled => false,
                          :sequence => 100)

