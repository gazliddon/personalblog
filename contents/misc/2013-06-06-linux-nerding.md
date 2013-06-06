---
title: First Blog Post from Ubuntu
template: article.jade
author: gaz
date: 2013-06-06 16:20
img: 
tags: code linux
---
[emacs]: http://www.emacswiki.org/emacs/EmacsHistory
[wintersmith]: https://github.com/jnordberg/wintersmith
[ubuntu]: http://www.ubuntu.com/
[node]: http://nodejs.org/

<div class='middle'>
<img src='/misc/img/prophead.jpg'>
<div>A propellorhead!</div>
</div>

Hooray!

Got the blog working with the latest version of [Wintersmith][wintersmith] and also now have the development environment working under Linux too. I took the decision to do this work using Emacs and one of the happy outputs of that is I've ended up with a platform agnostic development platform. I previously used the absolutely excellent Sublime Edit for coding and it's also nicely cross platform. The issue I had is the key layouts on mac and Linux are a million miles apart despite being the same program.

What I've found with [Emacs][emacs] is after scaling the near vertical learning curve and tweaking the fuck out of it so it's exactly how I like it those settings map directly ad pretty immediately to my Linux box. In fact all I've done is make a small git repository out of my <code>~/.emacs.d</code> directory and cloned that to the new machine. Works fine. I'm typing this now from [Ubuntu 13.04][ubuntu]. You can find it here [https://github.com/gazliddon/emacs.d](https://github.com/gazliddon/emacs.d)

On top of all that it's amazing editor, shame the initial experience is so alienating but really, it's the daddy.

Getting [node.js][node] and npm working nicely on here was a little more involved and meant psychic reading arcane error messages to find out I needed to delete some thing in my <code>~/.npm</code> directory for no apparent reason. It all works nicely now though. I have an issue with browserify not quite getting the right include path for requiring some of the game related js files I was working on but I'll be able to sort that I'm sure :)

