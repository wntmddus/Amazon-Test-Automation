require 'watir'
require 'watir-scroll'

Given (/^that user is on www\.amazon\.com and click sign in button$/) do
  $browser = Watir::Browser.new:firefox
  $browser.goto('https://www.amazon.com')
  $browser.a(:id, "nav-link-accountList").wait_until_present.click
end

Given (/^that user is logging in$/) do
  if $browser.text_field(:id, "ap_password").exist?
    $browser.text_field(:id, "ap_email").set("wntmddussla@naver.com")
    $browser.text_field(:id, "ap_password").set("Sksskdi1!")
    $browser.input(:id, "signInSubmit").click
  else
    $browser.text_field(:id, "ap_email").set("wntmddussla@naver.com")
    $browser.input(:id, "continue").click
    $browser.text_field(:id, "ap_password").wait_until_present
    $browser.text_field(:id, "ap_password").set("Sksskdi1!")
    $browser.input(:id, "signInSubmit").click
  end
end

When (/^user is on main page, insert computer keyword in search field and click search button$/) do
  $browser.text_field(:id, "twotabsearchtextbox").set("computer")
  $browser.send_keys :enter
end

Then (/^relevant item is displayed on web browser$/) do
  keyword = "computer"
  #Search keyword under the results column
  if $browser.div(:id, "resultsCol").text.downcase.include?(keyword)
    p "Search results with #{keyword} has searched"
  else
    p "Search results does not contain keyword"
  end
  $browser.close
end

And (/^click first item in the results$/) do
  $browser.div(:class, ['a-column', 'a-span12', 'a-text-center']).click
end

And (/^click Add to Cart, and if pop up appears, click No Thanks$/) do
  $browser.input(:id, "add-to-cart-button").click
  if $browser.div(:id, "a-popover-7").exist?
    p "Add to your order pop up appeared"
    $browser.button(:id, "siNoCoverage-announce").click
  end
end

Then (/^Added to Cart message displayed$/) do
  if $browser.text.include?("Added to Cart")
    p "Item has been added to cart"
  else
    p "Item has not been added to cart"
  end
  $browser.close
end

When (/^user is on main page, click Cart button$/) do
  $browser.a(:id, "nav-cart").click
end

And (/^click Proceed to checkout$/) do
  $browser.input(:name, "proceedToCheckout").click
end

And (/^if Add on item is suggested, check off Add-on and click Continue to Checkout$/) do
  if $browser.div(:id, "a-popover-3").exist?
    $browser.is(:class, ['a-icon', 'a-icon-checkbox'])[0].clear
    $browser.input(:name, "proceedToCheckout").click
  end
end

And (/^click Place your order$/) do
  #$browser.input(:name, "placeYourOrder1").click
end

Then (/^Thank you for your Purchase message will be displayed$/) do
  if $browser.text.include?("Thank you for your Purchase")
    p "Order successfully completed"
  else
    p "Order has not made"
  end
  $browser.close
end

And (/^click Write a customer review button$/) do
  a = $browser.a(text: 'Write a customer review')
  a.scroll.to :center
  $browser.a(:text, 'Write a customer review').wait_until_present.click
end

And (/^click 5 star$/) do
  $browser.divs(:class, ['a-section', 'a-spacing-none', 'starSprite', 'bigStar', 'clickable', 'rating_5', 'fl'])[0].click
end

And (/^Write a review in text field$/) do
  $browser.textarea(:id, "review-body-text-area-0").set("It is a good product")
end

And (/^click submit button$/) do
  $browser.span(:text, 'Submit').click
end

Then (/^Thanks for your review of item name message will be displayed$/) do
  if $browser.text.include?("Thanks for your review")
    p "Review has been successfully made"
  else
    p "Review has not been made"
  end
  $browser.close
end
