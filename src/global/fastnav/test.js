let testdata = `
{
  "fastnav": [
    {
      "shortcut": "<+>+G",
      "name": "Google Programs",
      "shortcuts": [
        {
          "name": "Gmail",
          "shortcut": "G::",
          "shortcut-string": "G",
          "ahk": "openURL('www.gmail.com')"
        },
        {
          "name": "Chat",
          "shortcut": "!C::",
          "shortcut-string": "ALT + C",
          "ahk": "openURL('www.googlechat.com')"
        }
      ]
    },
    {
      "shortcut": "<+>+M",
      "name": "Microsoft Programs",
      "shortcuts": [
        {
          "name": "Bing",
          "shortcut": "B::",
          "shortcut-string": "B",
          "ahk": "openURL('www.bing.com')"
        }
      ]
    }
  ],
  "hidden": {}
}
`

function d(json) {

  var obj = JSON.parse(json);
  // var str = obj.fastnav[0].name.toString();
  var output1 = `
    html =
    (
    <!DOCTYPE html><html>
  `

  for (var submenu in obj.fastnav) {
    output1 += obj.fastnav[submenu].name;
  }

  return output1;

}


console.log(d(testdata));