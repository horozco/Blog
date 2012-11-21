// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
  

$(function(){
  $('.post-to-feed').live("click", function(){
    postToFeed(
      $(this).attr("data-url"),
      $(this).attr("data-title"),
      $(this).attr("data-content")
    );
  })
})  

function postToFeed(url, title, content) {
  console.log(url);
  console.log(title);
  console.log(content);
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

