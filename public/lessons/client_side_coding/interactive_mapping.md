# Introduction to LeafletJS

* LeafletJS is a JavaScript **library** which allows for the creation of and interaction with web maps.
* It uses a simple API for building maps using **Layers**
* It allows for styling of the map layers using standard CSS and manipulation with JavaScript

# Simple Map Example

* Let's make a simple map!

![Leaflet Map](/images/simple-map-leaflet.png)

```js
var map = L.map('map').setView([51.505, -0.09], 13);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

L.marker([51.5, -0.09]).addTo(map)
    .bindPopup('A pretty CSS3 popup.<br> Easily customizable.')
    .openPopup();
```

# Installation

Include the CSS and JavaScript in the Head of the HTML page

**Add the CSS First**

```html
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css"/>
```

**Then the JavaScript**

> Make sure you put this AFTER Leaflet's CSS

```html
 <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"></script>
```

**Then create the map container**

```html
<div id="mapid"></div>
```

**Then use CSS to create a height for the container**

```css

#mapid {
  height: 400px;
}
```

# Using a Basemap

* Basemaps are composed of **Tiles** that show:
  - roads
  - features
  - labels
* You add the basemap to the **map container**

### Mapbox Basemap Example

```js
L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
  {
    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
  }).addTo(mymap);
```

Basemap providers for LeafletJS
<https://leaflet-extras.github.io/leaflet-providers/preview/>

# What the L ?

* **L** is the **global** LeafletJS function.
* You can access all the objects and functions within LeafletJS from **L**
* There is extensive documentation:
  * <https://leafletjs.com/reference-1.3.0.html>

```js
L.map('map').setView([51.505, -0.09], 13)
```

# Adding Markers

* Markers add a point to the map
* The text of a marker can be set using a string of HTML

```js
let marker = L.marker([51.5, -0.09]).addTo(mymap);
marker.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
```

# Removing Markers

* Markers can be removed by calling `remove()` on the marker object

```js
let marker = L.marker([51.5, -0.09]).addTo(mymap);
marker.remove();
```

# Adding Polygons

* Polygons are arbitrarily shaped regions of the map
* They can be created and added to the map

```js
let polygon = L.polygon([
      [51.509, -0.08],
      [51.503, -0.06],
      [51.51, -0.047],
    ], { color: 'red'}).addTo(mymap);

// delete the polygon later
polygon.remove()
```

# Other Shapes

Several other map shapes exist:

- Path
- Polyline
- Polygon
- Rectangle
- Circle
- CircleMarker

<https://leafletjs.com/reference-1.3.0.html>

# GeoJSON

* GeoJSON is JSON with specific properties for maps
* It is a simple means to communicate location data
* Alternative to .shp files and the variants; .shx, .prj, .dbf, ect...

```js
{
  "type": "Feature",
  "properties": {
    "name": "My Layer",
    "latitude": 44.0886,
    "longitude": -72.7317
  },
  "geometry": {
    "type": "Polygon",
    "coordinates": [
      [
        [-73.35218221090553, 45.00541896831666],
        [-73.18201496808604, 45.00562770855899],
        [-72.76588580182134, 45.00611110701493],
        [-72.34976762188519, 45.006605491799434],
        ...
        ...
      ]
  }
}
```

```js
let someLayer = L.geoJSON(geoJsonData);
someLayer.addTo(mymap);

```
# Point-within-polygon

* Libraries which exists to check containment of a point in a polygon

<https://github.com/mapbox/leaflet-pip>

### Installation

```html
<script src="https://unpkg.com/@mapbox/leaflet-pip@latest/leaflet-pip.js"></script>
```

### Usage

```js

let layer = L.geoJson(statesData);
let results = leafletPip.pointInLayer([-88, 38], layer);
```

>Note: While Leaflet takes its coordinates in 'lat, long' format Leaflet-PIP takes its coordinates in 'Long, Lat' format.

# Geocoding

Geocoding is the process of converting an address into a set of lat/long coordinates.

Leaflet can only add markers (and polygons, and lines, and...) by using lat/long values. So if we want to add markers at certain addresses we will need to use geocoding to get their lat/long locations.

# Geocoding Services

Geocoding like many mapping problems can be rather tricky.  Luckily there are free resources we can use to do the geocoding for us!  The one we will be using in this lesson is called '[nominatim](https://nominatim.openstreetmap.org/)'

# Nominatim

To get a set of geographic coordinates from nominatim you can go to [nominatim.openstreetmap.org](https://nominatim.openstreetmap.org/) and enter an address in the search bar.

This will redirect you to a zoomed in view of the address, and you will see a blue box with the address on the left side of the screen, underneath the 'search' bar.

Click on the button labeled 'details' to see all sort sof geographic information about the address including the latitude and longitude.

# Success!

You can now use the data from the `Center Point` value, which is in lat, long format, to add a marker to your Leaflet map.

But what if we wanted to add markers for multiple addresses? It would get pretty frustrating having to manually go in and get lat/long values for every address we want to mark.

# Make it Procedural

Let's write a function that when given an address fetches the lat/long value from Nominatim.

First we'll need to send a fetch the data from nominatim. We can use a query parameter in the address we're fetching from to fetch data for a specific address.  Let's also make sur ethe data we get back is easy for us to use.  We can do this by specifying the format we want our response to be in.

```js
function getLatLong(address) {
  fetch(
    `https://nominatim.openstreetmap.org/search/?q=${address}&format=json`
  )
}
```

# Sanitize Your Inputs!

A normal string isn't necessarily url safe.  Luckily we can use the function `encodeURIComponent()` to turn any string into a url safe string.

```js
function getLatLong(address) {
  let urlAddress = encodeURIComponent(address)
  fetch(
    `https://nominatim.openstreetmap.org/search/?q=${urlAddress}&format=json`
  )
}
```

# Translate the Data

Now that we've fetched the data we need from Nominatim we need to translate it into something we can use.  We can do this by chaining promises with `.then()`

> Remember: `.then()` only returns a promise so to get the values out of the function we'll need to have a variable we can manipulate

```js
function getLatLong(address) {
  let urlAddress = encodeURIComponent(address)
  let latLngObj = {
    lat: null,
    long: null
  }

  fetch(
    `https://nominatim.openstreetmap.org/search/?q=${urlAddress}&format=json`
  )
    .then(res => res.json())
    .then(jsonObj => {
      latLngObj.lat = jsonObj[0].lat
      latLngObj.long = jsonObj[0].lon
    })

  return latLngObj
}
```

# Congratulations!

You now have a function that can take any address and get a lat/long object back for that address!