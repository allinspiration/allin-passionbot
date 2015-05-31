<img src="https://raw.githubusercontent.com/allinspiration/allin-passionbot/master/logo.png" width="200">

# PassionBot.
## The next generation of eSports Robit Waifus,  from SinCo Labs.

WIP


### PassionBot is a clone of a series of scripts from the Triatomic (HipChat Hubot for Heroku) suite.

Dependencies:
- hubot (http://hubot.github.com)
- hubot-hipchat (https://github.com/hipchat/hubot-hipchat)
- generator-hubot (https://github.com/github/generator-hubot)
- yeoman (http://yeoman.io)
- heroku (http://www.heroku.com)

### Configuration

A few scripts (including some installed by default) require environment
variables to be set as a simple form of configuration.

Each script should have a commented header which contains a "Configuration"
section that explains which values it requires to be placed in which variable.
When you have lots of scripts installed this process can be quite labour
intensive. The following shell command can be used as a stop gap until an
easier way to do this has been implemented.

    grep -o 'hubot-[a-z0-9_-]\+' external-scripts.json | \
      xargs -n1 -i sh -c 'sed -n "/^# Configuration/,/^#$/ s/^/{} /p" \
          $(find node_modules/{}/ -name "*.coffee")' | \
        awk -F '#' '{ printf "%-25s %s\n", $1, $2 }'

How to set environment variables will be specific to your operating system.
Rather than recreate the various methods and best practices in achieving this,
it's suggested that you search for a dedicated guide focused on your OS.

## Adapter configuration

This adapter uses the following environment variables:

### HUBOT\_HIPCHAT\_JID

This is your bot's Jabber ID which can be found in your [XMPP/Jabber account settings](https://www.hipchat.com/account/xmpp). It will look something like `123_456@chat.hipchat.com`

### HUBOT\_HIPCHAT\_PASSWORD

This is the password for your bot's HipChat account.

### HUBOT\_HIPCHAT\_ROOMS

Optional. This is a comma separated list of room JIDs that you want your bot to join. You can leave this blank or set it to "All" to have your bot join every room. Room JIDs look like "123_development@conf.hipchat.com" and can be found in the [XMPP/Jabber account settings](https://www.hipchat.com/account/xmpp) - just add "@conf.hipchat.com" to the end of the room's "XMPP/Jabber Name".

### HUBOT\_HIPCHAT\_ROOMS\_BLACKLIST

Optional. This is a comma separated list of room JIDs that should not be joined.

### HUBOT\_HIPCHAT\_JOIN\_ROOMS\_ON\_INVITE

Optional. Setting to `false` will prevent the HipChat adapter from auto-joining rooms when invited.

### HUBOT\_HIPCHAT\_JOIN\_PUBLIC\_ROOMS

Optional. Setting to `false` will prevent the HipChat adapter from auto-joining rooms that are publicly available (i.e. guest-accessible).

### HUBOT\_HIPCHAT\_HOST

Optional. Use to force the host to open the XMPP connection to.

### HUBOT\_HIPCHAT\_XMPP\_DOMAIN

Optional. Set to btf.hipchat.com if using HipChat Server Beta.

### HUBOT\_LOG\_LEVEL

Optional. Set to `debug` to enable detailed debug logging.

### HUBOT\_HIPCHAT\_RECONNECT

Optional. Seting to `false` will prevent the HipChat adapter from auto-reconnecting if it detects a server error or disconnection.

## Scripting

An example script is included at `scripts/example.coffee`, so check it out to
get started.

### Anatomy of a script

If you peek around the script folder, you will see some examples of scripts. For a script to be a script, it needs to:

* live in a directory on the bot script load path (`src/scripts` and `scripts` by default)
* be a `.coffee` or `.js` file
* export a function

By export a function, we just mean:

```coffeescript
module.exports = (robot) ->
  # your code here
```

The `robot` parameter is an instance of Passionbot. At this point, we can start scripting up some awesomeness.

## Hearing and responding

Since this is a chat bot, the most common interactions are based on messages. Passionbot can `hear` messages said in a room or `respond` to messages directly addressed at it. Both methods take a regular expression and a callback function as parameters. For example:

```coffeescript
module.exports = (robot) ->
  robot.hear /badger/i, (res) ->
    # your code here

  robot.respond /open the pod bay doors/i, (res) ->
    # your code here
```

The `robot.hear /badger/` callback is called anytime a message's text matches. For example:

* Stop badgering the witness
* badger me
* what exactly is a badger anyways

The `robot.respond /open the pod bay doors/i` callback is only called for messages that are immediately preceded by the robot's name or alias. If the robot's name is HAL and alias is /, then this callback would be triggered for:

*  hal open the pod bay doors
* HAL: open the pod bay doors
* @HAL open the pod bay doors
* /open the pod bay doors

It wouldn't be called for:

* HAL: please open the pod bay doors
   *  because its `respond` is bound to the text immediately following the robot name
*  has anyone ever mentioned how lovely you are when you open the pod bay doors?
   * because it lacks the robot's name

## Send & reply

The `res` parameter is an instance of `Response` (historically, this parameter was `msg` and you may see other scripts use it this way). With it, you can `send` a message back to the room the `res` came from, `emote` a message to a room (If the given adapter supports it), or `reply` to the person that sent the message. For example:

```coffeescript
module.exports = (robot) ->
  robot.hear /badger/i, (res) ->
    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

  robot.respond /open the pod bay doors/i, (res) ->
    res.reply "I'm afraid I can't let you do that."

  robot.hear /I like pie/i, (res) ->
    res.emote "makes a freshly baked pie"
```

The `robot.hear /badgers/` callback sends a message exactly as specified regardless of who said it, "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS".

If a user Dave says "HAL: open the pod bay doors", `robot.respond /open the pod bay doors/i` callback sends a message "Dave: I'm afraid I can't let you do that."

## Capturing data

So far, our scripts have had static responses, which while amusing, are boring functionality-wise. `res.match` has the result of `match`ing the incoming message against the regular expression. This is just a [JavaScript thing](http://www.w3schools.com/jsref/jsref_match.asp), which ends up being an array with index 0 being the full text matching the expression. If you include capture groups, those will be populated `res.match`. For example, if we update a script like:

```coffeescript
  robot.respond /open the (.*) doors/i, (res) ->
    # your code here
```

If Dave says "HAL: open the pod bay doors", then `res.match[0]` is "open the pod bay doors", and `res.match[1]` is just "pod bay". Now we can start doing more dynamic things:

```coffeescript
  robot.respond /open the (.*) doors/i, (res) ->
    doorType = res.match[1]
    if doorType is "pod bay"
      res.reply "I'm afraid I can't let you do that."
    else
      res.reply "Opening #{doorType} doors"
```

## Making HTTP calls

PassionBot can make HTTP calls on your behalf to integrate & consume third party APIs. This can be through an instance of [node-scoped-http-client](https://github.com/technoweenie/node-scoped-http-client) available at `robot.http`. The simplest case looks like:


```coffeescript
  robot.http("https://midnight-train")
    .get() (err, res, body) ->
      # your code here
```

A post looks like:

```coffeescript
  data = JSON.stringify({
    foo: 'bar'
  })
  robot.http("https://midnight-train")
    .header('Content-Type', 'application/json')
    .post(data) (err, res, body) ->
      # your code here
```


`err` is an error encountered on the way, if one was encountered. You'll generally want to check for this and handle accordingly:

```coffeescript
  robot.http("https://midnight-train")
    .get() (err, res, body) ->
      if err
        res.send "Encountered an error :( #{err}"
        return
      # your code here, knowing it was successful
```

`res` is an instance of node's [http.ServerResponse](http://nodejs.org/api/http.html#http_class_http_serverresponse). Most of the methods don't matter as much when using node-scoped-http-client, but of interest are `statusCode` and `getHeader`. Use `statusCode` to check for the HTTP status code, where usually non-200 means something bad happened. Use `getHeader` for peeking at the header, for example to check for rate limiting:

```coffeescript
  robot.http("https://midnight-train")
    .get() (err, res, body) ->
      # pretend there's error checking code here

      if res.statusCode isnt 200
        res.send "Request didn't come back HTTP 200 :("
        return

      rateLimitRemaining = parseInt res.getHeader('X-RateLimit-Limit') if res.getHeader('X-RateLimit-Limit')
      if rateLimitRemaining and rateLimitRemaining < 1
        res.send "Rate Limit hit, stop believing for awhile"

      # rest of your code
```

`body` is the response's body as a string, the thing you probably care about the most:

```coffeescript
  robot.http("https://midnight-train")
    .get() (err, res, body) ->
      # error checking code here

      res.send "Got back #{body}"
```

### JSON

If you are talking to APIs, the easiest way is going to be JSON because it doesn't require any extra dependencies. When making the `robot.http` call, you should usually set the  `Accept` header to give the API a clue that's what you are expecting back. Once you get the `body` back, you can parse it with `JSON.parse`:

```coffeescript
  robot.http("https://midnight-train")
    .header('Accept', 'application/json')
    .get() (err, res, body) ->
      # error checking code here

      data = JSON.parse(body)
      res.send "#{data.passenger} taking midnight train going #{data.destination}"
```

It's possible to get non-JSON back, like if the API hit an error and it tries to render a normal HTML error instead of JSON. To be on the safe side, you should check the `Content-Type`, and catch any errors while parsing.

```coffeescript
  robot.http("https://midnight-train")
    .header('Accept', 'application/json')
    .get() (err, res, body) ->
      # err & response status checking code here

      if response.getHeader('Content-Type') isnt 'application/json'
        res.send "Didn't get back JSON :("
        return

      data = null
      try
        data = JSON.parse(body)
      catch error
       res.send "Ran into an error parsing JSON :("
       return

      # your code here
```

### XML

XML APIs are harder because there's not a bundled XML parsing library. It's beyond the scope of this documentation to go into detail, but here are a few libraries to check out:

* [xml2json](https://github.com/buglabs/node-xml2json) (simplest to use, but has some limitations)
* [jsdom](https://github.com/tmpvar/jsdom) (JavaScript implementation of the W3C DOM)
* [xml2js](https://github.com/Leonidas-from-XIV/node-xml2js)

### Screen scraping

For those times that there isn't an API, there's always the possibility of screen-scraping. It's beyond the scope of this documentation to go into detail, but here's a few libraries to check out:

* [cheerio](https://github.com/MatthewMueller/cheerio) (familiar syntax and API to jQuery)
* [jsdom](https://github.com/tmpvar/jsdom) (JavaScript implementation of the W3C DOM)


### Advanced HTTP and HTTPS settings

As mentioned, Passionbot uses [node-scoped-http-client](https://github.com/technoweenie/node-scoped-http-client) to provide a simple interface for making HTTP and HTTP requests. Under its hood, it's using node's builtin [http](http://nodejs.org/api/http.html) and [https](http://nodejs.org/api/https.html) libraries, but providing an easy DSL for the most common kinds of interaction.

If you need to control options on http and https more directly, you pass a second argument to `robot.http` that will be passed on to node-scoped-http-client which will be passed on to http and https:

```
  options =
    # don't verify server certificate against a CA, SCARY!
    rejectUnauthorized: false
  robot.http("https://midnight-train", options)
```

In addition, if node-scoped-http-client doesn't suit you, you can can use [http](http://nodejs.org/api/http.html) and [https](http://nodejs.org/api/https.html) yourself directly, or any other node library like [request](https://github.com/request/request).

## Random

A common pattern is to hear or respond to commands, and send with a random funny image or line of text from an array of possibilities. It's annoying to do this in JavaScript and CoffeeScript out of the box, so Hubot includes a convenience method:

```coffeescript
lulz = ['lol', 'rofl', 'lmao']

res.send res.random lulz
```

## Topic

Passionbot can react to a room's topic.

```coffeescript
module.exports = (robot) ->
  robot.topic (res) ->
    res.send "#{res.message.text}? That's a Paddlin'"
```

## Entering and leaving

Passionbot can see users entering and leaving a room.

```coffeescript
enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
leaveReplies = ['Are you still there?', 'Target lost', 'Searching']

module.exports = (robot) ->
  robot.enter (res) ->
    res.send res.random enterReplies
  robot.leave (res) ->
    res.send res.random leaveReplies
```

## Environment variables

Passionbot can access the environment she's running in, just like any other node program, using [`process.env`](http://nodejs.org/api/process.html#process_process_env). This can be used to configure how scripts are run, with the convention being to use the `HUBOT_` prefix.

```coffeescript
answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING

module.exports = (robot) ->
  robot.respond /what is the answer to the ultimate question of life/, (res) ->
    res.send "#{answer}, but what is the question?"
```

Take care to make sure the script can load if it's not defined, give the Hubot developer notes on how to define it, or default to something. It's up to the script writer to decide if that should be a fatal error (e.g. passionbot exits), or not (make any script that relies on it to say it needs to be configured. When possible and when it makes sense to, having a script work without any other configuration is preferred.

Here we can default to something:

```coffeescript
answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING or 42

module.exports = (robot) ->
  robot.respond /what is the answer to the ultimate question of life/, (res) ->
    res.send "#{answer}, but what is the question?"
```

Here we exit if it's not defined:

```coffeescript
answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
unless answer?
  console.log "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  process.exit(1)

module.exports = (robot) ->
  robot.respond /what is the answer to the ultimate question of life/, (res) ->
    res.send "#{answer}, but what is the question?"
```

And lastly, we update the `robot.respond` to check it:

```coffeescript
answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING

module.exports = (robot) ->
  robot.respond /what is the answer to the ultimate question of life/, (res) ->
    unless answer?
      res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
      return
    res.send "#{answer}, but what is the question?"
```

## Dependencies

Passionbot uses [npm](https://github.com/isaacs/npm) to manage its dependencies. To add additional packages, add them to `dependencies` in `package.json`. For example, to add lolimadeupthispackage 1.2.3, it'd look like:

```json
  "dependencies": {
    "hubot":         "2.5.5",
    "hubot-scripts": "2.4.6",
    "lolimadeupthispackage": "1.2.3"
  },
```

If you are using scripts from hubot-scripts, take note of the `Dependencies` documentation in the script to add. They are listed in a format that can be copy & pasted into `package.json`, just make sure to add commas as necessary to make it valid JSON.

# Timeouts and Intervals

Passionbot can run code later using JavaScript's built-in [setTimeout](http://nodejs.org/api/timers.html#timers_settimeout_callback_delay_arg). It takes a callback method, and the amount of time to wait before calling it:

```coffeescript
module.exports = (robot) ->
  robot.respond /you are a little slow/, (res) ->
    setTimeout () ->
      res.send "Who you calling 'slow'?"
    , 60 * 1000
```

Additionally, it can run code on an interval using [setInterval](http://nodejs.org/api/timers.html#timers_setinterval_callback_delay_arg). It takes a callback method, and the amount of time to wait between calls:

```coffeescript
module.exports = (robot) ->
  robot.respond /annoy me/, (res) ->
    res.send "Hey, want to hear the most annoying sound in the world?"
    setInterval () ->
      res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
    , 1000
```

Both `setTimeout` and `setInterval` return the ID of the timeout or interval it created. This can be used to to `clearTimeout` and `clearInterval`.

```coffeescript
module.exports = (robot) ->
  annoyIntervalId = null

  robot.respond /annoy me/, (res) ->
    if annoyIntervalId
      res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
      return

    res.send "Hey, want to hear the most annoying sound in the world?"
    annoyIntervalId = setInterval () ->
      res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
    , 1000

  robot.respond /unannoy me/, (res) ->
    if annoyIntervalId
      res.send "GUYS, GUYS, GUYS!"
      clearInterval(annoyIntervalId) ->
      annoyIntervalId = null
    else
      res.send "Not annoying you right now, am I?"
```

## HTTP Listener

Passionbot includes support for the [express](http://expressjs.com) web framework to serve up HTTP requests. It listens on the port specified by the `EXPRESS_PORT` or `PORT` environment variables (preferred in that order) and defaults to 8080. An instance of an express application is available at `robot.router`. It can be protected with username and password by specifying `EXPRESS_USER` and `EXPRESS_PASSWORD`. It can automatically serve static files by setting `EXPRESS_STATIC`.

The most common use of this is for providing HTTP end points for services with webhooks to push to, and have those show up in chat.


```coffeescript
module.exports = (robot) ->
  robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
    room   = req.params.room
    data   = if req.body.payload? then JSON.parse req.body.payload else req.body
    secret = data.secret

    robot.messageRoom room, "I have a secret: #{secret}"

    res.send 'OK'
```

Test it with curl; also see section on [error handling](#error-handling) below.
```shell
// raw json, must specify Content-Type: application/json
curl -X POST -H "Content-Type: application/json" -d '{"secret":"C-TECH Astronomy"}' http://127.0.0.1:8080/hubot/chatsecrets/general

// defaults Content-Type: application/x-www-form-urlencoded, must st payload=...
curl -d 'payload=%7B%22secret%22%3A%22C-TECH+Astronomy%22%7D' http://127.0.0.1:8080/hubot/chatsecrets/general
```

All endpoint URLs should start with the literal string `/hubot`. This consistency makes it easier to set up webhooks (copy-pasteable URL) and guarantees that URLs are valid in case the bot name is not URL safe.

## Events

Passionbot can also respond to events which can be used to pass data between scripts. This is done by encapsulating node.js's [EventEmitter](http://nodejs.org/api/events.html#events_class_events_eventemitter) with `robot.emit` and `robot.on`.

One use case for this would be to have one script for handling interactions with a service, and then emitting events as they come up. For example, we could have a script that receives data from a GitHub post-commit hook, make that emit commits as they come in, and then have another script act on those commits.

```coffeescript
# src/scripts/github-commits.coffee
module.exports = (robot) ->
  robot.router.post "/hubot/gh-commits", (req, res) ->
    robot.emit "commit", {
        user    : {}, #hubot user object
        repo    : 'https://github.com/github/hubot',
        hash  : '2e1951c089bd865839328592ff673d2f08153643'
    }
```

```coffeescript
# src/scripts/heroku.coffee
module.exports = (robot) ->
  robot.on "commit", (commit) ->
    robot.send commit.user, "Will now deploy #{commit.hash} from #{commit.repo}!"
    #deploy code goes here
```

If you provide an event, it's highly recommended to include a user or room object in its data. This would allow for Passionbot to notify a user or room in chat.

## Error Handling

No code is perfect, and errors and exceptions are to be expected. Previously, an uncaught exceptions would crash your hubot instance. Hubot now includes an `uncaughtException` handler, which provides hooks for scripts to do something about exceptions.

```coffeescript
# src/scripts/does-not-compute.coffee
module.exports = (robot) ->
  robot.error (err, res) ->
    robot.logger.error "DOES NOT COMPUTE"

    if res?
      res.reply "DOES NOT COMPUTE"
```

You can do anything you want here, but you will want to take extra precaution of rescuing and logging errors, particularly with asynchronous code. Otherwise, you might find yourself with recursive errors and not know what is going on.

Under the hood, there is an 'error' event emitted, with the error handlers consuming that event. The uncaughtException handler [technically leaves the process in an unknown state](http://nodejs.org/api/process.html#process_event_uncaughtexception). Therefore, you should rescue your own exceptions whenever possible, and emit them yourself. The first argument is the error emitted, and the second argument is an optional message that generated the error.

Using previous examples:

```coffeescript
  robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
    room = req.params.room
    data = null
    try
      data = JSON.parse req.body.payload
    catch err
      robot.emit 'error', err

    # rest of the code here


  robot.hear /midnight train/i, (res)
    robot.http("https://midnight-train")
      .get() (err, res, body) ->
        if err
          res.reply "Had problems taking the midnight train"
          robot.emit 'error', err, res
          return
        # rest of code here
```

For the second example, it's worth thinking about what messages the user would see. If you have an error handler that replies to the user, you may not need to add a custom message and could send back the error message provided to the `get()` request, but of course it depends on how public you want to be with your exception reporting. 

## Documenting Scripts

Scripts can be documented with comments at the top of their file, for example:

```coffeescript
# Description:
#   <description of the scripts functionality>
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot <trigger> - <what the respond trigger does>
#   <trigger> - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   <github username of the original script author>
```

The most important and user facing of these is `Commands`. At load time, Passionbot looks at the `Commands` section of each scripts, and build a list of all commands. The included `help.coffee` lets a user ask for help across all commands, or with a search. Therefore, documenting the commands make them a lot more discoverable by users.

When documenting commands, here are some best practices:

* Stay on one line. Help commands get sorted, so would insert the second line at an unexpected location, where it probably won't make sense.
* Refer to the Hubot as hubot, even if your hubot is named something else. It will automatically be replaced with the correct name. This makes it easier to share scripts without having to update docs.
* For `robot.respond` documentation, always prefix with `hubot`. Hubot will automatically replace this with your robot's name, or the robot's alias if it has one
* Check out how man pages document themselves. In particular, brackets indicate optional parts, '...' for any number of arguments, etc.

The other sections are more relevant to developers of the bot, particularly dependencies, configuration variables, and notes. All contributions to [hubot-scripts](https://github.com/github/hubot-scripts) should include all these sections that are related to getting up and running with the script.



## Persistence

Passionbot has an in-memory key-value store exposed as `robot.brain` that can be
used to store and retrieve data by scripts.

```coffeescript
robot.respond /have a soda/i, (res) ->
  # Get number of sodas had (coerced to a number).
  sodasHad = robot.brain.get('totalSodas') * 1 or 0

  if sodasHad > 4
    res.reply "I'm too fizzy.."

  else
    res.reply 'Sure!'

    robot.brain.set 'totalSodas', sodasHad+1
robot.respond /sleep it off/i, (res) ->
  robot.brain.set 'totalSodas', 0
  msg.reply 'zzzzz'
```

If the script needs to lookup user data, there are methods on `robot.brain` for looking up one or many users by id, name, or 'fuzzy' matching of name: `userForName`, `userForId`, `userForFuzzyName`, and `usersForFuzzyName`.

```coffeescript
module.exports = (robot) ->

  robot.respond /who is @?([\w .\-]+)\?*$/i, (res) ->
    name = res.match[1].trim()

    users = robot.brain.usersForFuzzyName(name)
    if users.length is 1
      user = users[0]
      # Do something interesting here..

      res.send "#{name} is user - #{user}"
```

## Script Load Order

Scripts are loaded from the `scripts/` directory. They are loaded in alphabetical order, so you can expect a consistent load order of scripts. For example:

* `scripts/1-first.coffee`
* `scripts/_second.coffee`
* `scripts/third.coffee`

## Creating A Script Package

Creating a script package for hubot is very simple. Start by creating a normal
`npm` package. Make sure you add a main file for the entry point (e.g.
`index.js` or `index.coffee`).

In this entry point file you're going to have to export a function that hubot
will use to load the scripts in your package. Below is a simple example for
loading each script in a `./scripts` directory in your package.

```coffeescript
Path = require 'path'

module.exports = (robot) ->
  path = Path.resolve __dirname, 'scripts'
  robot.load path
```

After you've built your `npm` package you can publish it to [npmjs](http://npmjs.org).

##  Persistence

If you are going to use the `hubot-redis-brain` package (strongly suggested),
you will need to add the Redis to Go addon on Heroku which requires a verified
account or you can create an account at [Redis to Go][redistogo] and manually
set the `REDISTOGO_URL` variable.

    % heroku config:add REDISTOGO_URL="..."

If you don't need any persistence feel free to remove the `hubot-redis-brain`
from `external-scripts.json` and you don't need to worry about redis at all.

[redistogo]: https://redistogo.com/

## Deployment

Allin's Heroku server will automatically deploy all changes to the Master branch of this repo. In case of emergency, deployment can be done manually through the Heroku dashboard or Heroku CLI.


## Restart the bot

Try `heroku logs` and `heroku restart` from Heroku CLI if something goes wrong.

## Thanks

Thanks to all who are contributing to this project!
