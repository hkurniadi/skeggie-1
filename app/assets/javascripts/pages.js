function process()
{
  var url="http://localhost:3000/search/" + document.getElementById("semester").value + "/" + document.getElementById("department").value;
  location.href=url;
  return false;
}
