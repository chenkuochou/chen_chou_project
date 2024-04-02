'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "8c082c5df31c7856f1e060b37429e478",
"index.html": "4bfa9fe3ccbd1adde22f7e4344ba5841",
"/": "4bfa9fe3ccbd1adde22f7e4344ba5841",
"main.dart.js": "08877eea3473098a60911a37885efbdb",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "c5b76043dc6b9e5d54d79756b9fd4020",
"assets/AssetManifest.json": "7ac07f31a759929c0c0fa9c4b10267b0",
"assets/NOTICES": "f4c438182efc58f831366e41765705c2",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "f42c11bc4befc2b5a8fab0b09d9730d5",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "13a022ff38f2952ffedd84078222424d",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/img/motherEarth1-portrait.png": "5b4b403e516b101ba44174ab9a8be227",
"assets/assets/img/motherEarth6-portrait.png": "a812ecc3049f45527fec5b8e425cf6e6",
"assets/assets/img/baseballClassic1-portrait.png": "113d67a4e440cc6e5b123e0926f3b64e",
"assets/assets/img/whisper1-portrait.png": "cb325a06f9202ff63b7ec6d905b6ebbd",
"assets/assets/img/rustland2-portrait.png": "3de494fbf4df24ac296bfa5ba90f8bdb",
"assets/assets/img/whisper6-portrait.png": "7abfd9642c1a013088cc84fa300674cf",
"assets/assets/img/motherEarth7-portrait.png": "b6a94ee78a509701bd1b29b6fadb5b37",
"assets/assets/img/rustland4-portrait.png": "85cac4ea08e8cde51feeae1e755b5885",
"assets/assets/img/whisper7-portrait.png": "e6539cdaa3f385bdee21d5452e23da9d",
"assets/assets/img/rustland3-portrait.png": "e6700387c2e0b50e9688fd32c21e7601",
"assets/assets/img/motherEarth9-portrait.png": "bd272e86e0bf011856a5f92c78f2842f",
"assets/assets/img/motherEarth8-portrait.png": "449ad48f2c83b53556d066b5e28f58cb",
"assets/assets/img/motherEarth2-portrait.png": "5c5d7f3095715ad41008f59edcf4e2a3",
"assets/assets/img/motherEarth5-portrait.png": "84c89b596130ee88ee36c89fba0923dc",
"assets/assets/img/whisper2-portrait.png": "aa6b898d917d5a375ab0d9f205dc20a8",
"assets/assets/img/rustland1-portrait.png": "8ed2cbfa70e9322c25f34adec96f9944",
"assets/assets/img/whisper5-portrait.png": "128582350319ae04a3751de4a1fdc95c",
"assets/assets/img/baseballClassic2-portrait.png": "a6a3fe41ba171b29b96cf5282e12b5e4",
"assets/assets/img/motherEarth4-portrait.png": "d8263caf8cb9f71a59866e1b63ff5dd6",
"assets/assets/img/motherEarth3-portrait.png": "930b079d797dbc4713a0a56b01f2cd05",
"assets/assets/img/whisper4-portrait.png": "0ac7468e433a54026ba4fa1804bb7296",
"assets/assets/img/whisper3-portrait.png": "17bd0c7d802a9df4202fab625193e035",
"assets/assets/img/baseballClassic3-portrait.png": "34743cee53269621f687b595adf8522c",
"assets/assets/img/baseballClassic4-portrait.png": "cae40e221ffe9ca152e4b6a57e93acb1",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
