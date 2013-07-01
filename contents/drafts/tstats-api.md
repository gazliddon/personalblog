---
title: TStats REST API
template: article.jade
author: gaz
date: 2013-06-30 21:29
img: 
tags: tags
---
---------------------------------------------
# Overview
The Tstats server provides a simple REST API Towers clients can use to store information about games played and events that happen during those games.

The intended usage is for the client to call the Tstats server when launch to create a session object. The session object stays alive while the game is running and the client can send any significant events to the session.

When the game exits the session should be closed.

---------------------------------------------

# FAQ
**Q: What events can I store?** <br>
**A: Anything you like**
But within reason. This services is designed to take a stream of low

**Q: What format do I send them in?**

**Q: How much data can I send?**

**Q: What if I don't close the session?**

**Q: Is there code to use this in Unity?**

**Q: What is the server address?**


---------------------------------------------
# Suggested Events

- Match Making
  - Looking for matches
  - Joining match

- Game
  - Game started
  - Game completed
  - Game quit

- Tutorial
  - Level started
  - Level completed
  - Level quit

- Misc
- Performance
- Avg, low, peak FPS




---------------------------------------------

# API

| Function                | Notes         |
| ----------------------- |:-------------:|
| POST sessions           | Open a new session |
| PUT sessions/:id/close  | Close an active s
* mession      |
| PUT sessions/:id/event  | Store an event to a session      |

---------------------------------------------

## POST sessions/ - Create A New Session

To create a new session POST to <span class='label label-inverse'>sesssions/</span> with your current client's time. The time is expect in XYZ format as below:

<pre class='prettyprint language-js'>{ clientTime: time // time needs to be a
}</pre>

If the session is successfully created you will be returned an object containing a unique session id:

<pre class='prettyprint language-js'>{ clientTime: '2013-06-30T20:39:25.987Z',
  serverTime: '2013-06-30T20:39:26.015Z',
  ip: '127.0.0.1',
  _id: '51d0977e4218431852000001' }</pre>

You use this session id for any actions on this session

---------------------------------------------

## PUT sesssions/:sessionId/close


---------------------------------------------

## GET sessions/ - Get A List Of All Sessions
You can get a list of all sessions to date



---------------------------------------------

## PUT sessions/:sessionId/event/[event type]

POST.data

<pre class='prettyprint language-js'>{
  clientTime: time, 
  event: [event string]
}</pre>





