<?php
require_once('twitter_proxy.php');
// Twitter OAuth Config options
$oauth_access_token = '1040471151099752448-uiDEWrKa3RyHnLMToNG55SqnEt3PKj';
$oauth_access_token_secret = 'zFgt6DgfzZG2EgsfBv88zhHTsPbWAnOcMQWtXxwddbSxC';
$consumer_key = '0Dj3eQ9dbtMOtCFHO8QmHGyKf';
$consumer_secret = '4GP0owVlQpZ9Kt9yVHfBBmNa2IENUTvIOgIYaOno0TgKbW0cki';
$user_id = '1040471151099752448';
$screen_name = 'neiltyson';
$count = 20;
$twitter_url = 'statuses/user_timeline.json';
$twitter_url .= '?user_id=' . $user_id;
$twitter_url .= '&screen_name=' . $screen_name;
$twitter_url .= '&count=' . $count;
// Create a Twitter Proxy object from our twitter_proxy.php class
$twitter_proxy = new TwitterProxy(
	$oauth_access_token,			// 'Access token' on https://apps.twitter.com
	$oauth_access_token_secret,		// 'Access token secret' on https://apps.twitter.com
	$consumer_key,					// 'API key' on https://apps.twitter.com
	$consumer_secret,				// 'API secret' on https://apps.twitter.com
	$user_id,						// User id (http://gettwitterid.com/)
	$screen_name,					// Twitter handle
	$count							// The number of tweets to pull out
);
// Invoke the get method to retrieve results via a cURL request
$tweets = $twitter_proxy->get($twitter_url);
echo $tweets;
?>