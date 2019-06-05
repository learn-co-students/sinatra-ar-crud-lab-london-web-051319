edit.erb:

<p>If you would like to delete the article, please click the button below.</p>
<form action="/articles/<%= @article.id %>" method="post">
  <input id="hidden" type="hidden" name="_method" value="delete">
  <input type="submit" value="delete">
</form>