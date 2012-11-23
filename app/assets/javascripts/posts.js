$(function(){
  if($('.post-to-feed').length > 0){
    FB.init({appId: $('#facebook_config').val(), status: true, cookie: true});
  }

  $('.post-to-feed').on("click", function(){
    postToFeed(
      $(this).attr("data-url"),
      $(this).attr("data-title"),
      $(this).attr("data-content")
    );
  })
})

function postToFeed(url, title, content) {
  // calling the API ...
  var obj = {
    method: 'feed',
    redirect_uri: url,
    link: url,

    picture: 'http://fbrell.com/f8.jpg',
    name: title,
    caption: content,
    description: 'Posted in Blog S.C.B by: '
  };

  function callback(response) {
    document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
  }

  FB.ui(obj, callback);
}    

