## Synopsis

Test task.

## API Reference

Routes:
  get /api/v0/pages
  post /api/v0/pages parameter: page_url 

  Can be tested with: curl -i -X POST -H "Content-Type:application/json" -d {\"page_url\":\"https://github.com\"} http://localhost:3000/api/v0/pages

## Tests

Rspec
