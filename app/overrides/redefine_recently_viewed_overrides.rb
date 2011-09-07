if Rails.application.railties.all.map(&:railtie_name).include? "spree_recently_viewed"

  Deface::Override.new(:virtual_path => 'shared/_products',
                       :name => 'add_recently_viewed_products_to_products_index',
                       :disabled => true)

  Deface::Override.new(:virtual_path => 'products/show',
                       :name => 'add_recently_viewed_products_to_products_show',
                       :disabled => true)

  Deface::Override.new(:virtual_path => 'shared/_recently_viewed_products',
                       :name => 'change_title',
                       :replace => 'h3',
                       :text => '<h2>Recently Viewed</h2>')

end
