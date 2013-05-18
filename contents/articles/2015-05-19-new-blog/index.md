---
title: Uh Oh! Boredom
date: 2013-05-18 14:59
author: gaz
tags: blog web
template: article.jade
---

[chrisgranger]: http://www.chris-granger.com/
[lighttable]: http://www.chris-granger.com/lighttable/
[prettyprint]: https://code.google.com/p/google-code-prettify/
[footclub]: http://en.wikipedia.org/wiki/Reflexology
[tumblr]: http://tumblr.com
[wordpress]: http://www.wordpress.com
[jade]: http://jade-lang.com/
[wintersmith]: https://github.com/jnordberg/wintersmith
[githubblog]: https://github.com/gazliddon/personalblog
[dropbox]: https://www.dropbox.com/
[html5video]: /articles/2015-05-18-video-conversion/
[adtime]: http://www.youtube.com/watch?v=EUcXF6R-IOM
[markdown]: http://daringfireball.net/projects/markdown/syntax

![yawner](yawningbaby.jpg) 

It's a really rainy, crappy day today which kind of put the kibosh on outdoor pursuits. Suzie is away at [her foot club course][footclub] so it's just me and Chas. A trip to Monifieth Playpark is firmly off the cards so we're sat here watching the excellent [Adventure Time][adtime].

## New Blog O'Clock

It's a great program but I've seen a lot of them before so in a fit of boredom I've remade my blog and moved it from tumblr. To be honest I've enjoyed the move to [tumblr][tumblr], it's had a bunch of pluses:

* Easy to post to
* A variety post types: links / pics / text / movies
* Quite a nice community
* And even though the posts have been sporadic it's got me writing again

So why move? Apparently tumblr isn't cool :D

And anyway I've always had a passing interest in web tech so I wanted something quick to do that would leave me having learn something so this is it.

## Let's Get Simple

I've tried to take the path that needs the lowest level feasible server tech. I've run blogs before with database back ends, like [Wordpress][wordpress] and though they're really well featured there's a trade between that utility and the effort needed to run them. I had one server hacked because I was running an older version WP than I should have. Realistically I can't guarantee I'll be bothered enough to update stuff like that.

So this is a static site, straight up HTML and CSS. Wow, it's like Geocities days! That said I don't want to write in HTML either so I'm using something called [wintersmith][wintersmith]. It allows me to make my site from templates and write in markdown. I just test what I've written on my machine to see if it works okay and when it does I export a whole brand new static site.

## And It Works!

It's pretty cool. I like the [jade templating language][jade], [markdown][markdown] and it's really easy to slot in javascript when and where you want. It's pretty quick to load as well because there isn't much to load. Even on my hefty Retina Macbook I was getting some juddery scrolling on tumblr. I mean it was a nice template I'd picked but it really put a bit of a strain on both Safari and Chrome.

I wanted to make publishing as simple as possible so I just build the site to Dropbox and it auto-sync to the server. It's backed up by [being on github][githubblog] as well. Using git is pretty cool, I can branch to make drastic changes and merge back in when they're complete. That all seems to work nicely. We'll see.

## To-dones

There's still a lot to do. But a few to-dones as well

* Included prettyprint.js for code syntax highlighting
* Got [HTML 5 video working][html5video] for **most** browsers
* Included bootstrap
* Wrote a few posts
* Added tags
* Got to grips with jade

And I've been a bit cheeky and wholesale nicked the layout from [Chris Granger's site][chrisgranger] (author of the amazing [Light Table][lighttable]). Hope he doesn't mind. I added a few things and aim to do more in the future. All in all it's been a fun distraction.

## Todo
* ~~This Post~~
  * ~~Check and fix links~~

* ~~Get this blog online~~
  * ~~point newblog.zeropager.com @ server~~

* ~~Transfer from tumblr~~
  * ~~point tumblr.zerogpager.com @ tumblr~~
  * ~~point www.zeropager.com, zeropager.com @ server~~

* ~~Content
  * ~~Transfer over last few blog posts~~

* Bugs
  * Archive link doesn't work
  * In fact most side-bar links are broken
  * Need to split into work and personal blogs

* Host resources locally
  * ~~jquery~~
  * prettyprint
  * javascript
  * fonts

* Research
  * Should I host on S3? [Some info here](http://www.webmonkey.com/2013/01/host-your-static-website-on-amazon-s3-no-www-necessary/URL) 
  * How can I add disqus or fb for comments? [Alts to disqus here](http://alternativeto.net/software/disqus/ ) 
  
* Tags
  * Make each one a random color
  * Space them out
  * Get them to link to a tags filter

* Easy post from ipad
  * Can I write md to drop box folder and have it trigger a site rebuild?
  * Or at least a preview?


