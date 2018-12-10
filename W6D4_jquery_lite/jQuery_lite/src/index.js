const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = function (queryStr) {
  if (queryStr instanceof HTMLElement) {
    return new DOMNodeCollection(queryStr);
  }
  const nodes = document.querySelectorAll(queryStr);
  return new DOMNodeCollection(Array.from(nodes));
};
