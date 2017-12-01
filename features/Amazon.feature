Feature:
  As a user of Amazon web application, I should be able to search for a product,
  add a product in shopping cart, order a product, and write a review with star rating on a product.

  Background:
    Given that user is on www.amazon.com and click sign in button
    Given that user is logging in

    Scenario: Search for a product
      When user is on main page, insert computer keyword in search field and click search button
      Then relevant item is displayed on web browser

    Scenario: Add a product to shopping cart
      When user is on main page, insert computer keyword in search field and click search button
      And click first item in the results
      And click Add to Cart, and if pop up appears, click No Thanks
      Then Added to Cart message displayed

    Scenario: Order a product
      When user is on main page, click Cart button
      And click Proceed to checkout
      And if Add on item is suggested, check off Add-on and click Continue to Checkout
      And click Place your order
      Then Thank you for your Purchase message will be displayed

    Scenario: Write a review with star rating on a product
      When user is on main page, insert computer keyword in search field and click search button
      And click first item in the results
      And click Write a customer review button
      And click 5 star
      And Write a review in text field
      And click submit button
      Then Thanks for your review of item name message will be displayed
