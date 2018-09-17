# Server-Side JavaScript: HTTP

In this lesson we discuss how to build a web server using NodeJS, and dive into the details of HTTP.

For a lighter overview of HTTP and DNS, see [this lesson in the www track](/lessons/www/http).

# HTTP: File Transfer for the Web

* HTTP: HyperText Transfer Protocol
  * Invented in ~1991 by Tim Berners-Lee as part of the World Wide Web

* Uses TCP/IP: Internet Protocol

* [A Brief History of HTTP](https://hpbn.co/brief-history-of-http/)

# HTTP 0.9 (1991)

* **very** simple protocol, geared towards ease of use and implementation
* **100%** ASCII characters in and out
* Human readability was a goal
* **stateless* meaning "one request, one response, and close"

# HTTP 0.9 protocol

| Step                | Client                    | Server            |
|---------------------|---------------------------|-------------------|
| open connection     | `telnet example.com 80`   |                   |
| request a resource  | `GET /index.html` &#9166; |                   |
| return the resource |                           | `<html><body>...` |

# HTTP 0.9 example

This still works on google.com!

Type this:

```
$ telnet google.com 80
```

  * (on Windows 10 it's [a little complicated](https://social.technet.microsoft.com/wiki/contents/articles/38433.windows-10-enabling-telnet-client.aspx) to enable telnet but it does work eventually)
  * similar with OS X High Sierra
  * if you can't get telnet to work, you can use Postman

then you'll see this:

```
Trying 172.217.11.46...
Connected to google.com.
Escape character is '^]'.
```

then type this and hit <kbd>Enter</kbd>:

```
GET /
```

then you'll see this:

```
HTTP/1.0 200 OK
Date: Sat, 07 Jul 2018 19:50:23 GMT
...

<!doctype html><html>...
```

# LAB: Simple Server

1. Launch your hello world server with `node simple_file.js`
2. *In a separate terminal window*, run `telnet localhost 5000`
3. Type in `GET /` and hit the <kbd>Enter</kbd> key *twice*
4. Look at the output. Is it what you expect? Why or why not?

# HTTP 1.0 (1993-1996)

* same basic idea as HTTP 0.9, but with
  * a version identifier
  * request headers
  * response status line
  * response headers

# HTTP 1.0 protocol

| Step               | Client                              | Server                                                 |
|--------------------|-------------------------------------|--------------------------------------------------------|
| open connection    | `telnet example.com 80`             |                                                        |
| request a resource | `GET /index.html HTTP/1.0`  &#9166; |                                                        |
| request headers    | `User-Agent: Dogscape 1.0` &#9166;  |                                                        |
| blank line         | &#9166;                             |                                                        |
| response status    |                                     | `HTTP/1.0 200 OK`                                      |
| response headers   |                                     | `Content-Type: text/html` <br> `Content-Length: 12340` |
| blank line         |                                     | &#9166;                                                |
| response body      |                                     | `<html><body>...`                                      |

# HTTP 1.0 details

* Request and (part of) Response are still ASCII
* `Content-Type` header allows different file types
  * reused **MIME**: (Multipurpose Internet Mail Extensions) spec for file type names
* `Content-Length` header so the client knows how big a file to expect
* ...and many more headers to help clients and servers work together
