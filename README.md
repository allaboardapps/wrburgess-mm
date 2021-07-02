# Randy Burgess Website

## Hosting

* Netlify

## Framework

* Middleman

## Getting Started

### Pull source

* Install bundler: `gem install bundler`
* Clone repo: `git clone git@github.com:allaboardapps/wrburgess-mm.git`
* Move into local repo: `cd wrburgess-mm`
* Install gems: `bundle`

### Run site locally

* Build and start server: `middleman`
* Visit [http://localhost:3000](http://localhost:3000)

### Debugging

* Try `middleman build --verbose` to get errors posted

### Create posts

* All posts are stored in the `posts/` directory
* Duplicate an existing post with new date values
* Edit values (with markdown) as appropriate
* Adding a post will automatically add an entry to the RSS feed if `published: true` is present in the header

## Quality Control

* FaviconGenerator/Validator, https://realfavicongenerator.net/favicon_checker

## Bump for Release Test
