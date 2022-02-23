const { environment } = require("@rails/webpacker");

// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete("nodeModules");
module.exports = environment;

MAPBOX_API_KEY =
  "pk.eyJ1IjoibmFpcmRlc2lnbnMiLCJhIjoiY2t6N3oxZGtyMWY5ejJ2cGhtc283bWtoYiJ9.2Xm0lvF_0guXITdMgqokVg";
