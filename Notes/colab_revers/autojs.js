
async function loadScript(url) {
    let response = await fetch(url);
    let script = await response.text();
    eval(script);
  }
  
  let scriptUrl = 'https://code.jquery.com/jquery-3.6.0.min.js'
  loadScript(scriptUrl);

  function keyPress(char) {
    jQuery.event.trigger({ type : 'keypress', which : char.charCodeAt(0) });
  }
  

  $("div > colab-run-button").click()
  $("#ok").click()
  $("#connect").click()
  document.querySelector("div > colab-run-button").click()
  document.querySelector("#ok").click()

// geting data
  $('.stream > pre').textContent.replaceAll('\n','').concat('"}');
  eval(  $('.stream > pre').textContent.replaceAll('\n','').concat('"}'));

//GPU select
document.querySelector('[command="notebook-settings"]').click()
document.querySelector('#accelerator').options.selectedIndex=0 //cpu
document.querySelector('#accelerator').options.selectedIndex=1 //gpu
document.querySelector("#ok").click()


//  jQuery("body").html().replace(/Search/g,"Recherche");
//  jQuery('[placeholder="Search"]').attr("placeholder","Recherche");

//refresh the
document.location.reload(true);

//Check ok box
//GPUs
document.querySelector("#ok").parentElement.parentElement.textContent.match("GPU")

//Error


document.querySelector("div > colab-run-button").click()

function run_cmd() {
  console.log(document.querySelector("div > colab-run-button").title.match("Enter") != null)
  if (document.querySelector("div > colab-run-button").title.match("Enter") != null)
  { 
    console.log("runnning ...")
   document.querySelector("div > colab-run-button").click()
  }
  else {
    console.log("already_working")
  }
}

function stop_cmd() {
  console.log(document.querySelector("div > colab-run-button").title.match("Enter") == null)
  if (document.querySelector("div > colab-run-button").title.match("Enter") != null)
  { 
    console.log("stoping ...")
   document.querySelector("div > colab-run-button").click()
  }
  else {
    console.log("stoped already")
  }
}

function enable_gpu() {

  document.querySelector('[command="notebook-settings"]').click()
document.querySelector('#accelerator').options.selectedIndex=0 //cpu
document.querySelector('#accelerator').options.selectedIndex=1 //gpu
document.querySelector("#ok").click()
}

function disable_gpu() {

document.querySelector('[command="notebook-settings"]').click()
document.querySelector('#accelerator').options.selectedIndex=1 //cpu
document.querySelector('#accelerator').options.selectedIndex=0 //gpu
document.querySelector("#ok").click()
}

che


window.addEventListener('keydown', (e) => {
  console.log(e)
})

window.dispatchEvent(new KeyboardEvent('keydown', {
  key: "Enter",
  keyCode: 13,
  code: "Enter",
  which: 13,
  shiftKey: false,
  ctrlKey: true,
  metaKey: false
}));