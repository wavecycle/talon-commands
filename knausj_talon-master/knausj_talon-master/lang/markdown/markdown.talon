mode: command
and mode: user.markdown
mode: command
and mode: user.auto_lang
and code.language: markdown
-
level one: "# "
level two: "## "
level three: "### "
level four: "#### "
level five: "##### "
level six: "###### "

{user.markdown_code_block_language} block:
    "```{markdown_code_block_language}"
    key(enter:2)
    "```"
    key(up)
