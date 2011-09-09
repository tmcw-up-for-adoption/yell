This is a Yelp scraper. It's written to work with [node.io](http://ds.io/qyhaTF),
so it's admittedly a bit easier to use for existing [nodejs](http://nodejs.org)
fanatics.

It's written in [CoffeeScript](http://jashkenas.github.com/coffee-script/) for
kicks.

**Using this code is against the Yelp Terms of Service** because they prevent
users (in section 6B iii of their [terms of service](http://www.yelp.com/static?p=tos&country=US))
against:

> Use any robot, spider, site search/retrieval application, or other automated device, process or means to access, retrieve, scrape, or index any portion of the Service or any Site Content;

However, section 5C makes it very clear that users own their contributed content.

> As between you and Yelp, you own Your Content.

Given that copying-and-pasting ones content out of Yelp is rather inconvenient, in
order to make 5C a reality, this code breaks 6B iii. It's an unfortunate overlap of
code and law.

Yelp, for the most part, is doing a decent job - they publish reviews in
the **hReview** microformat, and have APIs. And it's great that their TOS
is fair in ownership to data. However, their APIs are for businesses,
not users, and their TOS is unfair in access to data.

## Running

    npm install
    node.io yell [your Yelp userid] > my_reviews.json
    node yell_hreview.coffee my_reviews.json > my_reviews.html
