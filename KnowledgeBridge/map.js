let mapOptions = {
    center: [64.7453, 20.9571],
    zoom: 16
}
let map = new L.map('map', mapOptions);
let layer = new L.TileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png');
map.addLayer(layer);
var markers = [];
var markersLayer = L.featureGroup().addTo(map);
var greenIcon = new L.Icon({
    iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-green.png',
    shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41]
});

function addMarker(x, y, info) {
    
    //let marker = new L.Marker([x, y]);
    //marker.addTo(map);

    let marker = new L.Marker([x, y], {icon: greenIcon}).addTo(map);
    marker.bindPopup(info);
    markers[0] = marker;
    
    //let marker3 = new L.Marker([64.74537, 20.95861]);
    //marker3.addTo(map);
}

function onMapClick(e) {
    
    if (markers.length > 1) {
        map.removeLayer(markers[1]);
    }
    let newMarker = new L.Marker(e.latlng).addTo(map);
    markers[1] = newMarker;

}

map.on('click', onMapClick);