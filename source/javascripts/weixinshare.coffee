title = "山妖卫士"
desc = "基于深度学习的个人电脑反黄软件"
imgUrl = "http://www.shanyaows.com/images/main-icon.png"

try
  #$.post 'http://localhost:3000/wechat_apis/jssdk_sign_package.json&callback',
  #$.post 'http://domain.shanyaows.com/wechat_apis/jssdk_sign_package.json',
  #alert 'start'
  $.ajax
      type : "get",
      url : 'http://domain.shanyaows.com/wechat_apis/jssdk_sign_package?url='+"http://www.shanyaows.com/",
      dataType : "jsonp",
      jsonp: "callback",
      jsonpCallback:"success_jsonpCallback",
      success: (data) ->
        #if data['error'] == 1
        #alert data['appId']
        #alert data['timestamp']
        #alert data['nonceStr']
        #alert data['signature']
        try
          wx.config(
            debug: false
            appId: data['appId']
            timestamp: data['timestamp']
            nonceStr: data['nonceStr']
            signature: data['signature']
            jsApiList: ['showOptionMenu', 'onMenuShareTimeline', 'onMenuShareAppMessage'] )
  
          wx.ready ->
            #alert 'ready'
            #alert desc
            try
              wx.showOptionMenu()
              wx.onMenuShareTimeline title: title, imgUrl: imgUrl, link: 'http://www.shanyaows.com/'
              wx.onMenuShareAppMessage title: title, desc: desc, imgUrl: imgUrl, link: 'http://www.shanyaows.com/'
            catch error
        catch error

catch error
