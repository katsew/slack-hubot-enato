# Description:
#   エナトbot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   疲れた
#   おばさん
#
# Notes:
#   None
# 
# Author:
#   katsew

module.exports = (robot) ->

  # hearするとチャットルームのメッセージを監視できる
  # 疲れたっていうと、お疲れ様って返す
  robot.hear /疲れた|つかれた/i, (msg) ->
    msg.reply 'お疲れ様です。'

  # おばちゃんっていうとお、おばちゃん！？って返す
  robot.hear /おばちゃん|エナトおばちゃん/i, (msg) ->
    msg.reply 'お、おばちゃん！？'

  # respondすると hubot search `something` のようにhubotに命令できる
  # http (get, post) もできたりするので組み合わせると面白いかも
  robot.respond /(.*) さがして|(.*) 探して/i, (msg) ->
    searchText = msg.match[0]
    data =
      hoge: 'hoge'
      fuga: 'fuga'
    robot.http('http://example.com')
      .get() (err, res, body) ->
        if err
          msg.send "sorry, #{msg.message.user.name}. I cannot understand..."
        # 返ってきた値を使って何かする
        msg.send "#{res.data}"
      .post(data) (err, res, body) ->
        # 同上
  robot.respond /いま何時？|いまなんじ？/i, (msg) ->
    DateEnum = ["日", "月", "火", "水", "木", "金", "土"]
    today = new Date()
    aMonth = today.getMonth() + 1
    aDate = today.getDate()
    aDay = today.getDay()
    anHour = today.getHours()
    aMinutes = today.getMinutes()
    aSecond = today.getSeconds()

    theDay = DateEnum[aDay]

    msg.reply "いまは#{anHour}時#{aMinutes}分です。\nあ、ちなみに、今日は#{aMonth}月#{aDate}日#{theDay}曜日です♪"
