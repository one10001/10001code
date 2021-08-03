# Colab Alive

## key simulation solutions
https://stackoverflow.com/questions/45098634/how-to-simulate-keypress-with-javascript-in-chrome
https://stackoverflow.com/questions/45098634/how-to-simulate-keypress-with-javascript-in-chrome
https://stackoverflow.com/questions/10455626/keydown-simulation-in-chrome-fires-normally-but-not-the-correct-key/10520017#10520017
https://stackoverflow.com/questions/4158847/how-to-simulate-key-presses-or-a-click-with-javascript
// podiom
https://gist.github.com/ejoubaud/7d7c57cda1c10a4fae8c

https://forum.jquery.com/topic/simulate-keydown-in-autocomplete

$keyboard.click(function() {
      //insert a key value
      e = jQuery.Event ('keydown');
      e.which = value;

      //then trigger an event
      $inputElement.trigger(e);