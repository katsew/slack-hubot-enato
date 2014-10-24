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

  # おばさんっていうとお、おばんさん！？って返す
  robot.hear /おばさん/i, (msg) ->
    msg.reply 'お、おばさん！？'

  # respondすると hubot search `something` のようにhubotに命令できる
  # http (get, post) もできたりするので組み合わせると面白いかも
  robot.respond /search (.*)/i, (msg) ->
    searchText = msg.match[1]
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
