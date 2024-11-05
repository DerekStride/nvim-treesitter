((comment) @injection.content
  (#set! injection.language "comment"))

(heredoc_body
  (heredoc_content) @injection.content
  (heredoc_end) @injection.language
  (#downcase! @injection.language))

(regex
  (string_content) @injection.content
  (#set! injection.language "regex"))

(
  (call
    receiver: (identifier) @receiver
    method: (identifier) @method
    arguments: (argument_list
      (pair
        key: (hash_key_symbol)
        value: (string (string_content) @injection.content))))
  (#eq? @receiver "binding")
  (#eq? @method "b")
  (#set! injection.language "ruby")
)
