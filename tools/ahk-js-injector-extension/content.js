chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {

  console.log(request.clipboardText);
  console.log(location.href);

  var url = request.clipboardText.split("~|sep|~")[0];
  var js = request.clipboardText.split("~|sep|~")[1];

  console.log(url);
  console.log(js);

  if (location.href.includes(url)) {
    eval(js);
  }
});