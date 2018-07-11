# Introduction to LeafletJS

* LeafletJS is a JavaScript **library** which allows for the creation of and interaction with web maps.
* It uses a simple API for building maps using **Layers**
* It allows for styling of the map layers using standard CSS and manipulation with JavaScript

# Simple Map Example

* Let's make a simple map!

![](./simple-map-leaflet.png)

```js
@@@js
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
@@@html
 <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css"/>
```

**Then the JavaScript**

> Make sure you put this AFTER Leaflet's CSS

```html
@@@html
 <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"></script>
```

**Then create the map container**

```html
@@@html
<div id="mapid"></div>
```

**Then use CSS to create a height for the container**

```css
@@@css

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
@@@js
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
@@@js
L.map('map').setView([51.505, -0.09], 13)
```

# Adding Markers

* Markers add a point to the map
* The text of a marker can be set using a string of HTML

```js
@@@js
let marker = L.marker([51.5, -0.09]).addTo(mymap);
marker.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
```

# Removing Markers

* Markers can be removed by calling `remove()` on the marker object

```js
@@@js
let marker = L.marker([51.5, -0.09]).addTo(mymap);
marker.remove();
```

# Adding Polygons

* Polygons are arbitrarily shaped regions of the map
* They can be created and added to the map

```js
@@@js
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
@@@js
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
@@@js
let someLayer = L.geoJSON(geoJsonData);
someLayer.addTo(mymap);

```
# Point-within-polygon

* Libraries which exists to check containment of a point in a polygon

<https://github.com/mapbox/leaflet-pip>

### Installation

```html
@@@html
<script src="https://unpkg.com/@mapbox/leaflet-pip@latest/leaflet-pip.js"></script>
```

### Usage

```js
@@@js

let layer = L.geoJson(statesData);
let results = leafletPip.pointInLayer([-88, 38], layer);
```
