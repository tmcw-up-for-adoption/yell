fs = require 'fs'
_ = (require 'underscore')._

hreview = _.template('''
<div class="hreview">
  <div class="fn org summary"><%= name %></div>
  <span><span class="rating"><%= stars %></span> out of 5 stars</span>
  <abbr class="dtreviewed" title="20050418T2300-0700"><%= date %></abbr></span>
  <div class="description item vcard"><p>
    <%= text %>
  </p></div>
</div>''')

reviews = fs.readFileSync(process.argv[2], 'utf8').split('\n')
reviews.splice(-1, 1)

for i of reviews
    o = JSON.parse(reviews[i])
    console.log(hreview(o))
