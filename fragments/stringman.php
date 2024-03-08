<?php
// 2023-04-16

function markdown_to_html($markdown) {
	
  // Replace bold text with <strong> tags
  // __bold__
  // **bold**
  $markdown = preg_replace("/\*\*(.+?)\*\*/", "<strong>$1</strong>", $markdown);
  $markdown = preg_replace("/__(.+?)__/", "<strong>$1</strong>", $markdown);
  
  // Replace italicized text with <em> tags
  // _text_
  // *text*
  $markdown = preg_replace("/\*(.+?)\*/", "<em>$1</em>", $markdown);
  $markdown = preg_replace("/_(.+?)_/", "<em>$1</em>", $markdown);
  

  // Replace links with <a> tags
  // [text](url)
  $markdown = preg_replace("/\[(.+?)\]\((.+?)\)/", "<a href='$2' rel='nofollow'>$1</a>", $markdown);
  
  // Replace strikethrough text with <s> tags
  // ~~text~~
  $markdown = preg_replace("/~~(.+?)~~/", "<s>$1</s>", $markdown);
  
  // Replace inline code with <code> tags
  // `code`
  $markdown = preg_replace("/`(.+?)`/", "<code>$1</code>", $markdown);
  
  // Replace superscript text with <sup> tags
  // ^text^
  $markdown = preg_replace("/\^(.+?)\^/", "<sup>$1</sup>", $markdown);
  
  // Return the resulting HTML
  return $markdown;
}


function modifyString($string) {
  // Replace any lines that contain only whitespace with a newline
  $string = preg_replace('/^[\s]*$/m', "\n", $string);

  // Replace more than two consecutive newlines with two newlines
  $string = preg_replace('/\n{3,}/', "\n\n", $string);

  // Replace more than two consecutive whitespace characters (other than newlines) with two spaces
  $string = preg_replace('/[\s]{3,}/', "  ", $string);

  return $string;
}
