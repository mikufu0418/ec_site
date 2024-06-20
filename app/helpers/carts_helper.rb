module CartsHelper
    
        def display_cart_link
          if session[:cart_id].present?
            link_to '買い物かごを見る', cart_path(session[:cart_id])
          end
        end
    
end
