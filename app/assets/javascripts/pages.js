function process()
{
  var getUrl = window.location;
  var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
  var url= baseUrl + "/" + document.getElementById("semester").value + "/" + document.getElementById("department").value;
  if (document.getElementById("coursenum").value != null) {
    url += "/" + document.getElementById("coursenum").value + "/" + document.getElementById("sortby").value;
    var tempCourseNum = document.getElementById("coursenum").value;
  }
  var tempSemester = document.getElementById('semester').value;
  
  var tempDepartment = document.getElementById('department').value;
  
  
  location.href=url;
  document.getElementById("semester").value = tempSemester;
  document.getElementById("department").value = tempDepartment;
  document.getElementById("coursenum").value = tempCourseNum;
  return false;
}

function setValue(valueToSelect, idToSelect)
{
  var element = document.getElementById(idToSelect);
  element.value = valueToSelect;
}