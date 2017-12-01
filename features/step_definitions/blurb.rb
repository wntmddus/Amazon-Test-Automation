require 'watir'

When (/^user is on www\.blurb\.com\/b\/7561034-rendez-vous page$/) do
  $browser = Watir::Browser.new:firefox
  $browser.goto('http://www.blurb.com/b/7561034-rendez-vous')
end

Then (/^user should be able to see title on it$/) do
  if $browser.h3s(:class, 'book-title')[0].text == "Rendez-vous"
    p "title Rendez-vous exists"
  else
    p "title Rendez-vous does not exists"
  end
  $browser.close
end

And (/^user clicks on Add to Cart Button$/) do
  $browser.input(:id, 'add_to_cart_button').click
end

Then (/^user should be able to see the item added on the cart$/) do
  if $browser.ps(:class, 'book_title')[0].text == "Rendez-vous" && $browser.input(:id, 'li_0').value.to_i > 0
    p "item is successfully added to cart"
  else
    p "item has not successfully added to cart"
  end
  $browser.close
end
