Feature:
  As a user of blurb application
  Background:
    Scenario: User should be able to see title on product page
      When user is on www.blurb.com/b/7561034-rendez-vous page
      Then user should be able to see title on it

    Scenario: User should be able to perform add to cart function
      When user is on www.blurb.com/b/7561034-rendez-vous page
      And user clicks on Add to Cart Button
      Then user should be able to see the item added on the cart
