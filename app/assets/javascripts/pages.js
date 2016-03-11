function process()
{
  var getUrl = window.location;
	var max = document.getElementById("coursenum").maxLength;
  var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
  var url= baseUrl + "/" + document.getElementById("semester").value + "/" + document.getElementById("department").value;
  if ((document.getElementById("coursenum").value != '') && (document.getElementById("coursenum").value.length == max)) {
    url += "/" + document.getElementById("coursenum").value + "/" + document.getElementById("sortby").value;
    var tempCourseNum = document.getElementById("coursenum").value;
  }
  location.href=url;
  return false;
}

function setValue(valueToSelect, idToSelect)
{
  var element = document.getElementById(idToSelect);
  element.value = valueToSelect;
}