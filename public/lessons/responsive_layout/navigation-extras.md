# Navigation Extras

Additional navigational elements for web pages

# Drop-downs

# Breadcrumbs

# Site Maps

Sitemaps are a tool to discover pages within a web site used by:

  * Users of assistive technologies
  * Search engines
  * User experience designers

```txt
User-agent: *
Disallow:

SITEMAP: http://www.my-amazing-website.com/sitemap.txt
```

## Tools
  * [XML-Sitemaps](https://www.xml-sitemaps.com/)

## Links

Tech Overview: [robots.txt / sitemap.txt / sitemap.xml](http://www.my-amazing-website.com/robots-sitemaps.html)
Google: [Google Webmasters Site Map Guide](https://support.google.com/webmasters/answer/183668?hl=en&ref_topic=4581190)

# Site Map Text File

Located at `www.my-amazing-website.com/sitemap.txt`

```txt

http://www.my-amazing-website.com/
http://www.my-amazing-website.com/index.html
http://www.my-amazing-website.com/about.html
http://www.my-amazing-website.com/contact.html
http://www.my-amazing-website.com/resume.html
http://www.my-amazing-website.com/portfolio.html
```

# Site Map XML File

Located at `www.my-amazing-website.com/sitemap.xml`

```xml

<?xml version="1.0" encoding="UTF-8"?>
<urlset
    xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
                        http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
  <url>
    <loc>http://www.my-amazing-website.com/</loc>
    <priority>1.00</priority>
    <changefreq>weekly</changefreq>
  </url>
  <url>
    <loc>http://www.my-amazing-website.com/index.html</loc>
    <priority>0.80</priority>
    <changefreq>weekly</changefreq>
  </url>
  <url>
    <loc>http://www.my-amazing-website.com/about.html</loc>
    <priority>0.80</priority>
    <changefreq>weekly</changefreq>
  </url>
  <url>
    <loc>http://www.my-amazing-website.com/contact.html</loc>
    <priority>0.80</priority>
    <changefreq>weekly</changefreq>
  </url>
  <url>
    <loc>http://www.my-amazing-website.com/resume.html</loc>
    <priority>0.80</priority>
    <changefreq>weekly</changefreq>
  </url>
  <url>
    <loc>http://www.my-amazing-website.com/portfolio.html</loc>
    <priority>0.80</priority>
    <changefreq>weekly</changefreq>
  </url>
</urlset>
```
