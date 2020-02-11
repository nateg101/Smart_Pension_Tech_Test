# Smart Pension Tech Test

## The Task

1. Write a program that:
a. Receives a log file as an argument (webserver.log is provided) e.g.: ./<parse> webserver.log
b. Returns the following:
list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc...
list of webpages with most unique page views also ordered e.g.:
/about/2 8 unique views /index 5 unique views etc...

## Installation and Usage

1. Clone the directory
2. Run `$ bundle install` to install gems.

To run tests - `$ rspec`

### Usage

1. Navigate to the lib folder of the project directory.
2. In the irb REPL type `require './webserverparser.rb'`
3. Instantiate a WebserverParser class instance like so `parser = WebserverParser.new('full_file_path')`
4. To get an array of pages by most views type `parser.most_views`
5. To get an array of pages by most unique views type `parser.unique_views`

## Approach

* The requirements specified two different requirements - a list of most page views and a list of unique page views. Therefore I decided to tackle these requirements separately, with most page views first.

1. Wrote a test for a method with an output that counted the total visits to a page.
2. I wrote the `#most_views`, `#create_visits` and `#populate_hash` methods in the `WebserverParser` class, running the tests with every change to pass the test.
3. Added further tests to ensure code could accept multiple visits to a page and sort pages from most to least visited.
4. At every stage I wrote a test, then wrote code to try and pass the test.
5. Once I had passed all the tests for most pages visited I repeated the process for unique page views.

## Additional Notes

* Testing - I decided that I would test the output of methods only, rather than all the part way steps in the process to get the output. This decision was taken as it makes it easier to refactor the code, if required, and as there are few steps or methods needed to create the final output.

* Private Methods - As I only wanted to test based on the output it seemed appropriate to make all methods other than `#most_views`, `#unique_views` and `#initialize` methods private. This removed unnecessary requirements for explicitly testing these methods.

* I think my process was initially slowed by being unsure about what data type the information from the log file should be placed in. However, I decided a hash would be the most versatile data type, given that two types of output were required. This is because I could use the webpage as the key and ip address as the value, which would help to count total unique page views.
