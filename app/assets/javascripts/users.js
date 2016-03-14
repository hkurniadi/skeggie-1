function u_search()
{
	var getUrl = window.location;
  var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1] + "/" + getUrl.pathname.split('/')[2];
	if (document.getElementById("search_term").value != "")
	{
		var url= baseUrl + "/" + document.getElementById("search_by").value + "/" + document.getElementById("search_term").value;
		location.href=url;
	}
	else
	{
		location.href=baseUrl;
	}

  return false;
}