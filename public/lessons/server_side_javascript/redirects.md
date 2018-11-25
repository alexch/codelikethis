# Redirects

MDN has [a good lesson on redirects](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections), especially the [Use Cases](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections#Use_cases) section.

# Code - redirect

## NodeJS:

```javascript
let path = '/some/resource';
response.statusCode = 302;
response.setHeader('Location', path);
response.write('Redirecting to ' + path);
response.end();
```

## [Express](https://expressjs.com/en/4x/api.html#res.redirect):

```javascript
response.redirect('/some/resource')
```
