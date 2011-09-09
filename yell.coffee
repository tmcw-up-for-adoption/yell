nodeio = require 'node.io'

reviews = []

class Yell extends nodeio.JobClass
    input: [1, 2, 3, 4]
    run: (num) ->
        urltemplate = "http://www.yelp.com/user_details_reviews_self?rec_pagestart=#{num * 10}&userid=#{this.options.args[0]}"
        @getHtml urltemplate, (err, $, data) ->
            @exit err if err?
            $('div.review').each (div) ->
                starimg = $('span.star-img img', div)
                stars = if starimg.attribs then parseInt(starimg.attribs.alt) else ''
                return if !$('h4 a', div).text

                if $('h4 a', div).attribs
                    a = $('h4 a', div).attribs.href
                    id = a.match(/\/biz\/([\d\w-]*)/)[1]
                else
                    id = ''

                reviews.push(
                    name: $('h4 a', div).text
                    date: $('div.rating_info em.smaller', div).text
                    text: $('div.review_comment', div).text
                    stars: stars
                    id: id
                )
            @emit reviews

@class = Yell
@job = new Yell()
