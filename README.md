# URL Minitizer

This is a Ruby on Rails web application that shortens URLs to a three digit alphanumeric string.

## Routes
* '/' - Input a URL to shorten
* '/:short' - Go to the url with the short string inputted
* '/urls' - View all URLs
* '/urls/:short' - View a specific URL

All views are also navigable by links as well.

## TODO
* CSS
* Regex Validation of URLs eg http://
* Preview link of URL -- could use the urls#show route, or add a new one
* Test Suite
