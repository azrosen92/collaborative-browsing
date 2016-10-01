// Import some Broccoli plugins
var compileSass = require('broccoli-sass');
var mergeTrees = require('broccoli-merge-trees');
var Funnel = require('broccoli-funnel');
var browserify = require('broccoli-fast-browserify')

// Specify the Sass and Coffeescript directories
var sassDir = 'app/scss';
var coffeeDir = 'app/coffee';
var manifest = 'manifest.json';
var resources = 'res'

// Tell Broccoli how we want the assets to be compiled
var clListingStyle = compileSass([sassDir], 'styles.scss', 'styles.css');

var scripts = browserify(coffeeDir, {
    bundles: {
        "content_script.js": {
            transform: [
                require('coffee-reactify')
            ],
            entryPoints: ['content_script.coffee']
        },
        "load_craigslist.js": {
            transform: [
                require('coffee-reactify')
            ],
            entryPoints: ['load_craigslist.coffee']
        }
    }
});

var resourceFiles = new Funnel(resources, {
    //destDir: resources
});

// Merge the compiled styles and scripts into one output directory.
module.exports = mergeTrees([clListingStyle, scripts, resourceFiles]);