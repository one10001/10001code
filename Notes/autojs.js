
async function loadScript(url) {
    let response = await fetch(url);
    let script = await response.text();
    eval(script);
  }
  
  let scriptUrl = 'https://code.jquery.com/jquery-3.6.0.min.js'
  loadScript(scriptUrl);

  $("div > colab-run-button").click()
  $("#ok").click()
  $("#connect").click()

  $('.stream > pre').textContent.replaceAll('\n','').concat('"}');

  document.querySelector("div > colab-run-button").click()
  document.querySelector("#ok").click()

//  jQuery("body").html().replace(/Search/g,"Recherche");
//  jQuery('[placeholder="Search"]').attr("placeholder","Recherche");

//refresh the
document.location.reload(true);