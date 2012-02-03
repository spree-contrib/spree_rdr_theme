$(document).ready(function() {

    if($('a#edit_wishlist_link').is('*')){
      //handle wishlist edit link (show / hide form)
      $('a#edit_wishlist_link').click(function(){
        if($('#edit_wishlist').is(':visible')){
          $('#edit_wishlist').slideUp();
        }else{
          $('#edit_wishlist').slideDown();
        }

        return false;
      });

      //handle move item link
      $('.move_item a.button').click(function(){
        var move_button = $(this);
        move_button.hide();
        move_button.parent().find('form').fadeIn();
        return false;
      });
    }

    // Remove an item from the cart by setting its quantity to zero and posting the update form
    $('form#updatecart a.delete').show().click(function(){
      $(this).parents('tr').find('input.line_item_quantity').val(0);
      $(this).parents('form').submit();
      return false;
    });

  });
