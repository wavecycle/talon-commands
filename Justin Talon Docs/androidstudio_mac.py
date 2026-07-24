from talon import Context, actions

ctx = Context()
ctx.matches = r"""
app: jetbrains
"""

# @ctx.action_class("code")
# class CodeActions:
#     # talon code actions
#     def comment_test():
#         actions.user.idea("action CommentByLineComment")
