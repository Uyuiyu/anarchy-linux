# Anarchy Linux's Website

This website was created using the [Hugo](https://gohugo.io/) static website framework
and the [Terrassa](https://github.com/danielkvist/hugo-terrassa-theme) hugo theme.

To create new blog posts create a new blank post in hugo like so (while in the anarch-linux directory):

`hugo new posts/post-name.md`

Now you can find the created page in content/posts/post-name.md,
with metadata already filled out.
Write the post however you like (you can commit and push changes even if you're not publishing yet),
then when you're ready to publish, change "draft: true" to "draft: false" and push the changes.

The [deploy.sh](deploy.sh) script uses upstream as the deployment remote -
if testing locally, rename it to origin or whichever remote you are using.
