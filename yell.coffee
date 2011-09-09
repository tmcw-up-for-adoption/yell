nodeio = require 'node.io'

reviews = []

class Yell extends nodeio.JobClass
    input: false
    run: (num) ->
        urltemplate = 'http://www.yelp.com/user_details_reviews_self?rec_pagestart=10&userid=MCMKvbM640pT6NrEoDtbOw'
        @getHtml urltemplate, (err, $, data) ->
            @exit err if err?
            $('div.review').each (div) ->
                starimg = $('span.star-img img', div)
                stars = if starimg.attribs then parseInt(starimg.attribs.alt) else ''
                if $('h4 a', div).attribs
                    a = $('h4 a', div).attribs.href
                    id = a.match(/\/biz\/([\d\w-]*)/)[1]
                else
                    id = ''

                reviews.push(
                    name: $('h4 a', div).text
                    url: $('h4 a', div).text
                    text: $('div.review_comment', div).text
                    stars: stars
                    id: id
                )
            @emit reviews

@class = Yell
@job = new Yell()
