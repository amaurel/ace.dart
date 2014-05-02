library ace.example.autocomplete;

import 'dart:async';
import 'dart:html';
import 'package:ace/ace.dart' as ace;
import 'package:ace/proxy.dart';

main() {
  ace.implementation = ACE_PROXY_IMPLEMENTATION;
  
  // Load the language tools extension.
  ace.LanguageTools langTools = ace.require('ace/ext/language_tools');
  
  // Add a custom auto-completer (advanced usage - not required)
  langTools.addCompleter(new ace.AutoCompleter(
      (editor, session, position, prefix) {    
    return new Future.value([const ace.Completion('answer', 
        snippet:'<answer></answer>', score: 42, meta: 'snarf')]);
  }));
  
  var editor = ace.edit(querySelector('#editor'))
  ..theme = new ace.Theme.named(ace.Theme.TOMORROW)
  ..session.mode = new ace.Mode('ace/mode/html')
  
  // Enable autocompletion.
  ..setOptions({
    // Use the `ctrl + SPACE` keys to trigger basic auto-completion.
    'enableBasicAutocompletion' : true,
    'enableSnippets' : true
  });
}
