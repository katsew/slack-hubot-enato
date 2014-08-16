# Description:
#   Output Adult Video by search
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
        video = videos[0].url

        msg.send "@#{msg.message.user.name} Sir! I found the extreamly fucking bitch!!"
        msg.send video