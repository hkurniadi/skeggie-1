function process()
{
  var url="http://localhost:3000/search/" + document.getElementById("semester").value + "/" + document.getElementById("department").value;
  if (document.getElementById("coursenum").value != null) {
    url += "/" + document.getElementById("coursenum").value;
  }
  location.href=url;
  return false;
}
