require_once('TwitterAPIExchange.php');

// Set up your settings with the keys you get from the dev site
$settings = array(
    'oauth_access_token' => '1040471151099752448-uiDEWrKa3RyHnLMToNG55SqnEt3PKj',
    'oauth_access_token_secret' => 'zFgt6DgfzZG2EgsfBv88zhHTsPbWAnOcMQWtXxwddbSxC',
    'consumer_key' => 'zFgt6DgfzZG2EgsfBv88zhHTsPbWAnOcMQWtXxwddbSxC',
    'consumer_secret' => '4GP0owVlQpZ9Kt9yVHfBBmNa2IENUTvIOgIYaOno0TgKbW0cki'
);

// Chooose the url you want from the docs, this is the users/show
$url = 'https://api.twitter.com/1.1/users/show.json';
// The request method, according to the docs, is GET, not POST
$requestMethod = 'GET';

// Set up your get string, we're using my screen name here
$getfield = '?screen_name=j7mbo';

// Create the object
$twitter = new TwitterAPIExchange($settings);

// Make the request and get the response into the $json variable
$json =  $twitter->setGetfield($getfield)
                 ->buildOauth($url, $requestMethod)
                 ->performRequest();

// It's json, so decode it into an array
$result = json_decode($json);

// Access the profile_image_url element in the array
echo $result->profile_image_url;