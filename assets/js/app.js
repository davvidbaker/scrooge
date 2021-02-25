// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html";
import { filthy } from "filthy-rich";

// this initialize function name smells real bad
function handleChange(key) {
  return function(doc) {
    const serializedDoc = JSON.stringify(doc);
    localStorage.setItem(key, serializedDoc);

    fetch(`/fragments/${window.location}`, {
      method: "post",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      },
      body: serializedDoc
    }).then(response => {
      console.log(`🔥  response`, response);
      //do something awesome that makes the world a better place
    });
  };
}

function loadDocFromLocalStorage(key) {
  const doc = localStorage.getItem(key);
  // if (!doc) return;
  // TODO: shouldn't need this, but there is a bug within filthy's undefined doc default, should be removable by
  // uncommenting the previously line
  if (!doc)
    return {
      type: "doc",
      content: [
        {
          type: "paragraph",
          content: []
        }
      ]
    };
  return JSON.parse(doc);
}

const KEY = "filthy-doc-free-write";
const doc = loadDocFromLocalStorage(KEY);

const onChange = handleChange(KEY);
filthy(document.querySelector(".write"), doc, onChange);
