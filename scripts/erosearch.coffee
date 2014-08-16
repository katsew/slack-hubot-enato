# Description:
#   Output Xvideos video by search
#
# Commands:
#   hubot s ero #{String}
#
# Notes:
#   Under 18 years old not allowed to use this command

module.exports = (robot) ->
  robot.respond /s ero (.*)/i, (msg) ->
    msg.send "OK @#{msg.message.user.name}. Wait for a moment, bitch."
    searchQuery = msg.match[1]
    baseUrl = 'http://api.videomania.xxx/videos'
    mySite = encodeURIComponent('http://www.xvideos.com/')
    reqUrl = baseUrl + "?q=#{searchQuery}&consumer_url=#{mySite}"

    robot.http(reqUrl)
      .get() (err, res, body)->
        response = JSON.parse(body).response
        videos = response.videos
        XVIDEOS = new RegExp('xvideos')
        video = null
        for _video in videos
          if XVIDEOS.test(_video.source) is true
            video = _video
            break

        if video?
          msg.send "@#{msg.message.user.name} Sir! I found the extremely fucking bitch!!"
          msg.send video.source
          msg.send """
            > #{video.provider}
            > #{video.title} - #{video.duration}
            > #{video.description}
          """
          msg.send video.thumbnails[0]
        else
          msg.send "@#{msg.message.user.name} Sorry, Sir... I couldn\'t find the bitch..."
          
