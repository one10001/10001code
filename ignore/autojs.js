
async function loadScript(url) {
    let response = await fetch(url);
    let script = await response.text();
    eval(script);
  }
  
  let scriptUrl = 'https://code.jquery.com/jquery-3.6.0.min.js'
  loadScript(scriptUrl);
  