import 'dart:html';

void main() {
  var header = querySelector('#header');
  header.text = "Hello, World!";
  var message = querySelector('#message');

  var begin = true;

  final ButtonElement button = querySelector("button");
  button.onClick.timeout(
    Duration(seconds: 2),
    onTimeout: (sink) {
      sink.addError("Too Slow!! you lost.");
    },
  ).listen(
    (event) {
      message.text = null;
    },
    onError: (e) {
      if (begin) {
        begin = false;
        return;
      }
      print(e);
      message.text = e;
    },
  );
}
