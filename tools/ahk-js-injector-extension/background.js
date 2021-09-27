chrome.commands.onCommand.addListener(function (command) {
  if (command == 'inject-clipboard') {

    // Get clipboard contents.
    var t = document.createElement("input");
    document.body.appendChild(t);
    t.focus();
    document.execCommand("paste");
    var clipboardText = t.value;
    document.body.removeChild(t);

    // Send clipboard contents to content script.
    const query = { active: true, currentWindow: true };
    chrome.tabs.query(query, (tabs) => {
      chrome.tabs.sendMessage(tabs[0].id, {
        clipboardText: clipboardText
      });
    });

  }
});