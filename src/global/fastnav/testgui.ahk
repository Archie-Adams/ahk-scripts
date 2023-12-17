#include ../../../libs/Neutron.ahk-1.0.0/Neutron.ahk

html =
(
  <!DOCTYPE html><html>full html document</html>
)


name := new NeutronWindow(html, "<style></style>", "<script></script>", "Hello World")
name.Show("w800 h600")