# Description:
#   Output huga hoge foo bar...
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   huga - output huga
#   hubot search <keyword> - send get and post request to `example.com`
#
# Notes:
#   this is an example code for hubot-script.
# 
# Author:
#   katsew

module.exports = (robot) ->

  # hearするとチャットルームのメッセージを監視できる
  # チャットルームで hoge って打ち込むと huga って返す
  # msgオブジェクトの中にはuserNameとかが入ってて、メンション飛ばせたりする
  robot.hear /hoge/i, (msg) ->
    msg.send 'huga'
    msg.send "@#{msg.message.user.name}, foo bar."
    # reply使うとメッセージを送ったユーザーにリプライできるっぽい
    msg.reply 'foooo'

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
