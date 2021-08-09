//##### Get Mouse position 
// Cursor coordinate functions
var myX, myY, xyOn, myMouseX, myMouseY;
xyOn = true;

function getXYPosition(e) {
    myMouseX = (e || event).clientX;
    myMouseY = (e || event).clientY;
    if (document.documentElement.scrollTop > 0) {
        myMouseY = myMouseY + document.documentElement.scrollTop;
    }       
    if (xyOn) {
        alert("X is " + myMouseX + "\nY is " + myMouseY);
    }
}
function toggleXY() {
    xyOn = !xyOn;
    document.getElementById('xyLink').blur();
    return false;
}   

document.onmouseup = getXYPosition;

// Colarun against

