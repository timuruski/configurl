# ConfigURL

Automatically parses query params into a single structure.

```
service = ConfigURL.new('https://api.service.com/v1?api_key=abc123')
service.host     #=> 'api.example.com'
service.protocol #=> 'https'
service.api_key  #=> 'abc123'
```

Multiple ways to get the values, for flexibility.

```
service.api_key          #=> 'abc123'
service.params[:api_key] #=> 'abc123'
service.values_at(:host, :api_key) #=> ['api.example.com', 'abc123']
```

Uses path matching to extract values from the path.
```
url = 'https://api.example.com/abc123/v1/def234'
pattern = '/:api_key/:version/:project_id'
service = ConfigURL.new(url, pattern)

service.params[:api_key] #=> 'abc123'
service.api_key #=> 'abc123'
service.version #=> 'v1'
service.project_id #=> 'def'
```
