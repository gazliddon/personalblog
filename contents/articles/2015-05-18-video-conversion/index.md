---
title: HTML5 Video
date: 2013-05-18 09:11
author: gaz
tags: blog video ffmpeg tech 
template: article.jade
---
<video width="568" height="320" controls>
  <source src="/articles/2015-05-18-video-conversion/charlie.mp4" type="video/mp4">
  <source src="/articles/2015-05-18-video-conversion/charlie.webm" type="video/webm">
</video>

In this exciting installment I find out how to serve [HTML 5 video][html5video] on my blog. It's a pretty basic solution that's a little mac / *nix centric and only gets me to a place where I'm serving up video for [Chrome][chrome] / [Firefox][firefox] / Safari. Even so it's a good start and wouldn't be too hard

## Here We Go!
I have [a mov file here](./charlie.mov) of my charming son Charlie and want to serve it right here but the don't do that easily. What about HTML 5 though? It's all singing and dancing, use that grandpa!

Unfortunteley [HTML 5 video is a joke][html5wars]. Currently support is more a function of corporate posturing than what's good or valuable for end users. Despite there being a video tag there isn't one format that will work across all popular browsers. If you choose H264 it won't work on Chrome for example.

Even so I'd rather go this route than support the filth that is flash so how do we do that?

The only practical solution seems to be having multiple copies of your videos in different formats and include all of them in your source tag. Like this:

<pre class='prettyprint lang-html'>
&lt;video width=&quot;568&quot; height=&quot;320&quot; controls&gt;
  &lt;source src=&quot;./charlie.mp4&quot; type=&quot;video/mp4&quot;&gt;
  &lt;source src=&quot;./charlie.webm&quot; type=&quot;video/webm&quot;&gt;
&lt;/video&gt;
</pre>

Your browser will display the first one it recognizes. I've gone for mp4 and webm and that gets me Chrome, Firefox and Safari support. Everything else (that'd be IE I guess) can go hang.

## You Need ffmpeg
So how do I get the videos in the format I need? The best way I've found is the excellent command line utility, [ffmpeg][ffmpeg]. I'm on a Mac so it's easy to install using [homebrew][homebrew]. The only problem is a plain install of ffmepg doesn't include the codecs you need to make something HTML 5 friendly. That's no good but it's easy to fix:

The codecs you need are libvpx, libvorbis and x264:

<pre class='prettyprint'>
brew install libvpx
brew install libvorbis
</pre>

Now install ffmpeg with the right configuration. You may have it installed already, check if you have.

<pre class='prettyprint'>
brew info ffmpeg
</pre>

If you have there'll be a load of spew telling you about the version you have, what libs it was compiled with and so on. Best thing to do now is remove it:

<pre class='prettyprint'>
brew remove ffmpeg
</pre>

Now you're ready to reinstall with the correct codecs:

<pre class='prettyprint'>
brew install ffmpeg --with-libvpx --with-libvorbis --with-x264
</pre>

## Convert The Mothers
Whoop! All done and raring to be go. The below command lines convert my charlie.mov into charlie.webm and charlie.mp4:
<pre class='prettyprint'>
ffmpeg -i charlie.mov -vcodec libvpx -acodec libvorbis charlie.webm
ffmpeg -i charlie.mov -vcodec h264 charlie.mp4
</pre>

And that should all work. There's a shed load of other options for ffmepg to control quality, frame rate, size etc that you can research.


[ffmpeg]: http://www.ffmpeg.org/
[homebrew]: http://mxcl.github.io/homebrew/
[html5video]: http://www.w3schools.com/html/html5_video.asp
[html5wars]: http://www.zdnet.com/debate/sure-flash-is-dead-but-are-the-web-video-wars-over/10103874/
[chrome]: https://www.google.com/intl/en_uk/chrome/browser/
[firefox]: http://www.mozilla.org/en-US/firefox/new/

